//
//  HealthKitManager.swift
//  NegroniChallengeFVLAS
//
//  Created by Vincenzo Picone on 17/11/24.
//

import HealthKit

class HealthKitManager: ObservableObject {
    private let healthStore = HKHealthStore()
    
    // Richiedi permesso per leggere e scrivere passi e distanza percorsa
    func requestAuthorization(completion: @escaping (Bool) -> Void) {
        // I dati che vogliamo leggere e scrivere
        let stepCount = HKQuantityType.quantityType(forIdentifier: .stepCount)!
        let distanceWalkingRunning = HKQuantityType.quantityType(forIdentifier: .distanceWalkingRunning)!
        
        // Richiedi autorizzazioni
        healthStore.requestAuthorization(toShare: [stepCount, distanceWalkingRunning], read: [stepCount, distanceWalkingRunning]) { (success, error) in
            if let error = error {
                print("Authorization failed: \(error.localizedDescription)")
            }
            completion(success)
        }
    }
    
    // Leggi i passi effettuati oggi
    func getStepsToday(completion: @escaping (Double) -> Void) {
        let stepCount = HKQuantityType.quantityType(forIdentifier: .stepCount)!
        
        // Filtro per oggi
        let calendar = Calendar.current
        let startOfDay = calendar.startOfDay(for: Date())
        let now = Date()
        
        let predicate = HKQuery.predicateForSamples(withStart: startOfDay, end: now, options: .strictEndDate)
        
        // Crea la query per leggere i passi
        let query = HKStatisticsQuery(quantityType: stepCount, quantitySamplePredicate: predicate, options: .cumulativeSum) { _, result, error in
            guard let result = result, let sum = result.sumQuantity() else {
                completion(0.0)
                return
            }
            completion(sum.doubleValue(for: HKUnit.count()))
        }
        
        healthStore.execute(query)
    }
    
    // Leggi la distanza percorsa oggi
    func getDistanceToday(completion: @escaping (Double) -> Void) {
        let distanceWalkingRunning = HKQuantityType.quantityType(forIdentifier: .distanceWalkingRunning)!
        
        // Filtro per oggi
        let calendar = Calendar.current
        let startOfDay = calendar.startOfDay(for: Date())
        let now = Date()
        
        let predicate = HKQuery.predicateForSamples(withStart: startOfDay, end: now, options: .strictEndDate)
        
        // Crea la query per leggere la distanza
        let query = HKStatisticsQuery(quantityType: distanceWalkingRunning, quantitySamplePredicate: predicate, options: .cumulativeSum) { _, result, error in
            guard let result = result, let sum = result.sumQuantity() else {
                completion(0.0)
                return
            }
            completion(sum.doubleValue(for: HKUnit.meter()))
        }
        
        healthStore.execute(query)
    }
}

