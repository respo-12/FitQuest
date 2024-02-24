//
//  ActivityCardView.swift
//  FitQuest
//
//  Created by Ethan Lukas on 2/21/24.
//

import SwiftUI


struct Activity
{
    let id: Int
    let title: String
    let subtitle: String
    let image: String
    let amount: String
}


struct ActivityCardView: View 
{
    @State var activity: Activity
    
    var body: some View
    {
        
        ZStack
        {
            Color(uiColor: .systemGray6)
                .cornerRadius(15)
            
            
            VStack(spacing: 20)
            {
                HStack(alignment: .top)
                {
                    
                    VStack(alignment: .leading, spacing: 5)
                    {
                        
                        Text(activity.title)
                            .font(.system(size: 16))
                        
                        Text(activity.subtitle)
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                    
                    Spacer()
                    
                    Image(systemName: activity.image)
                        .foregroundColor(.blue)
                    
                }
                
//                .padding()
                
                Text(activity.amount)
                    .font(.system(size: 24))
                
            }
            
            .padding()
            .cornerRadius(15)
        }
        
    }
}

#Preview {
    ActivityCardView(activity: Activity(id: 0, title: "Today's Steps", subtitle: "Goal: 10,000", image: "figure.walk", amount: "5,000"))
}
