//
//  ContentView.swift
//  memoryGame
//
//  Created by Philipp on 06.12.2020.
//

import SwiftUI

struct memoryGame: View {
    
    struct Card: View {
        var value: String
        @State var content: String = "❔"
        @State var isTapped: Bool = false
        var isMatched: Bool = false
        
        func tapped() {
            if (isTapped) {
                content = value
                isTapped = false
            } else {
                content = "❔"
                isTapped = true
            }
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
            .onTapGesture {
                tapped()
            }
        }
        
    }
    
    @State var chosenCards: Int = 0
    @State var turns: Int = 0
    @State private var model = ["🎅🏻", "🎅🏻", "🤶🏾", "🤶🏾", "🎄", "🎄", "❄️", "❄️", "☃️", "☃️", "🦌", "🦌"].shuffled()
    
    func startGame() {
        self.model = model.shuffled()
        self.chosenCards = 0
        self.turns = 0
    }
    
    var body: some View {
        VStack {
            Text ("Score: ")
            HStack {
                Card(value: model[0])
                Card(value: model[1])
                Card(value: model[2])

            }
            HStack {
                Card(value: model[3])
                Card(value: model[4])
                Card(value: model[5])
            }
            HStack {
                Card(value: model[6])
                Card(value: model[7])
                Card(value: model[8])
            }
            HStack {
                Card(value: model[9])
                Card(value: model[10])
                Card(value: model[11])
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
