//
//  LobbyPlayers.swift
//  Royale
//
//  Created by Arnav Thirunagari on 2/27/20.
//  Copyright © 2020 Arnav Thirunagari. All rights reserved.
//
import SwiftUI
import Combine


struct LobbyPlayers: View {
    @ObservedObject var gd = GameData()
    @State var color = Color.blue
    
    var body: some View {
        VStack {
            Text("\(self.gd.ticker)").font(Font(UIFont(name: "Avenir", size: 80.0)!))
            .fontWeight(.heavy)
            .foregroundColor(Color.white)
            
            Text("players in the lobby").font(Font(UIFont(name: "Avenir", size: 20.0)!))
            .fontWeight(.light)
            .foregroundColor(Color.white)
        }.overlay(Circle().trim(from: CGFloat(0.2*Double(5-self.gd.ticker)), to: 1.0).offset(x: 0.0, y: 15.0).stroke(self.color, lineWidth: 30.0).frame(width: 300.0, height: 300.0))
    }
}

struct LobbyPlayers_Previews: PreviewProvider {
    static var previews: some View {
        LobbyPlayers()
    }
}
