//
//  PurchaseConfirmationView.swift
//  NegroniChallengeFVLAS
//
//  Created by Lorenzo Pizzuto on 13/11/24.
//



import SwiftUI

struct PurchaseConfirmationView: View {
    let item: Item
    @Binding var user: User
    
    var body: some View {
        VStack {
            Text("Vuoi acquistare \(item.name)?")
                .font(.title)
                .padding()
            
            Text("Prezzo: \(item.price) Punti")
                .font(.subheadline)
                .padding()
            
            HStack {
                Button(action: {
                    // Annulla l'acquisto
                    print("Acquisto annullato")
                }) {
                    Text("Annulla")
                        .padding()
                        .background(Color.gray)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                
                Button(action: {
                    // Acquista l'item
                    if user.wallet >= item.price {
                        user.wallet -= item.price // Deduce i punti dal portafoglio
                        if let index = ItemData.items.firstIndex(where: { $0.id == item.id }) {
                            ItemData.items[index].unlocked = true // Modifica lo stato dell'item
                        }
                        print("Acquisto effettuato!")
                    }
                }) {
                    Text("Acquista")
                        .padding()
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
            }
            .padding()
        }
    }
}

#Preview {
    PurchaseConfirmationView(item: Item(imageName: "herofitredM", name: "Blaze Band", price: 100), user: .constant(userExample))
}
