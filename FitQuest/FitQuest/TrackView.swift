//
//  TrackView.swift
//  FitQuest
//
//  Created by Ethan Lukas on 2/21/24.
//

import SwiftUI

struct TrackView: View 
{
    
    @EnvironmentObject var manager: HealthManager
    
    var body: some View
    {
        
        VStack
        {
         
            //Displays today's current steps
            
            LazyVGrid(columns: Array(repeating: GridItem(spacing: 20), count: 2)) 
            {
                ForEach(manager.activites.sorted(by: { $0.value.id < $1.value.id }), id: \.key) { item in ActivityCardView(activity: item.value)}
            }
            
            .padding(.horizontal)
            
        }
        
        .onAppear
        {
            manager.fetchTodaySteps()
        }
            
        
    }
}

#Preview {
    TrackView()
}
