//
//  ProfileItem.swift
//  NegroniChallengeFVLAS
//
//  Created by Vincenzo Picone on 13/11/24.
//


import SwiftUI

struct ProfileItem: View {
    
    let item: Item
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.clear)
                .frame(width: 109.8, height: 149.0)
                .background(Color(white: 1.0))
                .cornerRadius(17.0)
                .shadow(color: Color(white: 0.0, opacity: 0.5), radius: 4.0, x: 0.0, y: 0.0)
            VStack(spacing: 10) {
                Image(item.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 70, height: 100)
                Text(item.name)
                    .font(.system(size: 15))
                    .multilineTextAlignment(.center)
            }
        }
    }
}

#Preview {
    ProfileItem(item: Item(imageName: "herofitredM", name: "Blaze Band", price: 100, color: .red, category: .mask))
}
