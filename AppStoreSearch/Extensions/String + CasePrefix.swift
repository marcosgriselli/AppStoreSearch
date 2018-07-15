//
//  String + CasePrefix.swift
//  AppStoreSearch
//
//  Created by Marcos Griselli on 14/07/2018.
//  Copyright © 2018 Marcos Griselli. All rights reserved.
//

import Foundation

extension String {

    func hasCaseInsensitivePrefix(_ s: String) -> Bool {
        return prefix(s.count).caseInsensitiveCompare(s) == .orderedSame
    }
}
