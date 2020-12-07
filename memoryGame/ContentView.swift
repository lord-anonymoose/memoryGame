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
    var content: String
    var isTapped: Bool = false
    var isMatched: Bool = false
    
    func tap() {
        
    }
    
    func matched() {
        self.body.foregroundColor(.white)
    }
    
    var body: some View {
        Text(content)
    }
}

struct memoryGame: View {
    var chosenCards: Int = 0
    var body: some View {
        Card(content: "🎅🏻")
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
