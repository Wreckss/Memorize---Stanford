//
//  Array+Indentifiable.swift
//  Memorize - Stanford
//
//  Created by taco on 6/20/20.
//  Copyright © 2020 tacoTruck. All rights reserved.
//

import Foundation

extension Array where Element: Identifiable {
    func firstIndex(matching: Element) -> Int {
        for index in 0..<self.count {
            if self[index].id == matching.id {
                return index
            }
        }
        return 0
    }
}
