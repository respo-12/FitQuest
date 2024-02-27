//
//  DietView.swift
//  FitQuest
//
//  Created by Ethan Lukas on 2/22/24.
//

import SwiftUI

struct DietView: View
{
    @State private var caloriesConsumed: Double = 500
    @State private var proteinConsumed: Double = 80
    @State private var fatConsumed: Double = 50
    @State private var carbohydratesConsumed: Double = 200
    
    
    let caloriesGoal: Double = 1000
    let proteinGoal: Double = 100
    let fatGoal: Double = 70
    let carbohydratesGoal: Double = 250
    
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
                    FoodEntryView()
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
                    Image("Carbs")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 60)
                    
                    Text("Carbs")
                    
                    Text("\(carbohydratesConsumed) g")
                    
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
                    
                    Text("\(fatConsumed) g")
                    
                }
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(.gray.opacity((0.1)))
                    )
                
                Spacer()
                
                VStack
                {
                    Image("Protein")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 60)
                    
                    Text("Protein")
                    
                    Text("\(proteinConsumed) g")
                    
                }
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(.gray.opacity((0.1)))
                    )
                
            }
            .padding()
            .padding(.bottom)
            
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
                HStack {
                    Text("Current: \(Int(caloriesConsumed))")
                    Spacer()
                    Text("Goal: \(Int(caloriesGoal))")
                }
            }
            .padding(.bottom)
            
            
            VStack {
                Text("Protein")
                ProgressView(value: proteinConsumed, total: proteinGoal)
                    .progressViewStyle(LinearProgressViewStyle(tint: determineBarColor(value: proteinConsumed, goal: proteinGoal)))
                HStack {
                    Text("Current: \(Int(proteinConsumed))")
                    Spacer()
                    Text("Goal: \(Int(proteinGoal))")
                }
            }
            .padding(.bottom)
            
            
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
                HStack {
                    Text("Current: \(Int(fatConsumed))")
                    Spacer()
                    Text("Goal: \(Int(fatGoal))")
                }
            }
            .padding(.bottom)
            
            
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
    
    
}

#Preview {
    DietView()
}
