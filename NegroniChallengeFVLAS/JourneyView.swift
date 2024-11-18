
//
//  JourneyView.swift
//  NegroniChallengeFVLAS
//
//  Created by Vincenzo Picone on 11/11/24.
//


import SwiftUI
import HealthKit
import SwiftData

// View per monitorare i progressi della challenge
struct ChallengeProgressView: View {
    
    @Query(sort: \Challenge.startDate, order: .reverse) var challenges: [Challenge]  // Carica tutte le challenge dal database
    
    @State private var stepsToday: Double = 0  // Passi fatti oggi
    @State private var distanceToday: Double = 0  // Distanza percorsa oggi
    
    @StateObject private var healthKitManager = HealthKitManager()  // Manager per interagire con HealthKit

    var body: some View {
        NavigationStack {
            VStack(spacing: 16) {
                
                // Sezione Challenge List
                List(challenges) { challenge in
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Challenge Start Date: \(formattedDate(challenge.startDate))")
                            .font(.headline)
                            .foregroundColor(.secondary)
                        
                        Text("Goal: \(challenge.goalType == .steps ? "Steps" : "Kilometers")")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                        
                        // Mostra il progresso della challenge
                        if challenge.goalType == .steps {
                            Text("Steps Goal: \(Int(challenge.goal)) steps")
                            ProgressView("Progress", value: stepsToday, total: challenge.goal)
                                .progressViewStyle(LinearProgressViewStyle(tint: .pink))
                                .padding(.top, 8)
                        } else {
                            Text("Distance Goal: \(challenge.goal, specifier: "%.1f") km")
                            ProgressView("Progress", value: distanceToday, total: challenge.goal)
                                .progressViewStyle(LinearProgressViewStyle(tint: .pink))
                                .padding(.top, 8)
                        }
                        
                        Text("Days Remaining: \(calculateRemainingDays(from: challenge.startDate, duration: challenge.duration))")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 12).fill(Color(.systemGray6)))
                    .padding(.horizontal)
                }
                
                Spacer()
            }
            .onAppear {
                // Richiedere permessi a HealthKit quando la vista appare
                healthKitManager.requestAuthorization { success in
                    if success {
                        fetchTodayStats()  // Recupera i dati di oggi da HealthKit
                    } else {
                        print("HealthKit authorization failed.")
                    }
                }
            }
            .navigationTitle("Your Challenges")
        }
    }

    // Funzione per recuperare le statistiche di oggi
    private func fetchTodayStats() {
        // Calcola i passi e la distanza di oggi
        healthKitManager.getStepsToday { steps in
            self.stepsToday = steps
        }
        
        healthKitManager.getDistanceToday { distance in
            self.distanceToday = distance
        }
    }
    
    // Funzione per calcolare i giorni rimanenti
    private func calculateRemainingDays(from startDate: Date, duration: Int) -> Int {
        let calendar = Calendar.current
        let endDate = calendar.date(byAdding: .weekOfYear, value: duration, to: startDate)!
        let daysRemaining = calendar.dateComponents([.day], from: Date(), to: endDate).day ?? 0
        return max(0, daysRemaining)
    }

    // Funzione per formattare la data
    private func formattedDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter.string(from: date)
    }
}

#Preview {
    ChallengeProgressView()
        .environment(\.colorScheme, .light)
}

/*
 import SwiftUI

 struct JourneyView: View {
     var body: some View {
         NavigationView {
             VStack(spacing: 16) {
                 // Progress Section
                 VStack(spacing: 8) {
                     VStack {
                         Text("PROGRESS")
                             .font(.subheadline)
                             .foregroundColor(.pink)
                             .frame(maxWidth: .infinity, alignment: .leading)
                         
                         Image(systemName: "figure.run")
                             .foregroundColor(.pink)
                             .font(.system(size: 40))
                             .frame(maxWidth: .infinity, alignment: .leading)
                     }
                     
                     Text("50%")
                         .font(.largeTitle)
                         .fontWeight(.bold)
                     
                     ProgressView(value: 0.5)
                         .progressViewStyle(LinearProgressViewStyle(tint: .pink))
                         .frame(height: 8)
                         .background(Color.gray.opacity(0.2))
                         .cornerRadius(4)
                 }
                 .frame(width: 320, height: 170) // Set specific size
                 .padding()
                 .background(RoundedRectangle(cornerRadius: 12)
                                 .fill(Color(.systemGray6)))
                 .padding(.horizontal)
                 
                 // Time and Streak Section
                 HStack(spacing: 12) {
                     VStack(spacing: 4) {
                         HStack {
                             Image(systemName: "clock")
                                 .foregroundColor(.pink)
                             Text("TIME")
                                 .font(.subheadline)
                                 .foregroundColor(.pink)
                         }
                         Text("12d")
                             .font(.title)
                             .fontWeight(.bold)
                         Text("You still have time to complete your challenge")
                             .font(.caption)
                             .multilineTextAlignment(.center)
                             .foregroundColor(.secondary)
                     }
                     .frame(width: 140, height: 160) // Set specific size
                     .padding()
                     .background(RoundedRectangle(cornerRadius: 12)
                                     .fill(Color(.systemGray6)))
                     
                     VStack(spacing: 4) {
                         HStack {
                             Image(systemName: "flame")
                                 .foregroundColor(.pink)
                             Text("STREAK")
                                 .font(.subheadline)
                                 .foregroundColor(.pink)
                         }
                         Text("2 weeks")
                             .font(.title)
                             .fontWeight(.bold)
                         Text("Week streak, keep it up tomorrow!")
                             .font(.caption)
                             .multilineTextAlignment(.center)
                             .foregroundColor(.secondary)
                     }
                     .frame(width: 140, height: 160) // Set specific size
                     .padding()
                     .background(RoundedRectangle(cornerRadius: 12)
                                     .fill(Color(.systemGray6)))
                 }
                 .padding(.horizontal)
                 
                 // Activity Section
                 VStack(spacing: 8) {
                     HStack {
                         Image(systemName: "chart.bar.xaxis")
                             .foregroundColor(.pink)
                         Text("ACTIVITY")
                             .font(.subheadline)
                             .foregroundColor(.pink)
                     }
                     
                     HStack(spacing: 12) {
                         ForEach(["S", "S", "M", "T", "W", "T", "F"], id: \.self) { day in
                             VStack {
                                 Capsule()
                                     .fill(Color.pink)
                                     .frame(width: 8, height: CGFloat.random(in: 20...60))
                                 Text(day)
                                     .font(.caption)
                                     .foregroundColor(.secondary)
                             }
                         }
                     }
                 }
                 .frame(width: 320, height: 170) // Set specific size
                 .padding()
                 .background(RoundedRectangle(cornerRadius: 12)
                                 .fill(Color(.systemGray6)))
                 .padding(.horizontal)
                 
                 Spacer()
             }
             .padding(.top)
             .navigationTitle("Journey")
             .navigationBarItems(trailing: NavigationLink(destination: ChallengeListView()) {
                 Image(systemName: "list.bullet")
             })
         }
     }
 }

 #Preview {
     JourneyView()
 }

 */
