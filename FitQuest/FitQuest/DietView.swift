//
//  DietView.swift
//  FitQuest
//
//  Created by Ethan Lukas on 2/22/24.
//

import SwiftUI

struct DietView: View
{
    @State private var caloriesConsumed: Int = 0
    @State private var proteinConsumed: Int = 0
    @State private var fatConsumed: Int = 0
    @State private var carbohydratesConsumed: Int = 0
    
    //Set goal for the person in macros
    let caloriesGoal: Int = 2000
    let proteinGoal: Int = 150
    let fatGoal: Int = 67
    let carbohydratesGoal: Int = 200
    
    
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
//                    FoodEntryView()
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
    
}

#Preview {
    DietView()
}
