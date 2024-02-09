//
//  ContentView.swift
//  FitQuest
//
//  Created by Ethan Lukas on 2/7/24.
//

import SwiftUI

struct DemoView: View 
{
    
    var body: some View
    {
    
        
        VStack
        {
            

            
            
            Text("FitQuest")
                .bold()
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)

        }
        
        TabView(selection: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Selection@*/.constant(1)/*@END_MENU_TOKEN@*/)
        {
            HomeView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
            }
            
            ProfileView()
                .tabItem {
                    Image(systemName: "person")
                    Text("Profile")
            }
//            Text("Tab Content 1").tabItem { /*@START_MENU_TOKEN@*/Text("Tab Label 1")/*@END_MENU_TOKEN@*/ }.tag(1)
//            Text("Tab Content 2").tabItem { /*@START_MENU_TOKEN@*/Text("Tab Label 2")/*@END_MENU_TOKEN@*/ }.tag(2)
            
        }
        
        
        
        .padding()
    }
}


struct HomeView: View
{
    var body: some View
    {
        
        VStack
        {
            Image("trimmed")
                .resizable()
                .aspectRatio(contentMode: .fit
                )
                .foregroundStyle(.tint)
            
            Text("Level Up Your Health Journey")
                .font(.system(size: 30))
                .multilineTextAlignment(.center)
                .bold()
        }
        
//        .frame(maxWidth: .infinity, maxHeight: .infinity)
//        .background(Color.blue)
        
    }
    
    
}

struct ProfileView: View
{
    @State private var name: String = ""
    
    @State private var selectedGenderIndex = 0
    let genders = ["Male", "Female", "Other"]
    
    @State private var dateOfBirth: String = ""
    @State private var ageString: String = ""
    @State private var weightString: String = ""
    @State private var heightString: String = ""
    
    @State private var homeAddress: String = ""
    @State private var workAddress: String = ""
    
    @State private var gym: String = ""
    @State private var restaurant: String = ""
    
    
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
                
                TextField("Date of Birth (MM/DD/YYYY)", text: $name)
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
                
                
                
                
                Button("Save")
                {
                    // Button to save user information
                    saveUserInfo()
                }
                
                .padding()
            
            }
            
        }
        
    
//        .padding()
//            
//        Text("Profile")
//            .font(.title)
//            .padding()
        
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
    DemoView()
}
