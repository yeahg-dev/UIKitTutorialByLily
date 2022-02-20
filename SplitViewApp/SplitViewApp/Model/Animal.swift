//
//  Animal.swift
//  SplitViewApp
//
//  Created by 1 on 2022/02/13.
//

import UIKit

struct Animal {
    
    let name: String?
    let emoji: String?
    var description: String?
    
    mutating func updateDescription(with string: String?) {
        description = string
    }
}

