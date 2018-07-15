//
//  Array + SafeIndex.swift
//  AppStoreSearch
//
//  Created by Marcos Griselli on 15/07/2018.
//  Copyright © 2018 Marcos Griselli. All rights reserved.
//

import Foundation

extension Collection {

    subscript (safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
