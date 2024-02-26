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
            Color(uiColor: .orange)
                .cornerRadius(15)
            
            
            VStack(spacing: 20)
            {
                HStack(alignment: .top)
                {
                    
                    VStack(alignment: .leading, spacing: 5)
                    {
                        
                        Text(activity.title)
                            .font(.system(size: 30))
                            .bold()
                        
//                        Text(activity.subtitle)
//                            .font(.system(size: 15))
//                            .foregroundColor(.white)
                    }
                    
                    Spacer()
                    
                    Image(systemName: activity.image)
                        .foregroundColor(.white)
                        .font(.system(size: 38))
                        
                    
                }
                
//                .padding()
                
                Text(activity.amount)
                    .font(.system(size: 40))
                
            }
            
            .padding()
            .cornerRadius(15)
        }
        
        .frame(width: 300, height: 170)
        .aspectRatio(contentMode: .fit)
        
    }
}

#Preview {
    ActivityCardView(activity: Activity(id: 0, title: "Today's Steps", subtitle: "Goal: 10,000", image: "figure.walk", amount: "5,000"))
}
