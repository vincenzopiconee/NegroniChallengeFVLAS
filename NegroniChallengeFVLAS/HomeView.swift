//
//  HomeView.swift
//  NegroniChallengeFVLAS
//
//  Created by Vincenzo Picone on 11/11/24.
//

import SwiftUI
import SwiftData

struct HomeView: View {
    
    let texts = [
        "Today is your day – make it count!",
        "Small steps every day lead to big results.",
        "Start strong, finish stronger.",
        "You’ve got this – one step at a time.",
        "Every move you make is progress.",
        "Push yourself; you’re stronger than you think.",
        "Keep going – greatness is on the other side of effort.",
        "Believe in yourself and keep moving forward.",
        "Every day is a chance to be better than yesterday.",
        "Focus on progress, not perfection.",
        "Take one more step – you’re closer than you think.",
        "You’re capable of amazing things.",
        "Your hard work will pay off.",
        "Small efforts each day add up to big change.",
        "Challenge yourself – you’re stronger than you know.",
        "One step today is closer to your goals tomorrow.",
        "Stay positive, stay active, stay strong.",
        "Your future self will thank you for today’s efforts.",
        "Keep pushing; every step brings you closer.",
        "You can do this – believe in yourself!",
        "Great things never come from comfort zones.",
        "Take a deep breath and crush today’s goals.",
        "Your strength grows with every challenge.",
        "Dream big, work hard, stay focused.",
        "The only limit is the one you set for yourself.",
        "Don’t give up – success is around the corner.",
        "You’re one day closer to achieving your goals.",
        "Get up, get moving, and give it your all.",
        "Your effort today fuels your success tomorrow.",
        "Stay focused, stay driven, stay strong.",
        "Make today a victory for your future self.",
        "One day at a time, you’re making progress.",
        "Rise up to the challenge; greatness awaits.",
        "You have everything it takes to succeed.",
        "Believe in the power of your own strength.",
        "Every small win is a step closer to your goals.",
        "The journey is tough, but the reward is worth it.",
        "You’re unstoppable when you set your mind to it.",
        "Keep going; every effort is a step forward.",
        "Today is a new opportunity to become your best."
    ]
    
    @Query var users: [User]
    @State private var currentText: String = ""
    
    func getTextForToday() -> String {
        let calendar = Calendar.current
        let currentDate = Date()
        let dayOfYear = calendar.ordinality(of: .day, in: .year, for: currentDate) ?? 0
        let index = dayOfYear % texts.count
        return texts[index]
    }
    
    var body: some View {
        NavigationStack {
            GeometryReader { geometry in
                ZStack {
                    VStack {
                        Spacer() // Usa questo per dare spazio senza influire sui layout
                        AvatarView(mask: users.first?.mask, cape: users.first?.cape, gloves: users.first?.gloves, other: users.first?.other)
                        Spacer()
                    }
                    // Elementi fissi usando posizionamento assoluto
                    VStack {
                        ZStack {
                            Rectangle()
                                .foregroundColor(.clear)
                                .frame(width: 318.0, height: 55)
                                .background(Color(white: 1.0))
                                .cornerRadius(22.1)
                                .shadow(color: .red, radius: 4.0, x: 0.0, y: 0.0)
                            Text(currentText)
                                .font(.custom("Arial-ItalicMT", size: 15))
                                .foregroundColor(Color(white: 0.0))
                                .multilineTextAlignment(.center)
                                .frame(width: 299.3, height: 50.0, alignment: .center)
                                .onAppear {
                                    currentText = getTextForToday()
                                    startDailyTextChange()
                                }
                        }
                        .position(x: geometry.size.width / 2, y: 50)
                        
                        Spacer()
                        
                        VStack {
                            Text("Your score")
                                .font(.system(size: 18))
                                .foregroundColor(Color(white: 0.0))
                                .frame(width: 86.0, height: 18.0)
                                .padding(.trailing, 220)
                            
                            ZStack {
                                Rectangle()
                                    .foregroundColor(.clear)
                                    .frame(width: 325.0, height: 19.0)
                                    .background(Color(white: 240.0 / 255.0))
                                    .cornerRadius(29.4)
                                HStack {
                                    Rectangle()
                                        .foregroundColor(.clear)
                                        .frame(width: 282.0, height: 19.0)
                                        .background(LinearGradient(
                                            stops: [
                                                Gradient.Stop(color: Color(red: 215.0 / 255.0, green: 42.0 / 255.0, blue: 26.0 / 255.0), location: 0.0),
                                                Gradient.Stop(color: Color(red: 244.0 / 255.0, green: 6.0 / 255.0, blue: 125.0 / 255.0), location: 1.0)
                                            ],
                                            startPoint: .leading,
                                            endPoint: .trailing))
                                        .cornerRadius(29.4)
                                    Text("84%")
                                        .font(.system(size: 16))
                                        .foregroundColor(Color(white: 0.0))
                                        .multilineTextAlignment(.center)
                                        .frame(width: 36.0, height: 13.0, alignment: .center)
                                }
                            }
                        }
                        .position(x: geometry.size.width / 2, y: 250)
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
        let calendar = Calendar.current
        let currentDate = Date()
        let nextMidnight = calendar.nextDate(after: currentDate, matching: .init(hour: 0, minute: 0, second: 0), matchingPolicy: .nextTime)!
        let timeInterval = nextMidnight.timeIntervalSince(currentDate)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + timeInterval) {
            currentText = getTextForToday()
            startDailyTextChange()
        }
    }
}

#Preview {
    HomeView()
}
