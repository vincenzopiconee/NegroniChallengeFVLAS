//
//  NegroniChallengeFVLASApp.swift
//  NegroniChallengeFVLAS
//
//  Created by Vincenzo Picone on 04/11/24.
//

import SwiftUI
import SwiftData

@main
struct NegroniChallengeFVLASApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: [User.self, Item.self, Challenge.self])
        }
        
    }
}
