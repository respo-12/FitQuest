//
//  SleepView.swift
//  FitQuest
//
//  Created by Ethan Lukas on 2/22/24.
//

import SwiftUI

struct SleepView: View 
{
    @State private var selectedHour = 7 // Default hour
    @State private var selectedMinute = 0 // Default minute

    var body: some View 
    {
        VStack 
        {
            Text("Select Wake Up Time")
                .font(.title)
                .multilineTextAlignment(.center)
                .padding()
            
            HStack
            {
                Picker(selection: $selectedHour, label: Text(""))
                {
                    ForEach(0..<24, id: \.self)
                    { hour in
                        Text("\(hour)").tag(hour)
                    }
                }
                .labelsHidden()
                
                Picker(selection: $selectedMinute, label: Text(""))
                {
                    ForEach(0..<60, id: \.self) { minute in
                        Text(String(format: "%02d", minute)).tag(minute)
                    }
                }
                .labelsHidden()
            }
        }
    }
}

struct WakeUpTimeSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        SleepView()
    }
}
