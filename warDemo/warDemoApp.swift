//
//  warDemoApp.swift
//  warDemo
//
//

import SwiftUI

//defining observable
class AppState: ObservableObject {
    @Published var screenNumber: Int
    
    init(screenNumber: Int) {
        self.screenNumber = 0
    }
}

@main
struct warDemoApp: App {
    @ObservedObject var appState = AppState(screenNumber: 0)
    
    var body: some Scene {
        WindowGroup {
            if(appState.screenNumber == 0){
                HomeScreen()
                  .environmentObject(appState)
            }
            else if(appState.screenNumber == 1){
                GameScreen()
                  .environmentObject(appState)
            }
        }
    }
}
