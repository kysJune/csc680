//
//  ContentView.swift
//  warDemo
//
//  Created by Arjun Radhakrishnan
//

import SwiftUI


struct GameScreen: View {
    //var that controls screen changes
    @EnvironmentObject var appState: AppState
    
    //var model = Uno()
    @ObservedObject var model = UnoGameModel()
    
    @State private var card1 = 5
    @State private var card2 = 2
    
    @State private var score1 = 0
    @State private var score2 = 0

    var body: some View {
        ZStack {
            Image("background").resizable()
                .edgesIgnoringSafeArea(.all)
            
            VStack {
//                Image("unoLogo")
//                    .resizable()
//                    .aspectRatio(contentMode: .fit)
//                    .frame(width: 100, height: 45)
                Button(action: {
                    appState.screenNumber = 0
                }) {
                    Image("unoLogo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, height: 45)
                }
                
                //opponents hand display
                HStack{
                    ForEach(model.Players){ player in
                        if !player.isMe {
                            VStack{
                                Text("Handsize" + ": " + String(player.Hand.count))
                                LazyVGrid(columns: [GridItem(.adaptive(minimum: 100), spacing: -93)]){
                                    ForEach(player.Hand){card in
                                        HandView(cardName: "card_back")
                                    }
                                }
                            }
                        }
                    }
                }
                //play pile
                HStack{
                    ZStack(alignment: .leading) {
                        Image(model.topCards[2].filename)
                            .padding(.leading, -10)
                            .rotationEffect(.degrees(-30))
                        Image(model.topCards[1].filename)
                        Image(model.topCards[0].filename)
                            .rotationEffect(.degrees(30))
                    }
                }
                .padding(.top, 30)
                Spacer()
                
                //player hand display
                let myPlayer = model.Players[2]
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 100), spacing: -77)]){
                    ForEach(myPlayer.Hand){card in
                        HandView(cardName: card.filename)
                            .offset(y: card.selected ? -80 : 0)
                            .onTapGesture{
                                print(card.filename)
                                model.select(card, in: myPlayer)
                            }
                    }
                }
                //info box
                ZStack{
                    Rectangle()
                        .foregroundColor(Color.white)
                    
                    let play = model.Players[2].Hand.filter{$0.selected==true}
                    if (play.count != 1){
                        Text("Please Select 1 Card \n")
                    }
                }
                .frame(height: 50)
                
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
