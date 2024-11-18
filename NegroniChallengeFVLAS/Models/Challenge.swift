//
//  Challenge.swift
//  NegroniChallengeFVLAS
//
//  Created by Vincenzo Picone on 17/11/24.
//

import SwiftUI
import SwiftData

enum GoalType: String, Codable {
    case steps
    case kilometers
}

@Model
class Challenge: Identifiable {
    var id: UUID = UUID()
    var goalType: GoalType
    var duration: Int
    var goal: Double
    var startDate: Date
    var endDate: Date?
    var isCompleted: Bool
    var streak: Int
    
    init(goalType: GoalType, duration: Int, goal: Double, startDate: Date = Date(), endDate: Date? = nil, isCompleted: Bool = false, streak: Int = 0) {
        self.id = UUID()
        self.goalType = goalType
        self.duration = duration
        self.goal = goal
        self.startDate = startDate
        self.endDate = endDate
        self.isCompleted = isCompleted
        self.streak = streak
    }
}
