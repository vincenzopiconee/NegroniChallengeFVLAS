//
//  GradientBackgroundView.swift
//  NegroniChallengeFVLAS
//
//  Created by Vincenzo Picone on 19/11/24.
//

import SwiftUI

struct GradientBackgroundView: View {
    var body: some View {
        LinearGradient(
            stops: [
                Gradient.Stop(color: Color(red: 215.0 / 255.0, green: 42.0 / 255.0, blue: 26.0 / 255.0), location: 0.0),
                Gradient.Stop(color: Color(red: 244.0 / 255.0, green: 6.0 / 255.0, blue: 125.0 / 255.0), location: 1.0)
            ],
            startPoint: .leading,
            endPoint: .trailing
        )
        .edgesIgnoringSafeArea(.all)  // Assicurati che il gradiente copra tutta la schermata
        .blur(radius: 40)  // Applica il blur
    }
}

#Preview {
    GradientBackgroundView()
}
