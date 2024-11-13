//
//  AvatarItem.swift
//  NegroniChallengeFVLAS
//
//  Created by Vincenzo Picone on 12/11/24.
//


import SwiftData
import UIKit

@Model
class Item : Identifiable {
    var id: UUID = UUID()
    var imageName: String
    var name: String
    var price: Int
    
    init(imageName: String, name: String, price: Int) {
        self.id = UUID()
        self.imageName = imageName
        self.name = name
        self.price = price
    }
}

struct ItemData {
    static let items: [Item] = [
        // Red
        Item(imageName: "herofitredM", name: "Lava Band", price: 20),
        Item(imageName: "herofitredC", name: "Magma Cape", price: 40),
        Item(imageName: "herofitblueG 8", name: "Inferno Grips", price: 30),
        
        // Orange
        Item(imageName: "herofitorangeM", name: "Sunburst Band", price: 20),
        Item(imageName: "herofitrorangeC", name: "Dusk Defender", price: 40),
        Item(imageName: "herofitblueG 7", name: "Blaze Gloves", price: 30),
        
        // Yellow
        Item(imageName: "herofityellowM", name: "Lightning Wrap", price: 20),
        Item(imageName: "herofityellowC", name: "Dawn Cloak", price: 40),
        Item(imageName: "herofitblueG 6", name: "Thunder Fists", price: 30),
        
        // Green
        Item(imageName: "herofitgreenM", name: "Verdant Veil", price: 20),
        Item(imageName: "herofitgreenC", name: "Nature Guard", price: 40),
        Item(imageName: "herofitblueG 5", name: "Emerald Empower", price: 30),
        
        // Blue
        Item(imageName: "herofitblueM", name: "Wave Band", price: 20),
        Item(imageName: "herofitblueC", name: "Sky Shield", price: 40),
        Item(imageName: "herofitblueG", name: "Aqua Force", price: 30),
        
        // Purple
        Item(imageName: "herofitpurpleM", name: "Mystic Band", price: 20),
        Item(imageName: "herofitpurpleC", name: "Twilight Cloak", price: 40),
        Item(imageName: "herofitblueG 3", name: "Mystic Touch", price: 30),
        
        // Light Blue
        Item(imageName: "herofitcyanM", name: "Breeze Band", price: 20),
        Item(imageName: "herofitcyanC", name: "Crystal Cape", price: 40),
        Item(imageName: "herofitblueG 2", name: "Icy Aura", price: 30),
        
        // Magenta
        Item(imageName: "herofitmagentaM", name: "Spirit Spark", price: 20),
        Item(imageName: "herofitmagentaC", name: "Magenta Might", price: 40),
        Item(imageName: "herofitblueG 4", name: "Spirit Surge", price: 30),
        
        //Aura
        Item(imageName: "SPARKLE", name: "Shining Sparkle", price: 70),
        Item(imageName: "AURARED", name: "Crimson Flame", price: 120),
        Item(imageName: "AURAYELLOW", name: "Golden Glow", price: 120),
        Item(imageName: "AURABLUE", name: "Azure Aura", price: 120),
        Item(imageName: "AURAROSE", name: "Radiant Rose", price: 120),
        Item(imageName: "Group 5", name: "Angel Wings", price: 100),
        Item(imageName: "Group 6", name: "Dragon Wings", price: 100)
    ]
}
