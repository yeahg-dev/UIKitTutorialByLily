//
//  AnimalManager.swift
//  SplitViewApp
//
//  Created by 1 on 2022/02/13.
//

import Foundation

struct AnimalManager {
    
    var animals: [Animal] = []
    
    init() {
        animals = [Animal(name: "νΈλ­μ΄", emoji: "π―"),
                   Animal(name: "λλμ΄", emoji: "πΆ"),
                   Animal(name: "λ₯λ₯μ΄", emoji: "π»"),
                   Animal(name: "κ±°λΆμ΄", emoji: "π’"),
                   Animal(name: "κ³°λμ΄", emoji: "π»")
        ]
    }
    
    mutating func delete(at index: Int) {
        animals.remove(at: index)
    }
    
    mutating func update(at index: Int, with string: String?) {
        animals[index].updateDescription(with: string)
    }
}
