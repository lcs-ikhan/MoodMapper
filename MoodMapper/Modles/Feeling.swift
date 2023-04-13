//
//  Feeling.swift
//  MoodMapper
//
//  Created by Isaad Khan on 2023-04-12.
//

import Blackbird
import Foundation


struct Feeling: BlackbirdModel {
    @BlackbirdColumn var id: Int
    @BlackbirdColumn var emoji: String
    @BlackbirdColumn var description: String
}

