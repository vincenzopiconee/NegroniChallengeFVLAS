//
//  ProfileView.swift
//  NegroniChallengeFVLAS
//
//  Created by Vincenzo Picone on 11/11/24.
//



import SwiftUI
import SwiftData

struct ProfileView: View {
    
    @Environment(\.modelContext) var modelContext
    
    @Query var users: [User]
    
    @State private var showEditModal = false
        
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    // AvatarView fisso in alto con una altezza di 440
                    AvatarView(mask: users.first?.mask, cape: users.first?.cape, gloves: users.first?.gloves, other: users.first?.other)
                        .frame(height: 440) // Impostiamo un'altezza fissa per l'avatar
                    
                    // Riduciamo o rimuoviamo il padding tra l'AvatarView e il testo "Wardrobe"
                    Text("Wardrobe")
                        .font(.system(size: 20, weight: .semibold))
                    
                    VStack {
                        // Sezione per le maschere
                        if let masks = users.first?.wardrobe?.filter({ $0.category == .mask }), !masks.isEmpty {
                            VStack(alignment: .leading, spacing: 1) {
                                Text("Masks:")
                                    .font(.headline)
                                    .padding(.horizontal)
                                ScrollView(.horizontal, showsIndicators: false) {
                                    HStack() {
                                        ForEach(masks) { item in
                                            ProfileItem(item: item)
                                        }
                                    }
                                    .padding()
                                }
                            }
                        }
                        
                        // Sezione per le cappe
                        if let capes = users.first?.wardrobe?.filter({ $0.category == .cape }), !capes.isEmpty {
                            VStack(alignment: .leading, spacing: 1) {
                                Text("Capes:")
                                    .font(.headline)
                                    .padding(.horizontal)
                                ScrollView(.horizontal, showsIndicators: false) {
                                    HStack() {
                                        ForEach(capes) { item in
                                            ProfileItem(item: item)
                                        }
                                    }
                                    .padding()
                                }
                            }
                        }
                        
                        // Sezione per i guanti
                        if let gloves = users.first?.wardrobe?.filter({ $0.category == .gloves }), !gloves.isEmpty {
                            VStack(alignment: .leading, spacing: 1) {
                                Text("Gloves:")
                                    .font(.headline)
                                    .padding(.horizontal)
                                ScrollView(.horizontal, showsIndicators: false) {
                                    HStack() {
                                        ForEach(gloves) { item in
                                            ProfileItem(item: item)
                                        }
                                    }
                                    .padding()
                                }
                            }
                        }
                        
                        // Sezione per gli altri oggetti
                        if let others = users.first?.wardrobe?.filter({ $0.category == .others }), !others.isEmpty {
                            VStack(alignment: .leading, spacing: 1) {
                                Text("Others:")
                                    .font(.headline)
                                    .padding(.horizontal)
                                ScrollView(.horizontal, showsIndicators: false) {
                                    HStack() {
                                        ForEach(others) { item in
                                            ProfileItem(item: item)
                                        }
                                    }
                                    .padding()
                                }
                            }
                        }
                    }
                }
            }
            .navigationTitle("Your Avatar")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(trailing: Button("Edit") {
                showEditModal.toggle() // Mostra la vista modale a schermo intero
            })
            .fullScreenCover(isPresented: $showEditModal) {
                // La vista modale che viene mostrata a schermo intero
                EditProfileView()
            }
        }
    }
}

#Preview {
    ProfileView()
}
