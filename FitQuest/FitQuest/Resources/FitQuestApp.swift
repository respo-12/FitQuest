//
//  FitQuestApp.swift
//  FitQuest
//
//  Created by Ethan Lukas on 2/7/24.
//

import SwiftUI
import Firebase

class Authentication: ObservableObject {
    @Published var isLoggedin = false

    init() {
        FirebaseApp.configure()
        Auth.auth().addStateDidChangeListener { (auth, user) in
            if user != nil {
                self.isLoggedin = true
            } else {
                self.isLoggedin = false
            }
        }
    }
}

@main
struct FitQuestApp: App 
{
    
    @StateObject var manager = HealthManager()
    @StateObject var auth = Authentication()
    
    var isLoggedin = false // Add a state to track login status



        var body: some Scene
        {
            WindowGroup
            {
                if auth.isLoggedin {
                    FitQuestTabView()
                        .environmentObject(manager)
                } else {
                    ViewControllerWrapper()
                }
            }
        }
}
