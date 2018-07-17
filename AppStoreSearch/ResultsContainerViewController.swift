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
    var didSelect: (String) -> Void = { _ in }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        suggestionsViewController = storyboard.instantiateViewController(withIdentifier: "SuggestedTermsTableViewController") as! SuggestedTermsTableViewController
        suggestionsViewController.didSelect = didSelect
    }
    
    /// Manages the view controller that needs to be displayed.
    ///
    /// - Parameters:
    ///   - term: term to search
    ///   - searchType: type of search being performed.
    func handle(term: String, searchType: SearchType) {
        
        /// For this case both view controllers are already
        /// properties of this class but we could create them
        /// at this point and discard them when using a new one.
        switch searchType {
        case .partial:
            suggestionsViewController.searchedTerm = term
            transition(to: .render(suggestionsViewController))
        case .final:
            /// We create a new view controller because the
            /// final search is a lot less frequent than the
            /// active suggestions.
            let appsListViewController = AppsTableViewController()
            appsListViewController.search(term: term)
            transition(to: .render(appsListViewController))
        }
    }
}
