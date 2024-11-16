//
//  HomeView.swift
//  NegroniChallengeFVLAS
//
//  Created by Vincenzo Picone on 11/11/24.
//

import SwiftUI

struct HomeView: View {
    
    
    
    let texts = [
            "Buongiorno! Oggi è un nuovo giorno.",
            "Sii positivo e abbraccia il cambiamento.",
            "Ogni giorno è una nuova opportunità.",
            "Fai qualcosa che ti renda felice oggi.",
            "Ricorda: la felicità dipende da te!"
        ]
    
    @State private var currentText: String = ""
    
    func getTextForToday() -> String {
            let calendar = Calendar.current
            let currentDate = Date()
            
            // Ottieni il giorno corrente nell'anno (unico per ogni giorno)
            let dayOfYear = calendar.ordinality(of: .day, in: .year, for: currentDate) ?? 0
            
            // Calcola l'indice della lista in base al giorno dell'anno
            let index = dayOfYear % texts.count
            
            return texts[index]
    }
    
    var body: some View {
        NavigationStack {
            VStack{
                ZStack{
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 318.0, height: 68.0)
                        .background(Color(white: 1.0))
                        .cornerRadius(22.1)
                        .shadow(color: .red, radius: 4.0, x: 0.0, y: 0.0)
                    Text(currentText)
                        .font(.custom("SFPro-Medium", size: 14.52))
                        .foregroundColor(Color(white: 0.0))
                        .multilineTextAlignment(.center)
                        .frame(width: 299.3, height: 50.0, alignment: .center)
                        .onAppear {
                                        // Imposta inizialmente il testo
                            currentText = getTextForToday()
                                        
                                        // Crea un timer che aggiorna ogni giorno
                            startDailyTextChange()
                                    }
                    
                }
                .padding(.bottom, 60)
                Image("herofitwithoutnothing")
                    .padding(.bottom, 30)
                Text("Your score")
                    .font(.custom("SFPro-Regular", size: 18.0))
                    .foregroundColor(Color(white: 0.0))
                    .frame(width: 86.0, height: 18.0)
                    .padding(.trailing, 220)
                ZStack{
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 325.0, height: 19.0)
                        .background(Color(white: 240.0 / 255.0))
                        .cornerRadius(29.4)
                    HStack{
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 282.0, height: 19.0)
                            .background(LinearGradient(
                                stops: [
                                    Gradient.Stop(color: Color(red: 215.0 / 255.0, green: 42.0 / 255.0, blue: 26.0 / 255.0), location: 0.0),
                                    Gradient.Stop(color: Color(red: 244.0 / 255.0, green: 6.0 / 255.0, blue: 125.0 / 255.0), location: 1.0)],
                                startPoint: .leading,
                                endPoint: .trailing))
                            .cornerRadius(29.4)
                        Text("84%")
                            .font(.custom("SFPro-Regular", size: 16.0))
                            .foregroundColor(Color(white: 0.0))
                            .multilineTextAlignment(.center)
                            .frame(width: 36.0, height: 13.0, alignment: .center)
                    }
                    
                }
            }
            .navigationTitle("HeroFit")
            
            .navigationBarItems(leading: NavigationLink(
                destination: SettingsView(),
                label: {
                    Image(systemName: "gear")
                }), trailing: NavigationLink(
                    destination: ProfileView(),
                    label: {
                        Image(systemName: "person")
                    })
            )
        }
    }
    
    func startDailyTextChange() {
            // Aggiungi un timer che cambia il testo ogni giorno ad una certa ora (per esempio alle 00:00)
            let calendar = Calendar.current
            let currentDate = Date()
            
            // Calcola la prossima mezzanotte
            let nextMidnight = calendar.nextDate(after: currentDate, matching: .init(hour: 0, minute: 0, second: 0), matchingPolicy: .nextTime)!
            
            // Calcola il tempo rimanente fino alla mezzanotte
            let timeInterval = nextMidnight.timeIntervalSince(currentDate)
            
            // Imposta un timer per aggiornare il testo a mezzanotte
            DispatchQueue.main.asyncAfter(deadline: .now() + timeInterval) {
                // Cambia il testo
                currentText = getTextForToday()
                
                // Imposta un altro timer per il giorno successivo
                startDailyTextChange()
            }
    }
}
#Preview {
    HomeView()
}
