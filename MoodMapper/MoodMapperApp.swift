//
//  MoodMapperApp.swift
//  MoodMapper
//
//  Created by Isaad Khan on 2023-04-06.
//

import Blackbird
import SwiftUI

@main
struct MoodMapperApp: App {
    var body: some Scene {
        WindowGroup {
            ListView()
            // Make the database available to all other views through the environment
                .environment(\.blackbirdDatabase, AppDatabase.instance)
        }
    }
}
