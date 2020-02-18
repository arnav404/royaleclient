//
//  OptionButton.swift
//  Royale
//
//  Created by Arnav Thirunagari on 2/17/20.
//  Copyright © 2020 Arnav Thirunagari. All rights reserved.
//

import SwiftUI
import Combine

class GameData: ObservableObject {
    var didChange = PassthroughSubject<GameData, Never>()
    @Published var colorIDs = [0,0,0,0] {
        didSet {
            didChange.send(self)
        }
    }
    @Published var options = ["", "", "", ""] {
        didSet {
            didChange.send(self)
        }
    }
    @Published var questionNumber = 1 {
        didSet {
            didChange.send(self)
        }
    }
    @Published var selectedButton = 1 {
        didSet {
            didChange.send(self)
        }
    }
    @Published var selectedAnswer = "" {
        didSet {
            didChange.send(self)
        }
    }
    @Published var correctButton = 0 {
        didSet {
            didChange.send(self)
        }
    }
}

struct OptionButton: View {
    @State var id = 0
    @State var colors = [Color(UIColor(red: 49.0/255.0, green: 49.0/255.0, blue: 49.0/255.0, alpha: 1.0)), Color.white, Color.white, Color.white]
    @State var bgColors = [Color.white, Color.gray, Color.green, Color.red]
    @ObservedObject var gd = GameData()
    
    var body: some View {
        Button(action: {
            print(self.gd.selectedButton)
            self.gd.selectedButton = self.id
            self.gd.selectedAnswer = self.gd.options[self.id]
            var arr = [0,0,0,0]
            arr[self.id] = 1
            self.gd.colorIDs = arr
        }) {
            Text("\(self.gd.options[self.id])")
                .font(Font(UIFont(name: "Avenir", size: 20.0)!)).fontWeight(.bold)
                .padding(10.0)
                .frame(width: 300.0, height: 50.0)
                .background(self.bgColors[self.gd.colorIDs[id]])
                .accentColor(self.colors[self.gd.colorIDs[id]])
                .cornerRadius(10)
                .shadow(radius: /*@START_MENU_TOKEN@*/3/*@END_MENU_TOKEN@*/)
        }        
    }
}

struct OptionButton_Previews: PreviewProvider {
    static var previews: some View {
        OptionButton()
    }
}
