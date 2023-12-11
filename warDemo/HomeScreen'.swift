//
//  HomeScreen'.swift
//  warDemo
//
//

import SwiftUI

struct HomeScreen: View {
    @EnvironmentObject var appState: AppState

    var body: some View {
        ZStack {
            TabView{
                Image("unoHomeScreen").resizable()
                    .edgesIgnoringSafeArea(.all)
                
                Image("unoHomeScreen2").resizable()
                    .edgesIgnoringSafeArea(.all)
                
                Image("unoHomeScreen3").resizable()
                    .edgesIgnoringSafeArea(.all)
            }
            
            Spacer()
            
            Button(action: {
                appState.screenNumber = 1
            }) {
                Image("dealbutton")
            }
                .padding(.top, 300)
        }
    }
}

struct HomeScreen__Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
