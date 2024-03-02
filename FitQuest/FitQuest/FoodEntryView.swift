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
    
<<<<<<< HEAD
=======
    @State private var starRating = 3
    
    
    @State private var calories: Int = 0
    @State private var protein: Int = 0
    @State private var carbohydrates: Int = 0
    @State private var fats: Int = 0
    
    var addFoodItem: (FoodItem) -> Void
    
>>>>>>> Ethan2
    
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
<<<<<<< HEAD
            
            TextField("Protein (g)", text: $mealProtein)
                .padding()
            
            TextField("Carbohydrates (g)", text: $mealCarbohydrates)
                .padding()
            
            TextField("Fats (g)", text: $mealFats)
                .padding()
            
            Button(action: {
                // Save meal information and dismiss popover
=======
                .keyboardType(.numberPad)
            
            TextField("Protein (g)", text: $mealProtein)
                .padding()
                .keyboardType(.numberPad)
            
            TextField("Carbohydrates (g)", text: $mealCarbohydrates)
                .padding()
                .keyboardType(.numberPad)
            
            TextField("Fats (g)", text: $mealFats)
                .padding()
                .keyboardType(.numberPad)
            
            Text("Rating (1-5)")
                .padding(.top)
            
            Picker("Star Rating", selection: $starRating)
            {
                ForEach(1..<6) { rating in
                    Text("\(rating)")
                }
            }
            
            Button(action: 
            {
                saveItem()
>>>>>>> Ethan2
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
        
        
<<<<<<< HEAD
    }
}

#Preview {
    FoodEntryView()
}
=======
        
    }
    
    func saveItem()
    {
        if let caloriesVal = Int(mealCalories)
        {
            calories = caloriesVal
        }
        
        if let proteinVal = Int(mealProtein)
        {
            protein = proteinVal
        }
        
        if let carbValue = Int(mealCarbohydrates)
        {
            carbohydrates = carbValue
        }
        
        if let fatsValue = Int(mealFats)
        {
            fats = fatsValue
        }
        
        
        let foodItem = FoodItem(foodName: mealName, foodCalories: calories, foodProtein: protein, foodFat: fats, foodCarbohydrates: carbohydrates, foodRating: starRating)
        
        
        addFoodItem(foodItem)
    }
    
    
}


struct FoodItem 
{
    let foodName: String
    let foodCalories: Int
    let foodProtein: Int
    let foodFat: Int
    let foodCarbohydrates: Int
    let foodRating: Int
    
}

//#Preview {
//    FoodEntryView()
//}
>>>>>>> Ethan2
