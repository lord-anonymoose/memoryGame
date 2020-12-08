//
//  ContentView.swift
//  memoryGame
//
//  Created by Philipp on 06.12.2020.
//

import SwiftUI

struct memoryGame: View {
    var model = ["🎅🏻", "🎅🏻", "🤶🏾", "🤶🏾", "🎄", "🎄", "❄️", "❄️", "☃️", "☃️", "🦌", "🦌"].shuffled()
    
    @State var myCard = [card](repeating: card(value: ""), count: 12)
    
    struct card: View {
        var value: String //Hidden symbol
        var content: String = "❔" //Shown symbol
        
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
    
    var body: some View {
        myCard[0] .onTapGesture {
            myCard[0].content = "X"
        }
        Button (action: { myCard[0].content = "Y" }) {
            Text("Start game")
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
 
