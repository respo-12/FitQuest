//
//  SleepView.swift
//  FitQuest
//
//  Created by Ethan Lukas on 2/22/24.
//

import SwiftUI

struct SleepView: View 
{
//    @State private var selectedHour = 7 // Default hour
//    @State private var selectedMinute = 0 // Default minute
    
    @State private var selectedTime = Date()
    
//    @Binding var selection: String
    
    @State private var showingAlert = false

    var body: some View 
    {
        VStack 
        {
            
            Text("Select Wake Up Time")
                .font(.title)
                .multilineTextAlignment(.center)
                .padding()
            
            
            DatePicker("", selection: $selectedTime, displayedComponents: .hourAndMinute)
                            .datePickerStyle(WheelDatePickerStyle())
                            .labelsHidden()
                            .padding()
            
            
            Button("Get My Personalized BedTime")
            {
                showingAlert = true
//                selection = "Sleep"
            }
            .alert(isPresented: $showingAlert)
            {
                Alert(
                    title: Text("Recommended Sleep Time"),
                    message: Text("Your recommended sleep time is 10:00 PM"),
                    dismissButton: .default(Text("Got it!"))
                )
            }
            
        }
    }
}

struct WakeUpTimeSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        SleepView()
    }
}
