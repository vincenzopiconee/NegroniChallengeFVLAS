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
        VStack (spacing: 50){
            VStack {
                Image("ICON")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200)
                    .cornerRadius(10)
                Text("HeroFit")
                    .font(.system(size: 30, weight: .semibold))
            }
            
            Text("\"STEP UP POWER UP HERO UP\"")
                .font(.custom("Arial-ItalicMT", size: 60))
                .multilineTextAlignment(.center)
            
            Button(action: {
                AddUser()
                preloadItems()
                showFullScreenPrompt = true
            }, label: {
                ZStack {
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 200, height: 50)
                        .background(LinearGradient(
                            stops: [
                                Gradient.Stop(color: Color(red: 215.0 / 255.0, green: 42.0 / 255.0, blue: 26.0 / 255.0), location: 0.0),
                                Gradient.Stop(color: Color(red: 244.0 / 255.0, green: 6.0 / 255.0, blue: 125.0 / 255.0), location: 1.0)],
                            startPoint: .leading,
                            endPoint: .trailing))
                        .cornerRadius(30)
                    Text("Start Your Journey")
                        .bold()
                        .foregroundStyle(.white)
                }
            })
            .padding()
            .fullScreenCover(isPresented: $showFullScreenPrompt) {
                            ContentView()
                        }
        }
    }
    func AddUser() {
        let user = User(wallet: 1000)
        modelContext.insert(user)
    }
    
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
}
