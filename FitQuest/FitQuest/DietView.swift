//
//  DietView.swift
//  FitQuest
//
//  Created by Ethan Lukas on 2/22/24.
//

import Foundation
import SwiftUI

struct DietView: View
{
    
    //Stats for macros consumed so far
    @State private var caloriesConsumed: Int = 0
    @State private var proteinConsumed: Int = 0
    @State private var fatConsumed: Int = 0
    @State private var carbohydratesConsumed: Int = 0
    
    //Set goal for the person in macros
    @State private var caloriesGoal: Double = 2000
    @State private var proteinGoal: Double = 150
    @State private var fatGoal: Double = 67
    @State private var carbohydratesGoal: Double = 200
    
    
    @State private var age: Int = 20
    
    @State private var weightLB: Double = 170
    
    @State private var heightIN: Double = 70
    
    @State private var activityNum: String = ""
    
    @State private var activityLevel: Double = 1.55
    
    @State private var calorieRatio: Double = 0

    
    //Store added food items
    @State private var foodItems: [FoodItem] = []
    
    
    @State private var isAddingMeal = false
    
    var body: some View
    {
        
        VStack(alignment: .leading)
        {
            
            
            HStack {
                Spacer()
                Button(action: 
                {
                    isAddingMeal = true
                }) {
                    Text("Add Food/Meal")
                        .foregroundColor(.blue)
                        .font(.headline)
                        .padding(8)
                        .background(Color.white)
                        .cornerRadius(8)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.blue, lineWidth: 1)
                        )
                }
                .padding()
                .popover(isPresented: $isAddingMeal) 
                {
                    // Content for meal entry popover
                    FoodEntryView(addFoodItem: { foodItem in
                                    foodItems.append(foodItem)
                        
                                    // Call a function to update consumed values based on the new food item
                                    updateConsumedValues(with: foodItem)
                                    isAddingMeal = false // Dismiss the popover after adding the food item
                                })
                }
                
            }
            
            
            Text("Today's Macros")
                .font(.title)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
            
            HStack(alignment: .center)
            {
                
                VStack
                {
                    Image("Protein")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 60)
                    
                    Text("Protein")
                    
                    Text("\(Int(proteinConsumed)) g")
                    
                }
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(.gray.opacity((0.1)))
                    )
                
                Spacer()
                
                
                VStack
                {
                    Image("Fats")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 60)
                    
                    Text("Fats")
                    
                    Text("\(Int(fatConsumed)) g")
                    
                }
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(.gray.opacity((0.1)))
                    )
                
                Spacer()
                
                
                VStack
                {
                    Image("Carbs")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 60)
                    
                    Text("Carbs")
                    
                    Text("\(Int(carbohydratesConsumed)) g")
                    
                }
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(.gray.opacity((0.1)))
                    )
                
                
            }
            .padding()
            .padding(.bottom)
            
            
            VStack {
                Text("Calories")
                ProgressView(value: Double(caloriesConsumed), total: Double(caloriesGoal))
                    .progressViewStyle(LinearProgressViewStyle(tint: determineBarColor(value: Double(caloriesConsumed), goal: Double(caloriesGoal))))
                HStack {
                    Text("Current: \(Int(caloriesConsumed))")
                    Spacer()
                    Text("Goal: \(Int(caloriesGoal))")
                }
            }
            .padding(.bottom)
            
            
            VStack {
                Text("Protein")
                ProgressView(value: Double(proteinConsumed), total: Double(proteinGoal))
                    .progressViewStyle(LinearProgressViewStyle(tint: determineBarColor(value: Double(proteinConsumed), goal: Double(proteinGoal))))
                HStack {
                    Text("Current: \(Int(proteinConsumed))")
                    Spacer()
                    Text("Goal: \(Int(proteinGoal))")
                }
            }
            .padding(.bottom)
            
            
            
            VStack {
                Text("Fat")
                ProgressView(value: Double(fatConsumed), total: Double(fatGoal))
                    .progressViewStyle(LinearProgressViewStyle(tint: determineBarColor(value: Double(fatConsumed), goal: Double(fatGoal))))
                HStack {
                    Text("Current: \(Int(fatConsumed))")
                    Spacer()
                    Text("Goal: \(Int(fatGoal))")
                }
            }
            .padding(.bottom)
            
        
            
            VStack {
                Text("Carbohydrates")
                ProgressView(value: Double(carbohydratesConsumed), total: Double(carbohydratesGoal))
                    .progressViewStyle(LinearProgressViewStyle(tint: determineBarColor(value: Double(carbohydratesConsumed), goal: Double(carbohydratesGoal))))
                HStack {
                    Text("Current: \(Int(carbohydratesConsumed))")
                    Spacer()
                    Text("Goal: \(Int(carbohydratesGoal))")
                }
            }
            .padding(.bottom)
            
        }
        
        .onAppear()
        {
            
            saveCalorieVar()
            
            let macroResult = calculateMacros()
            
            let resultBMR = macroResult.bmr
            let resultTDEE = macroResult.tdee
            carbohydratesGoal = macroResult.carbsGrams
            proteinGoal = macroResult.proteinGrams
            fatGoal = macroResult.fatsGrams
            caloriesGoal = (carbohydratesGoal * 4) + (proteinGoal * 4) + (fatGoal * 9)
            
            UserDefaults.standard.set(resultBMR, forKey: "BMR")
            UserDefaults.standard.set(resultTDEE, forKey: "TDEE")
            
        }
        
    }
    
    
    func determineBarColor(value: Double, goal: Double) -> Color {
            return value > goal ? .red : .blue
        }
    
    
    
    //Reset the macros at the start of the day
    func resetMacrosTime()
    {
        let startOfToday = Calendar.current.startOfDay(for: Date())
        
        let currentDate = Date()
        
        if startOfToday != currentDate 
        {
            caloriesConsumed = 0
            proteinConsumed = 0
            fatConsumed = 0
            carbohydratesConsumed = 0
        }
    }
    
    
    
    //Update macros consumed based on food item added
    private func updateConsumedValues(with foodItem: FoodItem) {
        caloriesConsumed += foodItem.foodCalories
        proteinConsumed += foodItem.foodProtein
        fatConsumed += foodItem.foodFat
        carbohydratesConsumed += foodItem.foodCarbohydrates
    }
    
    func saveCalorieVar()
    {
        calorieRatio = (Double(caloriesConsumed)/caloriesGoal) * 100
        UserDefaults.standard.set(calorieRatio, forKey: "CalorieRatio")
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
    
    
    

    func calculateMacros() -> (bmr: Double, tdee: Double, carbsGrams: Double, proteinGrams: Double, fatsGrams: Double)
    {
                
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
        
        // Convert weight from pounds to kilograms and height from inches to centimeters
        let weightKG = weightLB * 0.453592
        let heightCM = heightIN * 2.54
       
        // Calculate BMR
        let bmr = 88.362 + (13.397 * weightKG) + (4.799 * heightCM) - (5.677 * Double(age))
       
        // Calculate TDEE
        let tdee = bmr * activityLevel
       
        // Calculate Macronutrients
        let carbsCalories = tdee * 0.40
        let proteinCalories = tdee * 0.30
        let fatsCalories = tdee * 0.30
       
        let carbsGrams = carbsCalories / 4
        let proteinGrams = proteinCalories / 4
        let fatsGrams = fatsCalories / 9
       
        return (bmr, tdee, carbsGrams, proteinGrams, fatsGrams)
    }
    
    
    
    
    
    
}

#Preview {
    DietView()
}
