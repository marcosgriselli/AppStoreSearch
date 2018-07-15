//
//  ResultsContainerViewController.swift
//  AppStoreSearch
//
//  Created by Marcos Griselli on 14/07/2018.
//  Copyright © 2018 Marcos Griselli. All rights reserved.
//

import UIKit

class ResultsContainerViewController: ContentStateViewController {
    
    private var suggestionsViewController: SuggestedTermsTableViewController!
    private let appsListViewController = AppsTableViewController()
    var didSelect: (String) -> Void = { _ in }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        suggestionsViewController = storyboard.instantiateViewController(withIdentifier: "SuggestedTermsTableViewController") as! SuggestedTermsTableViewController
        suggestionsViewController.didSelect = didSelect
    }
    
    func handle(term: String, searchType: SearchType) {
        switch searchType {
        case .partial:
            suggestionsViewController.searchedTerm = term
            transition(to: .render(suggestionsViewController))
        case .final:
            appsListViewController.reset()
            appsListViewController.search(term: term)
            transition(to: .render(appsListViewController))
        }
    }
}
