//
//  ShopView.swift
//  NegroniChallengeFVLAS
//
//  Created by Vincenzo Picone on 11/11/24.
//




import SwiftUI

struct ShopView: View {
    @State private var showPurchaseModal = false
    @State private var selectedItem: Item? = nil
    @State private var user = userExample
    
    // Utilizzo di @State per monitorare items dinamici, mostrando solo quelli non sbloccati
    @State private var items = ItemData.items.filter { !$0.unlocked }
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        NavigationView {
            ZStack {
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 20) {
                        ForEach(items, id: \.id) { item in
                            HeroShopItem(item: item, userWallet: user.wallet, showPurchaseModal: $showPurchaseModal, selectedItem: $selectedItem)
                                .frame(maxWidth: .infinity)
                                .onTapGesture {
                                    if user.wallet >= item.price {
                                        selectedItem = item
                                        showPurchaseModal.toggle()
                                    }
                                }
                        }
                    }
                    .padding()
                }
                .navigationTitle("HeroShop")
                
                // Modal di acquisto
                if showPurchaseModal, let selectedItem = selectedItem {
                    ZStack {
                        // Oscuramento completo del background
                        Color.black.opacity(0.5)
                            .ignoresSafeArea() // Rimuove i margini luminosi verticali

                        // Pop-up centrato
                        VStack(spacing: 10) {
                            // Immagine dell'item con spazio sopra per un layout più equilibrato
                            Image(selectedItem.imageName)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 100)
                                .padding(.top, 15)
                            
                            // Testo della domanda su una riga
                            Text("Do you want to purchase \(selectedItem.name)?")
                                .font(.system(size: 14))
                                .multilineTextAlignment(.center)
                                .padding(.horizontal, 10)
                            
                            // Prezzo con "Price" in grassetto
                            HStack {
                                Text("Price:")
                                    .fontWeight(.bold)
                                Text("\(selectedItem.price) points")
                            }
                            .padding(.bottom, 10)
                            
                            // Pulsanti di conferma e annullamento
                            HStack {
                                Button(action: {
                                    purchaseItem(selectedItem)
                                }) {
                                    Text("Unlock")
                                        .fontWeight(.bold)
                                        .frame(width: 140, height: 40)
                                        .background(Color.red)
                                        .foregroundColor(.white)
                                        .cornerRadius(8)
                                }
                                
                                Button(action: {
                                    showPurchaseModal = false
                                }) {
                                    Text("Cancel")
                                        .fontWeight(.bold)
                                        .frame(width: 140, height: 40)
                                        .background(Color.gray)
                                        .foregroundColor(.white)
                                        .cornerRadius(8)
                                }
                            }
                            .padding(.bottom, 15)
                        }
                        .frame(width: 320)
                        .background(Color.white)
                        .cornerRadius(20)
                        .shadow(radius: 10)
                    }
                }
            }
        }
    }
    
    // Funzione per completare l’acquisto dell'item
    func purchaseItem(_ item: Item) {
        if user.wallet >= item.price {
            user.wallet -= item.price
            if let index = ItemData.items.firstIndex(where: { $0.id == item.id }) {
                ItemData.items[index].unlocked = true // Modifica la variabile unlocked dell'item acquistato
            }
            // Aggiorna items per mostrare solo quelli non sbloccati
            items = ItemData.items.filter { !$0.unlocked }
            showPurchaseModal = false
        }
    }
}

#Preview {
    ShopView()
}
