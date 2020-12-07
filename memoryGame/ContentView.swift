//
//  ContentView.swift
//  memoryGame
//
//  Created by Philipp on 06.12.2020.
//

import SwiftUI

struct Card {
    var value: String
}

struct ContentView: View {
    var body: some View {
        Color("backgroundColor").edgesIgnoringSafeArea(.all)
            .overlay(
                Text("Hello, world!")
            )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
