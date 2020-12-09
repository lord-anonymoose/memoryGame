//
//  ContentView.swift
//  memoryGame
//
//  Created by Philipp on 06.12.2020.
//

import SwiftUI

var oneIsOpen = false

var myAlert: String = ""

struct memoryGame: View {
    @State var model = ["🎅🏻", "🎅🏻", "🤶🏾", "🤶🏾", "🎄", "🎄", "❄️", "❄️", "☃️", "☃️", "🦌", "🦌"]
    @State var counter = 0
    @State var matchedCards = [Int]()
    
    @State private var showingAlert = false

    
    
    @State var myCard = [card](repeating: card(value: ""), count: 12)
    
    struct card: View {
        var value: String //Hidden symbol
        var content: String = "❔" //Shown symbol
        var isTapped:Bool = false
        /*
        mutating func cardTap() {
            if (oneIsOpen) {
                hideAll()
            }
            if !(self.isTapped) {
                self.content = self.value
                oneIsOpen = true
            }
        }
        */
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
        if (oneIsOpen) {
            //hideAll()
        }
        //if !(myCard[number].isTapped) {
            myCard[number].content = myCard[number].value
            oneIsOpen = !oneIsOpen
        //§}
    }
    
    func startGame() {
        model = model.shuffled()
        for i in 0...11 {
            counter = 0
            myCard[i].content = "❔"
            myCard[i].isTapped = false
            myCard[i].value = model[i]
            oneIsOpen = false
            myAlert += model[i]
        }
    }
    
    func hideAll () {
        for i in 0...11 {
            myCard[i].content = "❔"
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
            
            Button(action: {
                        self.showingAlert = true
                    }) {
                        Text("Show Alert")
                    }
                    .alert(isPresented: $showingAlert) {
                        Alert(title: Text("Important message"), message: Text(myAlert), dismissButton: .default(Text("Got it!")))
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
 
