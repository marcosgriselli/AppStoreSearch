//
//  SuggestedTermsTableViewController.swift
//  Canillitapp
//
//  Created by Marcos Griselli on 14/07/2018.
//  Copyright © 2018 Ezequiel Becerra. All rights reserved.
//

import UIKit

class SuggestedTermsTableViewController: UITableViewController {
    
    var searchedTerm = String() {
        didSet {
            currentNames = namesWith(prefix: searchedTerm)
            tableView.reloadOnMainThread()
        }
    }
    private var terms: [Term] = Bundle.main.loadJSONFile(named: "terms")
    private var currentNames = [String]()
    var didSelect: (String) -> Void = { _ in }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currentNames.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! SuggestedTermTableViewCell
        cell.set(term: currentNames[indexPath.row],
                 searchedTerm: searchedTerm)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        didSelect(currentNames[indexPath.row])
    }
    
    func namesWith(prefix: String) -> [String] {
        return terms
            .filter { $0.name.hasCaseInsensitivePrefix(prefix) }
            .sorted { $0.popularity > $1.popularity }
            .map    { $0.name }
    }
}
