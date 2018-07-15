//
//  ContentStateViewController.swift
//  Canillitapp
//
//  Created by Marcos Griselli on 08/07/2018.
//  Copyright © 2018 Ezequiel Becerra. All rights reserved.
//

import UIKit

class ContentStateViewController: UIViewController {
    private var state: State?
    var shownViewController: UIViewController?
    
    func transition(to newState: State) {
        shownViewController?.remove()
        let vc = viewController(for: newState)
        add(vc)
        shownViewController = vc
        state = newState
    }
}

private extension ContentStateViewController {
    func viewController(for state: State) -> UIViewController {
        switch state {
        case .loading:
            return UIViewController()
        case .render(let viewController):
            return viewController
        }
    }
}

extension ContentStateViewController {
    enum State {
        case loading
        // Add error case.
        case render(UIViewController)
    }
}
