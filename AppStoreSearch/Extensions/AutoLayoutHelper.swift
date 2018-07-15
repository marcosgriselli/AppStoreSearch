//
//  AutoLayoutHelper.swift
//  AppStoreSearch
//
//  Created by Marcos Griselli on 14/07/2018.
//  Copyright © 2018 Marcos Griselli. All rights reserved.
//

import UIKit

extension UIView {
    
    func centerIn(view: UIView, usingSafeArea: Bool) {
        translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(self)
        let layoutGuide = usingSafeArea ?
            view.safeAreaLayoutGuide : view.layoutMarginsGuide
        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: layoutGuide.topAnchor),
            leftAnchor.constraint(equalTo: layoutGuide.leftAnchor),
            bottomAnchor.constraint(equalTo: layoutGuide.bottomAnchor),
            rightAnchor.constraint(equalTo: layoutGuide.rightAnchor)
            ])
    }
}
