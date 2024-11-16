//
//  ContentView.swift
//  NegroniChallengeFVLAS
//
//  Created by Vincenzo Picone on 04/11/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    @Query var users: [User]
    
    
    var body: some View {
        
        if users.isEmpty {
            WelcomeView()
        } else {
            TabView {
                HomeView()
                    .tabItem{
                        Image(systemName: "house")
                        Text("HeroFit")
                    }
                JourneyView()
                    .tabItem{
                        Image(systemName: "map")
                        Text("Journey")
                    }
                ShopView()
                    .tabItem{
                        Image(systemName: "basket")
                        Text("HeroShop")
                    }
            }
        }
        
        
        
    }
}

#Preview {
    ContentView()
}
