//
//  FitQuestApp.swift
//  FitQuest
//
//  Created by Ethan Lukas on 2/7/24.
//

import SwiftUI

@main
struct FitQuestApp: App 
{
    
    @StateObject var manager = HealthManager()
    
    var body: some Scene
    {
        
        WindowGroup
        {
            FitQuestTabView()
                .environmentObject(manager)
                
            
        }
    }
}
