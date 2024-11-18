//
//  ChallengeSetupView.swift
//  NegroniChallengeFVLAS
//
//  Created by Vincenzo Picone on 17/11/24.
//

import SwiftUI
import HealthKit
import SwiftData

struct ChallengeSetupView: View {
    
    @Binding var isPresented: Bool
    @Environment(\.modelContext) private var modelContext  // Contesto per SwiftData
    
    @State private var selectedDuration: Int = 1  // Durata della challenge in settimane
    @State private var selectedGoalType: String = "Steps"  // Tipo di obiettivo (passi o chilometri)
    
    @State private var stepsGoal: Int = 10000  // Obiettivo di passi
    @State private var distanceGoal: Double = 8.0  // Obiettivo di distanza in chilometri
    
    @StateObject private var healthKitManager = HealthKitManager()  // Manager per interagire con HealthKit
    @State private var challengeStarted = false  // Flag per sapere se la challenge è iniziata

    var body: some View {
        NavigationStack {
            VStack (alignment: .leading, spacing: 50) {
                
                HStack() {
                    Text("Duration")
                        .font(.headline)
                    Spacer()
                    
                    Picker("Duration", selection: $selectedDuration) {
                        ForEach(1..<5, id: \.self) { week in
                            Text("\(week) week(s)")
                        }
                    }
                    .pickerStyle(WheelPickerStyle())
                }
                .padding(.top)
                .padding(.horizontal)
                
                // Selezione dell'obiettivo (Passi o Distanza)
                HStack() {
                    Text("Choose Your Goal")
                        .font(.headline)
                    Spacer()
                    Picker("Goal Type", selection: $selectedGoalType) {
                        Text("Steps").tag("Steps")
                        Text("Kilometers").tag("Kilometers")
                    }
                    .pickerStyle(MenuPickerStyle())
                }
                .padding(.horizontal)
                
                // Selezione del goal specifico (Passi o Distanza)
                VStack(alignment: .leading) {
                    if selectedGoalType == "Steps" {
                        // Se è selezionato "Passi"
                        Text("Steps Goal")
                            .font(.headline)
                        
                        Stepper("Steps Goal: \(stepsGoal)", value: $stepsGoal, in: 1000...50000, step: 1000)
                    } else {
                        // Se è selezionato "Distanza"
                        Text("Distance Goal (km)")
                            .font(.headline)
                        
                        Stepper("Distance Goal: \(distanceGoal, specifier: "%.1f") km", value: $distanceGoal, in: 1...50, step: 0.5)
                    }
                }
                .padding(.horizontal)
            }
            Spacer()
            Button(action: startChallenge) {
                Text("Start Challenge")
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding()
                    .frame(width: 250)
                    .background(Color.accentColor)
                    .foregroundColor(.white)
                    .cornerRadius(17)
            }
            .padding()
            Spacer()
            .onAppear {
                // Richiedere permessi a HealthKit quando la vista appare
                healthKitManager.requestAuthorization { success in
                    if success {
                        print("HealthKit authorization successful.")
                    } else {
                        // Gestisci l'errore
                        print("HealthKit authorization failed.")
                    }
                }
            }
            .navigationTitle("Challenge Setup")
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("Cancel") {
                        isPresented = false  // Chiudi il foglio quando si preme "Cancel"
                    }
                }
                
            }
        }
    }
    
    // Funzione per avviare la challenge
    private func startChallenge() {
        print("Starting challenge with goal: \(selectedGoalType == "Steps" ? Double(stepsGoal) : distanceGoal) \(selectedGoalType)")
        
        // Crea l'oggetto Challenge
        let goalType: GoalType = selectedGoalType == "Steps" ? .steps : .kilometers
        let challenge = Challenge(goalType: goalType,
                                  duration: selectedDuration,
                                  goal: selectedGoalType == "Steps" ? Double(stepsGoal) : distanceGoal,
                                  startDate: Date())
        
        // Aggiungi la challenge al database
        do {
            modelContext.insert(challenge)
            try modelContext.save()
        } catch {
            print("Error saving challenge: \(error)")
        }
        
        // Chiudi la vista di setup
        isPresented = false
    }
    
    
}

#Preview {
    ChallengeSetupView(isPresented: .constant(true))
        .environment(\.colorScheme, .dark)
}
