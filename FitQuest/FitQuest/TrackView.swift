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
    
    @State private var goalCount: Double = 10000
    
    @State private var ratioVar: Double = 0
    

    
    var body: some View
    {
        
        
        VStack(alignment: .center)
        {
            
            //Displays the current date
            Text("\(currentDate, formatter: dateFormatter)")
                .font(.system(size: 30))
                .padding(.bottom)
            
            
            //Display's current today steps
            if let firstActivity = manager.activites.sorted(by: { $0.value.id < $1.value.id }).first
            {
                ActivityCardView(activity: firstActivity.value)
                    .padding(.bottom)
            }
            
            
            if(manager.retrieveSteps >= goalCount)
            {
                Text("Reached Step Count Goal For Today!")
                    .font(.system(size: 20))
                    .padding(.bottom)
            }
            
            
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
                        
                        
//                        ratioVar = (manager.retrieveSteps / goalCount) * 100
//                        updateRatio(upd: Double(manager.retrieveSteps / goalCount) * 100)
                        
                        Text("Goal: \(Int(goalCount))")
                            .font(.system(size: 20))
                        
                        HStack {
                            
                            Button(action: 
                            {
                                // Decrease the goal count by 1000, ensuring it doesn't go below 0
                                goalCount = max(goalCount - 1000, 0)
                            }) 
                            {
                                Text("Decrease Goal")
                                    .font(.headline)
                            }
                            .padding()
                            
                            
                            
                            Button(action:
                            {
                                goalCount += 1000
                            })
                            {
                                Text("Increase Goal")
                                    .font(.headline)
                            }
                            .padding()
                        }
                        
                        
                    }
                    
                    
                }
                .padding()
                
                
            }
            
                        
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        
        .onAppear
        {
            manager.fetchTodaySteps()
            saveRatioVar()
        }
        
    }
    
    
    
    //To format the date at the top of the view
    private let dateFormatter: DateFormatter = {
            let formatter = DateFormatter()
            formatter.dateFormat = "MMM d, yyyy"
            return formatter
        }()
    
    
    func updateRatio(upd: Double)
    {
        ratioVar = upd
    }
    
    func saveRatioVar() 
    {
        ratioVar = (manager.retrieveSteps / goalCount) * 100
        UserDefaults.standard.set(ratioVar, forKey: "RatioVar")
    }
    
    
}




#Preview {
    TrackView()
}
