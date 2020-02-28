//
//  Lobby.swift
//  Royale
//
//  Created by Arnav Thirunagari on 2/25/20.
//  Copyright © 2020 Arnav Thirunagari. All rights reserved.
//

import SwiftUI
import SocketIO
import Foundation

struct Lobby: View {
    
    @State var isOn = true
    @State var color = Color.blue
    @State var category = 21
    @ObservedObject var gd = GameData()
    @State var manager = SocketManager(socketURL: URL(string: "http://localhost:5000")!, config: [.log(true), .compress])
    @State var showsAlert = false
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var alert: Alert {
        Alert(title: Text("Quit?"), message: Text("Are you sure you want to leave?"), primaryButton: .destructive(Text("Yes")) {
            self.manager.socket(forNamespace: "/\(self.category)").disconnect()
            self.presentationMode.wrappedValue.dismiss()
            }, secondaryButton: .default(Text("No")) {
                self.isOn = true
            })
    }
    
    var body: some View {
        ZStack {
            
            Color(UIColor(red: 49.0/255.0, green: 49.0/255.0, blue: 49.0/255.0, alpha: 1.0))
            .edgesIgnoringSafeArea(.all)
            
            LobbyPlayers(gd: self.gd, color: self.color).offset(x: 0.0, y: -60.0)
            
            Button(action: {
                self.isOn = false
                self.showsAlert = true
                       }) {
                            Text("X").frame(width: 20.0, height: 20.0).padding(10.0)
                                .accentColor(Color.white)
                                .background(Color.red)
                                
            }.alert(isPresented: self.$showsAlert, content: { self.alert })
            .clipShape(Circle()).frame(width: 40.0, height: 40.0).position(CGPoint(x:40.0, y:0.0))
            
        }.onAppear() {
            self.manager.socket(forNamespace: "/\(self.category)").on("join") { (data, _) in
                print("THING: \(data[0])")
                self.gd.ticker = (data[0] as! Array<Any>)[0] as! Int
            }
            self.manager.socket(forNamespace: "/\(self.category)").connect()
        }.navigationBarBackButtonHidden(true)
    }
}

struct Lobby_Previews: PreviewProvider {
    static var previews: some View {
        Lobby()
    }
}
