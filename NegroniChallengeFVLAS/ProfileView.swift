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
    
    @State private var showEditSheet = false

    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
        
    
    var body: some View {
            NavigationStack {
                    VStack (spacing: 1){
                        /*
                        HStack (spacing: 3){
                            Text("Wallet:") // DA METTERE NELLO SHOP VIEW INVECE CHE NEL PROFILE VIEW
                                .font(.system(size: 17, weight: .semibold))
                            Image("superherobyfede")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 25)
                            Text("\(users.first?.wallet ?? 0)")
                                .font(.system(size: 17, weight: .semibold))
                        }
                        .padding(.trailing, 240)
                        .padding(.bottom, 20)
                        */
                        AvatarView(mask: users.first?.mask, cape: users.first?.cape, gloves: users.first?.gloves, other: users.first?.other)
                        Text("Wardrobe")
                            .font(.system(size: 20, weight: .semibold))
                            .padding()
                        ScrollView {
                            VStack {
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

                                if let gloves = users.first?.wardrobe?.filter({ $0.category == .gloves }), !gloves.isEmpty {
                                    VStack(alignment: .leading, spacing: 1) {
                                        Text("Capes:")
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
                                
                                if let others = users.first?.wardrobe?.filter({ $0.category == .others }), !others.isEmpty {
                                    VStack(alignment: .leading, spacing: 1) {
                                        Text("Capes:")
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
                .padding()
                .navigationTitle("Your Avatar")
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarItems(leading: Button("Add") { AddUser() },trailing: Button("Edit") {
                    showEditSheet.toggle()
                })
                .sheet(isPresented: $showEditSheet) {
                    EditProfileView()
                }

            }
        }
    func AddUser() {
        let user = User(wallet: 100, mask: Item(color: .red, category: .mask), cape: Item(color: .yellow, category: .cape), gloves: Item(color: .blue, category: .gloves))
        modelContext.insert(user)
    }
}

#Preview {
    ProfileView()
}
