//
//  JourneyView.swift
//  NegroniChallengeFVLAS
//
//  Created by Vincenzo Picone on 11/11/24.
//

import SwiftUI

struct JourneyView: View {
    var body: some View {
        
        NavigationView {
            Text(" ")
            .navigationTitle("Journey")
            .navigationBarItems(trailing: NavigationLink (destination: ChallengeListView(), label: {
                Image(systemName: "list.bullet")
            }))
            }
    }
}

#Preview {
    JourneyView()
}
