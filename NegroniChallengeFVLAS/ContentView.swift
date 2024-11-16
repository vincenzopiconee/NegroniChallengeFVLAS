//
//  ContentView.swift
//  NegroniChallengeFVLAS
//
//  Created by Vincenzo Picone on 04/11/24.
//



import SwiftUI

struct ContentView: View {
    var body: some View {
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

#Preview {
    ContentView()
}
