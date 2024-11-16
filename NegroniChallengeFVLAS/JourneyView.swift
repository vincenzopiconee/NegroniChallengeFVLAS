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
