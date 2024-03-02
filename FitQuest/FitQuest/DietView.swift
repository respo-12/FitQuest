//
//  DietView.swift
//  FitQuest
//
//  Created by Ethan Lukas on 2/22/24.
//

<<<<<<< HEAD
=======
import Foundation
>>>>>>> Ethan2
import SwiftUI

struct DietView: View
{
<<<<<<< HEAD
    @State private var caloriesConsumed: Double = 500
    @State private var proteinConsumed: Double = 80
    @State private var fatConsumed: Double = 50
    @State private var carbohydratesConsumed: Double = 200
    
    
    let caloriesGoal: Double = 1000
    let proteinGoal: Double = 100
    let fatGoal: Double = 70
    let carbohydratesGoal: Double = 250
=======
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
    
//    let caloriesGoal: Int = 2000
//    let proteinGoal: Int = 150
//    let fatGoal: Int = 67
//    let carbohydratesGoal: Int = 200
    
    
//    let resultBMR = 0
//    let resultTDEE = 0
    
    
    //Store added food items
    @State private var foodItems: [FoodItem] = []
    
>>>>>>> Ethan2
    
    @State private var isAddingMeal = false
    
    var body: some View
    {
        
        VStack(alignment: .leading)
        {
            
<<<<<<< HEAD
=======
            
>>>>>>> Ethan2
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
<<<<<<< HEAD
                    FoodEntryView()
=======
//                    FoodEntryView()
                    FoodEntryView(addFoodItem: { foodItem in
                                    foodItems.append(foodItem)
                        
                                    // Call a function to update consumed values based on the new food item
                                    updateConsumedValues(with: foodItem)
                                    isAddingMeal = false // Dismiss the popover after adding the food item
                                })
>>>>>>> Ethan2
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
<<<<<<< HEAD
                    Image("Carbs")
=======
                    Image("Protein")
>>>>>>> Ethan2
                        .resizable()
                        .scaledToFit()
                        .frame(width: 60)
                    
<<<<<<< HEAD
                    Text("Carbs")
                    
                    Text("\(carbohydratesConsumed) g")
=======
                    Text("Protein")
                    
                    Text("\(Int(proteinConsumed)) g")
>>>>>>> Ethan2
                    
                }
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(.gray.opacity((0.1)))
                    )
                
                Spacer()
                
<<<<<<< HEAD
=======
                
>>>>>>> Ethan2
                VStack
                {
                    Image("Fats")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 60)
                    
                    Text("Fats")
                    
<<<<<<< HEAD
                    Text("\(fatConsumed) g")
=======
                    Text("\(Int(fatConsumed)) g")
>>>>>>> Ethan2
                    
                }
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(.gray.opacity((0.1)))
                    )
                
                Spacer()
                
<<<<<<< HEAD
                VStack
                {
                    Image("Protein")
=======
                
                VStack
                {
                    Image("Carbs")
>>>>>>> Ethan2
                        .resizable()
                        .scaledToFit()
                        .frame(width: 60)
                    
<<<<<<< HEAD
                    Text("Protein")
                    
                    Text("\(proteinConsumed) g")
=======
                    Text("Carbs")
                    
                    Text("\(Int(carbohydratesConsumed)) g")
>>>>>>> Ethan2
                    
                }
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(.gray.opacity((0.1)))
                    )
                
<<<<<<< HEAD
=======
                
>>>>>>> Ethan2
            }
            .padding()
            .padding(.bottom)
            
<<<<<<< HEAD
//            Spacer()
            
//            Text("Protein")
//                .padding()
//
//            ProgressView(value: proteinConsumed, total: proteinGoal)
//                .progressViewStyle(LinearProgressViewStyle(tint: determineBarColor(value: proteinConsumed, goal: proteinGoal)))
//                .padding(.bottom)
//            
//            Spacer()
            
            
            VStack {
                Text("Calories")
                ProgressView(value: caloriesConsumed, total: caloriesGoal)
                    .progressViewStyle(LinearProgressViewStyle(tint: determineBarColor(value: caloriesConsumed, goal: caloriesGoal)))
=======
            
            VStack {
                Text("Calories")
                ProgressView(value: Double(caloriesConsumed), total: Double(caloriesGoal))
                    .progressViewStyle(LinearProgressViewStyle(tint: determineBarColor(value: Double(caloriesConsumed), goal: Double(caloriesGoal))))
>>>>>>> Ethan2
                HStack {
                    Text("Current: \(Int(caloriesConsumed))")
                    Spacer()
                    Text("Goal: \(Int(caloriesGoal))")
                }
            }
            .padding(.bottom)
            
            
            VStack {
                Text("Protein")
<<<<<<< HEAD
                ProgressView(value: proteinConsumed, total: proteinGoal)
                    .progressViewStyle(LinearProgressViewStyle(tint: determineBarColor(value: proteinConsumed, goal: proteinGoal)))
=======
                ProgressView(value: Double(proteinConsumed), total: Double(proteinGoal))
                    .progressViewStyle(LinearProgressViewStyle(tint: determineBarColor(value: Double(proteinConsumed), goal: Double(proteinGoal))))
>>>>>>> Ethan2
                HStack {
                    Text("Current: \(Int(proteinConsumed))")
                    Spacer()
                    Text("Goal: \(Int(proteinGoal))")
                }
            }
            .padding(.bottom)
            
            
<<<<<<< HEAD
//            Text("Fats")
//                .padding()
//            
//            ProgressView(value: fatConsumed, total: fatGoal)
//                .progressViewStyle(LinearProgressViewStyle(tint: determineBarColor(value: fatConsumed, goal: fatGoal)))
//                .padding(.bottom)
            
            VStack {
                Text("Fat")
                ProgressView(value: fatConsumed, total: fatGoal)
                    .progressViewStyle(LinearProgressViewStyle(tint: determineBarColor(value: fatConsumed, goal: fatGoal)))
=======
            
            VStack {
                Text("Fat")
                ProgressView(value: Double(fatConsumed), total: Double(fatGoal))
                    .progressViewStyle(LinearProgressViewStyle(tint: determineBarColor(value: Double(fatConsumed), goal: Double(fatGoal))))
>>>>>>> Ethan2
                HStack {
                    Text("Current: \(Int(fatConsumed))")
                    Spacer()
                    Text("Goal: \(Int(fatGoal))")
                }
            }
            .padding(.bottom)
            
<<<<<<< HEAD
            
//            Spacer()
            
//            Text("Carbohydrates")
//                .padding()
//            
//            ProgressView(value: carbohydratesConsumed, total: carbohydratesGoal)
//                .progressViewStyle(LinearProgressViewStyle(tint: determineBarColor(value: carbohydratesConsumed, goal: carbohydratesGoal)))
//                .padding(.bottom)
            
            VStack {
                Text("Carbohydrates")
                ProgressView(value: carbohydratesConsumed, total: carbohydratesGoal)
                    .progressViewStyle(LinearProgressViewStyle(tint: determineBarColor(value: carbohydratesConsumed, goal: carbohydratesGoal)))
=======
        
            
            VStack {
                Text("Carbohydrates")
                ProgressView(value: Double(carbohydratesConsumed), total: Double(carbohydratesGoal))
                    .progressViewStyle(LinearProgressViewStyle(tint: determineBarColor(value: Double(carbohydratesConsumed), goal: Double(carbohydratesGoal))))
>>>>>>> Ethan2
                HStack {
                    Text("Current: \(Int(carbohydratesConsumed))")
                    Spacer()
                    Text("Goal: \(Int(carbohydratesGoal))")
                }
            }
            .padding(.bottom)
            
        }
        
<<<<<<< HEAD
=======
        .onAppear()
        {
            let macroResult = calculateMacros()
            
            let resultBMR = macroResult.bmr
            let resultTDEE = macroResult.tdee
            carbohydratesGoal = macroResult.carbsGrams
            proteinGoal = macroResult.proteinGrams
            fatGoal = macroResult.fatsGrams
            caloriesGoal = (carbohydratesGoal * 4) + (proteinGoal * 4) + (fatGoal * 9)
            
        }
        
>>>>>>> Ethan2
    }
    
    
    func determineBarColor(value: Double, goal: Double) -> Color {
            return value > goal ? .red : .blue
        }
    
    
<<<<<<< HEAD
=======
    
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
    
//    func saveBMRandTDEE()
//    {
//        UserDefaults.standard.set(resultBMR, forKey: "BMR")
//        UserDefaults.standard.set(resultTDEE, forKey: "TDEE")
//    }
//    
    
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
    
    
>>>>>>> Ethan2
}

#Preview {
    DietView()
}
