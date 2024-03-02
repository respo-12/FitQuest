//
//  SleepView.swift
//  FitQuest
//
//  Created by Ethan Lukas on 2/22/24.
//

import SwiftUI

struct SleepView: View 
{
<<<<<<< HEAD
//    @State private var selectedHour = 7 // Default hour
//    @State private var selectedMinute = 0 // Default minute
    
    @State private var selectedTime = Date()
    
//    @Binding var selection: String
=======
    
    @State private var selectedTime = Date()
    
>>>>>>> Ethan2
    
    @State private var showingAlert = false

    var body: some View 
    {
        VStack 
        {
            
            Text("Select Wake Up Time")
                .font(.title)
                .multilineTextAlignment(.center)
                .padding()
            
<<<<<<< HEAD
            
=======
            //User selects hour and minute for wakeup time
>>>>>>> Ethan2
            DatePicker("", selection: $selectedTime, displayedComponents: .hourAndMinute)
                            .datePickerStyle(WheelDatePickerStyle())
                            .labelsHidden()
                            .padding()
            
<<<<<<< HEAD
            
=======
            //Gives an alert/popup message that gives the user a recommended bedtime/sleeping time
>>>>>>> Ethan2
            Button("Get My Personalized BedTime")
            {
                showingAlert = true
//                selection = "Sleep"
            }
            .alert(isPresented: $showingAlert)
            {
<<<<<<< HEAD
                Alert(
                    title: Text("Recommended Sleep Time"),
                    message: Text("Your recommended sleep time is 10:00 PM"),
                    dismissButton: .default(Text("Got it!"))
                )
=======
                //If age is stored
                if let savedAge = UserDefaults.standard.object(forKey: "Age") as? Int
                {
                    let recommendedBedtime = calculateRecommendedBedtime()
                    
                    return Alert(
                        title: Text("Recommended Sleep Time"),
                        message: Text("Your recommended sleep time is \(recommendedBedtime)"),
                        dismissButton: .default(Text("Got it!"))
                    )
                } 
                //If age is not stored
                else
                {
                    return Alert(
                        title: Text("Enter Age Information"),
                        message: Text("Input your age in profile to receieve personalized recommended bedtime"),
                        dismissButton: .default(Text("Got it!"))
                    )
                }
                
                
>>>>>>> Ethan2
            }
            
        }
    }
<<<<<<< HEAD
=======
    
    
    //Function to determine how much sleep the user needs based on age
    func recommendedSleep(forAge age: Int) -> Double {
        // based on CDC values and recommendations
        var recommendedHours: Double = 0

        // under 5
        if age <= 5 {
            recommendedHours = 13
        }
        // between 6 and 12
        else if age > 5 && age <= 12 {
            recommendedHours = 10.5
        }
        // between 13 and 18
        else if age > 12 && age <= 18 {
            recommendedHours = 9
        }
        // between 19 and 60
        else if age > 18 && age <= 60 {
            recommendedHours = 7
        }
        // between 61 and 64
        else if age > 60 && age <= 64 {
            recommendedHours = 8
        }
        // over 60
        else {
            recommendedHours = 7.5
        }
       
        return recommendedHours
    }
    
    
    //Uses recommeded hours of sleep and adjusts based on wake up time
    func calculateRecommendedBedtime() -> String {
        // Extract the hour and minute components from the selected wake-up time
        let calendar = Calendar.current
        let components = calendar.dateComponents([.hour, .minute], from: selectedTime)
        guard let hour = components.hour, let minute = components.minute else {
            return "Error"
        }
        
        // Calculate the wake-up time in decimal hours
        let wakeUpTimeDecimal = Double(hour) + Double(minute) / 60.0
        
        // Calculate the recommended sleep time based on the wake-up time and user's age
        
        let age = UserDefaults.standard.integer(forKey: "Age")
        let recommendedSleepHours = recommendedSleep(forAge: age)
        let recommendedBedtimeDecimal = wakeUpTimeDecimal - recommendedSleepHours
        
        // Format the recommended bedtime as a string in HH:MM AM/PM format
        let formatter = DateFormatter()
        formatter.dateFormat = "h:mm a"
        let recommendedBedtimeDate = calendar.date(bySettingHour: Int(recommendedBedtimeDecimal), minute: Int((recommendedBedtimeDecimal.truncatingRemainder(dividingBy: 1)) * 60), second: 0, of: selectedTime)!
        return formatter.string(from: recommendedBedtimeDate)
    }
    
    
>>>>>>> Ethan2
}

struct WakeUpTimeSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        SleepView()
    }
}
