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
        
    
    var body: some View {
            NavigationStack {
                    VStack (spacing: 1){
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
                .navigationBarItems(trailing: Button("Edit") {
                    showEditSheet.toggle()
                })
                .sheet(isPresented: $showEditSheet) {
                    EditProfileView()
                }

            }
        }
}

#Preview {
    ProfileView()
}
