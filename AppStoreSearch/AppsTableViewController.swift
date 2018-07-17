//
//  AppsTableViewController.swift
//  AppStoreSearch
//
//  Created by Marcos Griselli on 14/07/2018.
//  Copyright © 2018 Marcos Griselli. All rights reserved.
//

import UIKit
import Kingfisher

class AppsTableViewController: UITableViewController {
    
    var apps = [App]()
    var dataTask: URLSessionDataTask?
    var imagePrefetcher: ImagePrefetcher?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(AppTableViewCell.self)
        tableView.separatorStyle = .none
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return apps.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: AppTableViewCell =
            tableView.dequeueReusableCell(forIndexPath: indexPath)
        cell.configure(app: apps[indexPath.row])
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let cell = cell as? AppTableViewCell else { return }
        cell.cancel()
    }

    /// Searches the input on https://itunes.apple.com/.
    /// For the purpose of a simple blog post this is network call
    /// is placed on the view controller.
    ///
    /// - Parameter term: <#term description#>
    func search(term: String) {
        dataTask?.cancel()
        let encodedTerm = term
            .addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)
        let url = URL(string: "https://itunes.apple.com/search?term=\(encodedTerm ?? String())&entity=software,iPadSoftware&limit=10")!
        dataTask = URLSession.shared.dataTask(with: url) { data, _, _ in
            guard let data = data else { return }
            do {
                let response = try JSONDecoder().decode(AppResponse.self, from: data)
               self.handle(response: response)
            } catch {
                print(error)
            }
            }
        dataTask?.resume()
    }
    
    /// Handles the networking response with the searched apps.
    ///
    /// - Parameter response: AppResponse retrieved from the network.
    private func handle(response: AppResponse) {
        apps = response.results
        let mediaUrls = apps
            .flatMap { $0.media }
            .compactMap { URL(string: $0) }
        imagePrefetcher = ImagePrefetcher(urls: mediaUrls)
        imagePrefetcher?.start()
        tableView.reloadOnMainThread()
    }
}
