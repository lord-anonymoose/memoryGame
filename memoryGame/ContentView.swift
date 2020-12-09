//
//  ContentView.swift
//  memoryGame
//
//  Created by Philipp on 06.12.2020.
//

import SwiftUI

var cardsOpened: Int = 0

struct memoryGame: View {
    
    @State var model = ["🎅🏻", "🎅🏻", "🤶🏾", "🤶🏾", "🎄", "🎄", "❄️", "❄️", "☃️", "☃️", "🦌", "🦌"]
    @State var counter: Int = 0
    
    @State var matchedCards = [Int]()
    
    @State var currentCard: String = ""
    
    @State var myCard = [card](repeating: card(value: ""), count: 12)
    
    struct card: View {
        var value: String //Hidden symbol
        var content: String = "❔" //Shown symbol
        var isTapped:Bool = false

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
    
    func cardTap(number: Int) {
        if (cardsOpened == 2) {
            hideAll()
            cardsOpened = 1
            myCard[number].content = myCard[number].value
        } else {
            cardsOpened += 1
            myCard[number].content = myCard[number].value
        }
    }
    
    func hideAll () {
        cardsOpened = 0
        for i in 0...11 {
            myCard[i].content = "❔"
        }
    }
    
    func startGame() {
        model = model.shuffled()
        hideAll()
        cardsOpened = 0
        counter = 0
        for i in 0...11 {
            myCard[i].content = "❔"
            myCard[i].isTapped = false
            myCard[i].value = model[i]
        }
    }
    
    var body: some View {
        
        VStack {
            Text ("You've made \(counter) taps so far.")
            HStack {
                myCard[0] .onTapGesture {
                    cardTap(number: 0)
                }
                myCard[1] .onTapGesture {
                    cardTap(number: 1)
                }
                myCard[2] .onTapGesture {
                    cardTap(number: 2)
                }
            }
            
            HStack {
                myCard[3] .onTapGesture {
                    cardTap(number: 3)
                }
                myCard[4] .onTapGesture {
                    cardTap(number: 4)
                }
                myCard[5] .onTapGesture {
                    cardTap(number: 5)
                }
            }
            
            HStack {
                myCard[6] .onTapGesture {
                    cardTap(number: 6)
                }
                myCard[7] .onTapGesture {
                    cardTap(number: 7)
                }
                myCard[8] .onTapGesture {
                    cardTap(number: 8)
                }
            }
            
            HStack {
                myCard[9] .onTapGesture {
                    cardTap(number: 9)
                }
                myCard[10] .onTapGesture {
                    cardTap(number: 10)
                }
                myCard[11] .onTapGesture {
                    cardTap(number: 11)
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
 
