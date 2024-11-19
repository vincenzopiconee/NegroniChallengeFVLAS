//
//  SwiftUIView.swift
//  NegroniChallengeFVLAS
//
//  Created by Vincenzo Picone on 16/11/24.
//

import SwiftUI
import SwiftData

struct WelcomeView: View {
    
    @Environment(\.modelContext) var modelContext
    @State private var showFullScreenPrompt = false

    var body: some View {
        ZStack {
            // Sfondo sfocato
            Color.gray.opacity(100)
            
            LinearGradient(
                stops: [
                    Gradient.Stop(color: Color(red: 215.0 / 255.0, green: 42.0 / 255.0, blue: 26.0 / 255.0), location: 0.0),
                    Gradient.Stop(color: Color(red: 244.0 / 255.0, green: 6.0 / 255.0, blue: 125.0 / 255.0), location: 1.0)],
                startPoint: .leading,
                endPoint: .trailing
            )
             
            .edgesIgnoringSafeArea(.all)
            .blur(radius: 40)
            //.cornerRadius(50)

            VStack(spacing: 40) {
                // Logo e nome dell'app
                VStack(spacing: 10) {
                    Image("ICON")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 180)
                        .cornerRadius(12)
                        .shadow(radius: 10)
                    
                    Text("HeroFit")
                        .font(.system(size: 32, weight: .bold, design: .rounded))
                        .foregroundColor(.white)
                        .shadow(radius: 10)
                }
                
                // Citazione stilizzata
                Text("\"STEP UP POWER UP HERO UP\"")
                    .font(.custom("Arial-ItalicMT", size: 36))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                
                // Pulsante di avvio
                Button(action: {
                    AddUser()
                    preloadItems()
                    showFullScreenPrompt = true
                }) {
                    ZStack {
                        // Gradiente del pulsant
                        
                        LinearGradient(
                            stops: [
                                Gradient.Stop(color: Color(red: 215.0 / 255.0, green: 42.0 / 255.0, blue: 26.0 / 255.0), location: 0.0),
                                Gradient.Stop(color: Color(red: 244.0 / 255.0, green: 6.0 / 255.0, blue: 125.0 / 255.0), location: 1.0)],
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                        .cornerRadius(30)
                        .frame(width: 250, height: 55)
                        .shadow(radius: 10)

                        // Testo del pulsante
                        Text("Start Your Journey")
                            .bold()
                            .foregroundColor(.white)
                            .font(.title2)
                            .shadow(radius: 5)
                    }
                }
                .fullScreenCover(isPresented: $showFullScreenPrompt) {
                    ContentView()
                }
                .padding(.top)
            }
            .padding()
            .padding(20)
        }
        .ignoresSafeArea()
    }

    // Aggiungi un nuovo utente
    func AddUser() {
        let user = User()
        modelContext.insert(user)
    }
    
    // Pre-carica gli oggetti iniziali
    func preloadItems() {
        let initialItems = ItemData.items.map { Item(imageName: $0.imageName, component: $0.component, name: $0.name, price: $0.price, color: $0.color, category: $0.category, unlocked: $0.unlocked)}
            
        for item in initialItems {
            modelContext.insert(item)
        }
            
        do {
            try modelContext.save()
        } catch {
            print("Errore durante il salvataggio degli oggetti iniziali: \(error)")
        }
    }
}

#Preview {
    WelcomeView()
        .environment(\.colorScheme, .dark)
}

