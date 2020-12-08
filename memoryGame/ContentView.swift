//
//  ContentView.swift
//  memoryGame
//
//  Created by Philipp on 06.12.2020.
//

import SwiftUI

struct memoryGame: View {
    @State var model = ["🎅🏻", "🎅🏻", "🤶🏾", "🤶🏾", "🎄", "🎄", "❄️", "❄️", "☃️", "☃️", "🦌", "🦌"].shuffled()
    
    @State var myCard = [card](repeating: card(value: ""), count: 12)
    
    struct card: View {
        var value: String //Hidden symbol
        var content: String = "❔" //Shown symbol
        var isTapped:Bool = false
        
        mutating func cardTap() {
            if !(self.isTapped) {
                self.content = self.value
            }
        }
        
        var body: some View {
            ZStack {
                RoundedRectangle(cornerRadius: 25, style: .continuous)
                    .fill(Color("cardColor"))
                Text(content)
                    .font(.system(size:50))
            }
            .frame(width: 90, height: 90)
            
        }
    }
    
    func startGame() {
        for i in 0...11 {
            model = model.shuffled()
            myCard[i].content = "❔"
            myCard[i].isTapped = false
            myCard[i].value = model[i]
        }
    }
    
    
    var body: some View {
        VStack {
            HStack {
                myCard[0] .onTapGesture {
                    myCard[0].cardTap()
                }
                myCard[1] .onTapGesture {
                    myCard[1].cardTap()
                }
                myCard[2] .onTapGesture {
                    myCard[2].cardTap()
                }
            }
            
            HStack {
                myCard[3] .onTapGesture {
                    myCard[3].cardTap()
                }
                myCard[4] .onTapGesture {
                    myCard[4].cardTap()
                }
                myCard[5] .onTapGesture {
                    myCard[5].cardTap()
                }
            }
            
            HStack {
                myCard[6] .onTapGesture {
                    myCard[6].cardTap()
                }
                myCard[7] .onTapGesture {
                    myCard[7].cardTap()
                }
                myCard[8] .onTapGesture {
                    myCard[8].cardTap()
                }
            }
            
            HStack {
                myCard[9] .onTapGesture {
                    myCard[9].cardTap()
                }
                myCard[10] .onTapGesture {
                    myCard[10].cardTap()
                }
                myCard[11] .onTapGesture {
                    myCard[11].cardTap()
                }
            }
            
            Button (action: { startGame() }) {
                Text("Start game")
            }
            
        }
    }
}

struct ContentView: View {
    var body: some View {
        Color("backgroundColor").edgesIgnoringSafeArea(.all)
            .overlay(
                memoryGame()
            )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
 
