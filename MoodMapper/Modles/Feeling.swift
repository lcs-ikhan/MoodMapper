//
//  Feeling.swift
//  MoodMapper
//
//  Created by Isaad Khan on 2023-04-12.
//

import Foundation

struct Feeling: Identifiable {
    var id: Int
    var emoji: String
    var description: String
}

var existingFeelings = [

Feeling(id: 1, emoji: "😎", description: "CHILLIN'")

,


Feeling(id: 2, emoji: "😩", description: "Upset")

,

Feeling(id: 3, emoji: "😳", description: "Embarassed")
    
]
