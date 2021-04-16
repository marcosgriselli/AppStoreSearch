//
//  UINavigationBar + Shadow.swift
//  AppStoreSearch
//
//  Created by Marcos Griselli on 15/07/2018.
//  Copyright © 2018 Marcos Griselli. All rights reserved.
//

import UIKit

extension UINavigationBar {

    func setShadow(hidden: Bool) {
        setValue(hidden, forKey: "hidesShadow")
    }
}
