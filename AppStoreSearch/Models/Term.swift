//
//  Term.swift
//  AppStoreSearch
//
//  Created by Marcos Griselli on 14/07/2018.
//  Copyright © 2018 Marcos Griselli. All rights reserved.
//

import Foundation

struct Term: Decodable {
    var name: String
    var popularity: Int //0 - 100 better structure?
}
