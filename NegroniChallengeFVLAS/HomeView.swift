//
//  HomeView.swift
//  NegroniChallengeFVLAS
//
//  Created by Vincenzo Picone on 11/11/24.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationStack {
            VStack{
                
            }
            .navigationTitle("HeroFit")
            
            .navigationBarItems(leading: NavigationLink(
                destination: SettingsView(),
                label: {
                    Image(systemName: "gear")
                }), trailing: NavigationLink(
                    destination: ProfileView(),
                    label: {
                        Image(systemName: "person")
                    })
            )
        }
    }
}

#Preview {
    HomeView()
}
