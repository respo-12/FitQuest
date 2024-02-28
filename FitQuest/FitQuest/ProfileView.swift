//
//  ProfileView.swift
//  FitQuest
//
//  Created by Ethan Lukas on 2/21/24.
//

import SwiftUI

struct ProfileView: View
{
    
    @State private var profileAlert = false
    
    
    @State private var name: String = ""
    
    @State private var selectedGenderIndex = 0
    let genders = ["Male", "Female", "Other"]
    
    @State private var foodPreference = "None of the above"
    let foodPreferenceList = ["Vegan", "Vegetarian", "Gluten-Free", "None of the above"]
    
    @State private var dateOfBirth: String = ""
    @State private var ageString: String = ""
    @State private var weightString: String = ""
    @State private var heightString: String = ""
    
    @State private var homeAddress: String = ""
    @State private var workAddress: String = ""
    
    @State private var gym: String = ""
    @State private var restaurant: String = ""
    
    @State private var healthGoalIndex = 0
    let healthGoals = ["Lose Weight", "Maintenance", "Gain Weight"]
    
    
    @State private var age: Int = 0
    @State private var weight: Int = 0
    @State private var height: Int = 0
    
    var body: some View
    {
        
        
        
        //Name, Age, Height, Home Address, Work Address, two other favorite places, DoB, gender
        
        //User manually inputs their information to store
        
        ScrollView
        {
            VStack
            {
                
                TextField("First and Last Name", text: $name)
                    .padding()
                
                TextField("Age", text: $ageString)
                    .padding()
                    .keyboardType(.numberPad) // Set keyboard type to number pad
                
                TextField("Date of Birth (MM/DD/YYYY)", text: $dateOfBirth)
                    .padding()
                
                Text("Gender:")
                    .padding(.top, 5)
                
                Picker("Gender", selection: $selectedGenderIndex)
                {
                    ForEach(genders.indices, id: \.self)
                    {
                        index in Text(self.genders[index])
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                
                TextField("Weight (lbs)", text: $weightString)
                    .padding()
                    .keyboardType(.decimalPad) // Set keyboard type to decimal pad
                
                TextField("Height (inches)", text: $heightString)
                    .padding()
                    .keyboardType(.numberPad) // Set keyboard type to decimal pad
                
                TextField("Address (Home)", text: $homeAddress)
                    .padding()
                
                TextField("Address (Work)", text: $workAddress)
                    .padding()
                
                TextField("Favorite restaurant", text: $restaurant)
                    .padding()
                
                TextField("Favorite Gym", text: $gym)
                    .padding()
                
                
                Text("Health Goal:")
                    .padding(.top, 5)
                
                Picker("Health Goal", selection: $healthGoalIndex)
                {
                    
                    ForEach(healthGoals.indices, id: \.self)
                    {
                        index in Text(self.healthGoals[index])
                    }
                    
                }
                .pickerStyle(SegmentedPickerStyle())
                
                Text("Diet Preference:")
                    .padding(.top, 10)
                    
                
                Picker("Select Option", selection: $foodPreference) {
                    ForEach(foodPreferenceList, id: \.self) { option in
                        Text(option)
                    }
                }
                .pickerStyle(MenuPickerStyle())

    
                
                Spacer()
                

                Button("Save")
                {
                    // Button to save user information
                    saveUserInfo()
                    profileAlert = true
                }
                .alert(isPresented: $profileAlert)
                {
                    Alert(
                        title: Text("Profile Saved"),
                        message: Text("Your Changes Have Been Saved"),
                        dismissButton: .default(Text("Got it!"))
                    )
                }
                
                .padding()
                
            }
            
        }
        

        
    }
    
    func saveUserInfo()
    {
        
        if let ageValue = Int(ageString)
        {
            age = ageValue
        }
        
        if let weightValue = Int(weightString) {
            weight = weightValue
        }
        
        if let heightValue = Int(heightString) {
            height = heightValue
        }
        
        //Save Gender
        let selectedGender = genders[selectedGenderIndex]
                UserDefaults.standard.set(selectedGender, forKey: "Gender")
        
        //Save health goal
        let healthGoal = healthGoals[healthGoalIndex]
                UserDefaults.standard.set(healthGoal, forKey: "Health Goal")
        
        // Save user information
        UserDefaults.standard.set(name, forKey: "Name")
        UserDefaults.standard.set(age, forKey: "Age")
        UserDefaults.standard.set(dateOfBirth, forKey: "DateOfBirth")
        UserDefaults.standard.set(weight, forKey: "Weight")
        UserDefaults.standard.set(height, forKey: "Height")
        
        UserDefaults.standard.set(homeAddress, forKey: "HomeAddress")
        UserDefaults.standard.set(workAddress, forKey: "WorkAddress")
        
        UserDefaults.standard.set(restaurant, forKey: "Restaurant")
        UserDefaults.standard.set(gym, forKey: "Gym")
        
            
    }
    
}

#Preview {
    ProfileView()
}
