//
//  User.swift
//  NegroniChallengeFVLAS
//
//  Created by Vincenzo Picone on 13/11/24.
//

import SwiftUI
import SwiftData

@Model
class User : Identifiable{
    var id: UUID = UUID()
    var wardrobe: [Item]
    var wallet: Int
    @Transient var avatar: AnyView = AnyView(Image("herofitwithoutnothing")
        .padding(.bottom, 30))
    
    init(wardrobe: [Item] = [], wallet: Int = 0, avatar: AnyView) {
        self.id = UUID()
        self.wardrobe = wardrobe
        self.wallet = wallet
        self.avatar = avatar
    }
}

let userExample = User(
    wardrobe: [
        Item(imageName: "", name: "Blaze Band", price: 20),
        Item(imageName: "", name: "Magma Cape", price: 40)
    ],
    wallet: 100,
    avatar: AnyView(Image("herofitwithoutnothing"))
)
