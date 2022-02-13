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
        animals = [Animal(name: "호랭이", emoji: "🐯"),
                   Animal(name: "댕댕이", emoji: "🐶"),
                   Animal(name: "냥냥이", emoji: "😻"),
                   Animal(name: "거북이", emoji: "🐢"),
                   Animal(name: "곰돌이", emoji: "🐻")
        ]
    }
}
