//
//  ProfileView.swift
//  NegroniChallengeFVLAS
//
//  Created by Vincenzo Picone on 11/11/24.
//



import SwiftUI

struct ProfileView: View {
    
    var user: User
    
    
    var body: some View {
        VStack {
            user.avatar // Mostra l'avatar dell'utente
            Text("Saldo: \(user.wallet) coins")
                .font(.headline)
            Text("Guardaroba:")
                .font(.subheadline)
            List(user.wardrobe, id: \.id) { item in
                Text(item.name)
            }
        }
                .padding()
    }
}

#Preview {
    ProfileView(user: userExample)
}
