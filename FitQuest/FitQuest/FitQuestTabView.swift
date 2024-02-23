//
//  FitQuestTabView.swift
//  FitQuest
//
//  Created by Ethan Lukas on 2/21/24.
//

import SwiftUI

struct FitQuestTabView: View {
    
    
    var body: some View
    {
        
        TabView(selection: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Selection@*/.constant(1)/*@END_MENU_TOKEN@*/)
        {
            
            HomeView()
                .tag("Home")
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
            }
            
            ProfileView()
                .tag("Profile")
                .tabItem {
                    Image(systemName: "person")
                    Text("Profile")
            }
//            Text("Tab Content 1").tabItem { /*@START_MENU_TOKEN@*/Text("Tab Label 1")/*@END_MENU_TOKEN@*/ }.tag(1)
//            Text("Tab Content 2").tabItem { /*@START_MENU_TOKEN@*/Text("Tab Label 2")/*@END_MENU_TOKEN@*/ }.tag(2)
            
        }
        
    }
    
}

#Preview {
    FitQuestTabView()
}
