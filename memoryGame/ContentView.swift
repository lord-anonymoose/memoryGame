//
//  ContentView.swift
//  memoryGame
//
//  Created by Philipp on 06.12.2020.
//

import SwiftUI

/*struct Card (id: Int) do {
    var body: some View {
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: String
        Rectangle()
        .fill(Color("cardColor"))
        .frame(width:75, height: 75)
    }
}*/

struct Card: View {
    let cover = "❔"
    var content: String
    var isTapped: Bool = false
    var isMatched: Bool = false
    
    func tapped() {
        
    }
    
    func matched() {
    }
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25, style: .continuous)
                            .fill(Color("cardColor"))
            Text(content)
                .font(.system(size: 50))
        }
        .frame(width: 90, height: 90)
    }
}

struct memoryGame: View {
    @State var chosenCards: Int = 0
    @State var turns: Int = 0
    @State var model = ["🎅🏻", "🎅🏻", "🤶🏾", "🤶🏾", "🎄", "🎄", "❄️", "❄️", "☃️", "☃️", "🦌", "🦌"].shuffled()
    
    func startGame() {
        self.model = model.shuffled()
        self.chosenCards = 0
        self.turns = 0
    }
    
    var body: some View {
        VStack {
            Text ("Score: ")
            HStack {
                Card(content: model[0])
                Card(content: model[1])
                Card(content: model[2])

            }
            HStack {
                Card(content: model[3])
                Card(content: model[4])
                Card(content: model[5])
            }
            HStack {
                Card(content: model[6])
                Card(content: model[7])
                Card(content: model[8])
            }
            HStack {
                Card(content: model[9])
                Card(content: model[10])
                Card(content: model[11])
            }
            Button (action: { startGame()}) {
                Text ("Start game")
            }
        }
    }
}
//This is a minor change
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
