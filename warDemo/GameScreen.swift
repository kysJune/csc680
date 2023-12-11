//
//  ContentView.swift
//  warDemo
//
//  Created by Arjun Radhakrishnan
//

import SwiftUI


struct GameScreen: View {
    @EnvironmentObject var appState: AppState
    
    @State private var card1 = 5
    @State private var suit1 = 0;
    @State private var card2 = 2
    
    @State private var score1 = 0
    @State private var score2 = 0

    var body: some View {
        ZStack {
            Image("background").resizable()
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Image("logo")
                Button(action: {
                    self.card1 = Int.random(in: 0...9)
                    self.suit1 = Int.random(in: 0...3)
                    self.card2 = Int.random(in: 0...9)
                    if (self.card1 > self.card2){
                        score1 += 1
                    }
                    else if(self.card2 > self.card1){
                        score2 += 1
                    }
                }) {
                    Image("dealbutton")
                }
                
                //play pile
                HStack{
                    ZStack(alignment: .leading) {
                        Image("yellow_" + String(card1))                .padding(.leading, -10)
                            .rotationEffect(.degrees(-30))
                        Image("red_" + String(card2))
                        Image("blue_" + String(card2))
                            .rotationEffect(.degrees(30))
                    }
                }
                .padding(.top, 30)
                Spacer()
                
                
                
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 100), spacing: -70)]){
                    ForEach(testCards){card in
                        HandView(cardName: card.filename)
                    }
                }
                
                
                Button("QUIT"){
                    appState.screenNumber = 0
                }
            }
            .padding()
        }
       
    }
}

struct HandView: View{
    let cardName: String
    var body: some View{
        Image(cardName)
            .resizable()
            .aspectRatio(contentMode: .fit)
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        GameScreen()
    }
}
