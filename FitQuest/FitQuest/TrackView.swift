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
    
    @State private var currentDate = Date()
    
    var body: some View
    {
        
        VStack(alignment: .center)
        {
         
            //Displays the current date
            Text("\(currentDate, formatter: dateFormatter)")
                .font(.system(size: 30))
                .padding(.bottom)
            
            //Displays today's current steps
            
            //--------------------------------------(Old Two Columns)--------------------------------------------------
            
//            LazyVGrid(columns: Array(repeating: GridItem(spacing: 20), count: 2)) 
//            {
//                ForEach(manager.activites.sorted(by: { $0.value.id < $1.value.id }), id: \.key) { item in ActivityCardView(activity: item.value)}
//                
//            }
//            
//            .padding(.horizontal)
//            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .center)
            
            //-----------------------------------------------------------------------------------------------------------------------
            
            //Display's current today steps
            if let firstActivity = manager.activites.sorted(by: { $0.value.id < $1.value.id }).first
            {
                ActivityCardView(activity: firstActivity.value)
                    .padding(.bottom)
            }
            
            
            let goalCount = 10000.0
            
            
            //Progress Circle
            
            GeometryReader { geometry in
                ZStack
                {
                    Circle()
                        .stroke(lineWidth: 20)
                        .opacity(0.3)
                        .foregroundColor(Color.gray)
                    
                    Circle()
                        .trim(from: 0.0, to: CGFloat(min(manager.retrieveSteps / goalCount, 1.0)))
                        .stroke(style: StrokeStyle(lineWidth: 20, lineCap: .round, lineJoin: .round))
                        .foregroundColor(Color.blue)
                        .rotationEffect(Angle(degrees: -90))
                    
                    VStack
                    {
                        Text(String(format: "%.0f", (manager.retrieveSteps / goalCount) * 100) + "%")
                            .font(.system(size: 30, weight: .bold))
                        
                        Text("Goal: \(Int(goalCount))")
                            .font(.system(size: 20))
                    }
                    
                }
                .padding()
            }
            
                        
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        
        .onAppear
        {
            manager.fetchTodaySteps()
        }
            
        
    }
    
    
    
    private let dateFormatter: DateFormatter = {
            let formatter = DateFormatter()
            formatter.dateFormat = "MMM d, yyyy"
            return formatter
        }()
    
    
    
    
    
}






#Preview {
    TrackView()
}
