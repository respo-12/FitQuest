//
//  HomeView.swift
//  FitQuest
//
//  Created by Ethan Lukas on 2/21/24.
//

import SwiftUI

struct HomeView: View
{
    
    @EnvironmentObject var manager: HealthManager
    
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

        
        
    }
    
    
}


#Preview {
    HomeView()
}
