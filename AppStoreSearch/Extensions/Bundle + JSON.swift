//
//  Bundle + JSON.swift
//  AppStoreSearch
//
//  Created by Marcos Griselli on 14/07/2018.
//  Copyright © 2018 Marcos Griselli. All rights reserved.
//

import Foundation

extension Bundle {

    func loadJSONFile<T: Decodable>(named name: String) -> T {
        let path = Bundle.main.path(forResource: name, ofType: "json")
        let url = URL(fileURLWithPath: path!)
        do {
            let data = try Data(contentsOf: url)
            return try JSONDecoder().decode(T.self, from: data)
        } catch {
            fatalError("Invalid JSON structure.")
        }
    }
}
