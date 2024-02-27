//
//  FitQuestTabView.swift
//  FitQuest
//
//  Created by Ethan Lukas on 2/21/24.
//

import SwiftUI

struct FitQuestTabView: View {
    
    @EnvironmentObject var manager: HealthManager
    
    @State var selectedTab = "Home"
    
    var body: some View
    {
        //App name at at top
        VStack
        {
            Text("FitQuest")
                .bold()
                .font(.title)
        }
        
        TabView(selection: $selectedTab)
        {
            
        
            HomeView()
                .tag("Home")
                .tabItem 
                {
                    Image(systemName: "house")
                    Text("Home")
                }
                .environmentObject(manager)
            
            DietView()
                .tag("Diet")
                .tabItem 
                {
                    Image(systemName: "fork.knife.circle.fill")
                    Text("Diet")
                }
            
            TrackView()
                .tag("Steps")
                .tabItem
                {
                     Image(systemName: "figure.run")
                     Text("Steps")
                }
            
            SleepView()
                .tag("Sleep")
                .tabItem
                {
                    Image(systemName: "bed.double.fill")
                    Text("Sleep")
                }
            
            ProfileView()
                .tag("Profile")
                .tabItem 
                {
                    Image(systemName: "person")
                    Text("Profile")
                }
            
            
        }
        
    }
    
}

#Preview {
    FitQuestTabView()
}
