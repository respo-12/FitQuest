//
//  TrackView.swift
//  FitQuest
//
//  Created by Ethan Lukas on 2/21/24.
//

import SwiftUI

struct TrackView: View 
{
    
    @EnvironmentObject var manager: HealthManager
    
    @State private var currentDate = Date()
    
    @State private var goalCount: Double = 10000
    
    @State private var ratioVar: Double = 0
    
    
    
    @State private var age: Int = 20
    
    @State private var weightLB: Double = 170
    
    @State private var heightIN: Double = 70
    
    @State private var activityNum: String = ""
    
    @State private var activityLevel: Double = 1.55

    
    
    var body: some View
    {
        
        
        VStack(alignment: .center)
        {
            
            //Displays the current date
            Text("\(currentDate, formatter: dateFormatter)")
                .font(.system(size: 30))
                .padding(.bottom)
            
            
            //Display's current today steps
            if let firstActivity = manager.activites.sorted(by: { $0.value.id < $1.value.id }).first
            {
                ActivityCardView(activity: firstActivity.value)
                    .padding(.bottom)
            }
            
            
            if(manager.retrieveSteps >= goalCount)
            {
                Text("Reached Step Count Goal For Today!")
                    .font(.system(size: 20))
                    .padding(.bottom)
            }
            
            
            //Progress Circle
            GeometryReader { geometry in
                ZStack
                {
                    Circle()
                        .stroke(lineWidth: 20)
                        .opacity(0.3)
                        .foregroundColor(Color.gray)
                    
                    Circle()
                        .trim(from: 0.0, to: CGFloat(min(manager.retrieveSteps / goalCount, 1.0)))
                        .stroke(style: StrokeStyle(lineWidth: 20, lineCap: .round, lineJoin: .round))
                        .foregroundColor(Color.blue)
                        .rotationEffect(Angle(degrees: -90))
                    
                    VStack
                    {
                        Text(String(format: "%.0f", (manager.retrieveSteps / goalCount) * 100) + "%")
                            .font(.system(size: 30, weight: .bold))
                        
                        
//                        ratioVar = (manager.retrieveSteps / goalCount) * 100
//                        updateRatio(upd: Double(manager.retrieveSteps / goalCount) * 100)
                        
                        Text("Goal: \(Int(goalCount))")
                            .font(.system(size: 20))
                        
                        HStack {
                            
                            Button(action: 
                            {
                                // Decrease the goal count by 1000, ensuring it doesn't go below 0
                                goalCount = max(goalCount - 1000, 0)
                            }) 
                            {
                                Text("Decrease Goal")
                                    .font(.headline)
                            }
                            .padding()
                            
                            
                            
                            Button(action:
                            {
                                goalCount += 1000
                            })
                            {
                                Text("Increase Goal")
                                    .font(.headline)
                            }
                            .padding()
                        }
                        
                        
                    }
                    
                    
                }
                .padding()
                
                
            }
            
                        
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        
        .onAppear
        {
            manager.fetchTodaySteps()
            
            let stepCalc = calculateStepsGoal()
            
            goalCount = Double(stepCalc)
            
            saveRatioVar()
            
            
        }
        
    }
    
    
    
    //To format the date at the top of the view
    private let dateFormatter: DateFormatter = {
            let formatter = DateFormatter()
            formatter.dateFormat = "MMM d, yyyy"
            return formatter
        }()
    
    
    func updateRatio(upd: Double)
    {
        ratioVar = upd
    }
    
    func saveRatioVar() 
    {
        ratioVar = (manager.retrieveSteps / goalCount) * 100
        UserDefaults.standard.set(ratioVar, forKey: "RatioVar")
    }
    
    
    //Finds numerical activity level given the string chosen in the profile
    func findActiveLevelNum(level: String) -> Double
    {
        
        var ActivityLevelNum: Double = 1.0
        
        if level == "Sedentary"
        {
            ActivityLevelNum = 1.2
        }
            
        else if level == "Lightly Active"
        {
            ActivityLevelNum = 1.375
        }
        
        else if level == "Moderately Active"
        {
            ActivityLevelNum = 1.55
        }
        
        else if level == "Very Active"
        {
            ActivityLevelNum = 1.725
        }
        
        else
        {
            ActivityLevelNum = 1.9
        }
        
        return ActivityLevelNum
        
        
    }
    
    
    
    func calculateStepsGoal() -> Int
    {
        //weightPounds: Double, heightInches: Double, age: Int, activityLevel: Int
        
        
        //Retrieving user age
        if let activeNumLevel = UserDefaults.standard.object(forKey: "ActiveLevel") as? String
        {
            activityNum = activeNumLevel
            activityLevel = findActiveLevelNum(level: activityNum)
        }
        else
        {
            activityLevel = 1.55
        }
        
        //Retrieving user age
        if let age1 = UserDefaults.standard.object(forKey: "Age") as? Int
        {
            age = age1
        }
        else
        {
            age = 20
        }
        
        
        //Retrieve user weight
        if let weight1 = UserDefaults.standard.object(forKey: "Weight") as? Int
        {
            weightLB = Double(weight1)
        }
        else
        {
            weightLB = 160.0
        }
        
        //Retrieve user height
        if let height1 = UserDefaults.standard.object(forKey: "Height") as? Int
        {
            heightIN = Double(height1)
        }
        else
        {
            heightIN = 70.0
        }
        
        
        
        var steps = 10000 // Baseline steps

        // Adjustments based on weight in pounds
        if weightLB < 110 {
            steps += 2000
        } else if weightLB >= 110 && weightLB < 130 {
            steps += 1500
        } else if weightLB >= 130 && weightLB < 150 {
            steps += 1000
        } else if weightLB >= 150 && weightLB < 170 {
            steps += 500
        } else if weightLB >= 170 && weightLB < 190 {
            steps -= 500
        } else if weightLB >= 190 && weightLB < 210 {
            steps -= 1000
        } else {
            steps -= 1500
        }
        
       
        // Adjustments based on height in inches
        if heightIN < 60 { // Less than 5 feet
            steps -= 500
        } else if heightIN >= 60 && heightIN < 64 {
            steps -= 250
        } else if heightIN >= 64 && heightIN < 68 { // 5'4" to 5'7"
            steps += 0 // No adjustment needed for average height
        } else if heightIN >= 68 && heightIN < 72 { // 5'8" to 5'11"
            steps += 250
        } else if heightIN >= 72 { // 6 feet and above
            steps += 500
        }
        

        // Adjustments based on age
        if age < 18 {
            steps += 1500
        } else if age >= 18 && age < 30 {
            steps += 1000
        } else if age >= 30 && age < 40 {
            steps += 500
        } else if age >= 40 && age < 50 {
            steps += 250
        } else if age >= 50 && age < 60 {
            steps -= 250
        } else if age >= 60 && age < 70 {
            steps -= 500
        } else {
            steps -= 1000
        }

        
        // Adjustments based on activity level
        if activityLevel == 1 { // Sedentary
            steps -= 1000
        } else if activityLevel == 2 { // Lightly Active
            steps -= 500
        } else if activityLevel == 4 { // Very Active
            steps += 500
        } else if activityLevel == 5 { // Extra Active
            steps += 1000
        }
       
        return max(1000, steps) // Ensure a minimum step count for health
    }
}




#Preview {
    TrackView()
}
