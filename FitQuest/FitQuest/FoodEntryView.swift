//
//  FoodEntryView.swift
//  FitQuest
//
//  Created by Ethan Lukas on 2/25/24.
//

import SwiftUI

struct FoodEntryView: View 
{
    
    // Properties to store meal information
    @State private var mealName = ""
    @State private var mealCalories = ""
    @State private var mealProtein = ""
    @State private var mealCarbohydrates = ""
    @State private var mealFats = ""
    
    
    var body: some View
    {
        
        VStack(alignment: .leading) {
            Text("Enter Meal Information")
                .font(.headline)
                .padding()
            
            TextField("Meal Name", text: $mealName)
                .padding()
            
            TextField("Calories", text: $mealCalories)
                .padding()
            
            TextField("Protein (g)", text: $mealProtein)
                .padding()
            
            TextField("Carbohydrates (g)", text: $mealCarbohydrates)
                .padding()
            
            TextField("Fats (g)", text: $mealFats)
                .padding()
            
            Button(action: {
                // Save meal information and dismiss popover
            }) {
                Text("Save")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(8)
            }
            .padding()
        }
        .padding()
        
        
    }
}

#Preview {
    FoodEntryView()
}
