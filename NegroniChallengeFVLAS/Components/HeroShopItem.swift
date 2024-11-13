//
//  HeroShopItem.swift
//  NegroniChallengeFVLAS
//
//  Created by Vincenzo Picone on 11/11/24.
//


import SwiftUI

struct HeroShopItem: View {
    
    let item: Item
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.clear)
                .frame(width: 109.8, height: 149.0)
                .background(Color(white: 1.0))
                .cornerRadius(17.0)
                .shadow(color: Color(white: 0.0, opacity: 0.5), radius: 4.0, x: 0.0, y: 0.0)
            Image(item.imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 64.0, height: 94.0)
                .padding(.bottom, 40)
            Text(item.name)
                .font(.custom("SFPro-Medium", size: 12.0))
                .frame(height: 14.0)
                .padding(.top, 80)
            Text("\(item.price)")
                .font(.custom("SFPro-Semibold", size: 12.86))
                .foregroundColor(Color(red: 176.0 / 255.0, green: 0.0, blue: 6.0 / 255.0))
                .frame(width: 30, height: 15)
                .padding(.top, 115)
                .padding(.leading, 25)
            Image("superherobyfede")
                .resizable()
                .scaledToFit()
                .frame(width: 20)
                .padding(.top, 115)
                .padding(.trailing, 20)
        }
    }
}

#Preview {
    HeroShopItem(item: Item(imageName: "herofitredM", name: "Blaze Band", price: 100))
}
