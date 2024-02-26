//
//  HealthManager.swift
//  FitQuest
//
//  Created by Ethan Lukas on 2/21/24.
//

import Foundation
import HealthKit

extension Date
{
    static var startOfToday: Date
    {
        Calendar.current.startOfDay(for: Date())
    }
}

class HealthManager: ObservableObject
{
    
    let healthStore = HKHealthStore()
    
    @Published var activites: [String: Activity] = [:]
    
    @Published var retrieveSteps = 0.0
    
    init()
    {
        
        let steps = HKQuantityType(.stepCount)
        
        let healthTypes: Set = [steps]
        
        Task
        {
            do {
                try await healthStore.requestAuthorization(toShare: [], read: healthTypes)
            } catch {
                print("Error fetching health data")
            }
                
            
        }
    }
    
    
    func fetchTodaySteps()
    {
        let steps = HKQuantityType(.stepCount)
        
        let predicate = HKQuery.predicateForSamples(withStart: .startOfToday, end: Date())
        
        let query = HKStatisticsQuery(quantityType: steps, quantitySamplePredicate: predicate) { _, result, error in guard let quantity = result?.sumQuantity(), error == nil else {
                print("error fetching todays step data")
                return
            }
            
            let stepCount = quantity.doubleValue(for: .count())
            
            self.retrieveSteps = stepCount
            
            //Steps 0
            let activity = Activity(id: 0, title: "Today's Steps", subtitle: "Goal: 10,000", image: "figure.walk", amount: stepCount.formattedString())
            
            
            DispatchQueue.main.async
            {
                self.activites["todaySteps"] = activity
            }
            
            
//            print(stepCount.formattedString())
        }
        
        healthStore.execute(query)
        
    }
    
    
}
    

extension Double
{
    func formattedString() -> String
    {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumFractionDigits = 0
        
        return numberFormatter.string(from: NSNumber(value: self))!
    }
}
