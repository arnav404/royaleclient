//
//  PopUp.swift
//  Royale
//
//  Created by Arnav Thirunagari on 2/18/20.
//  Copyright © 2020 Arnav Thirunagari. All rights reserved.
//

import SwiftUI

struct PopUp: View {
    
    @State var bgColor = Color.blue
    @State var category = 21
    
    var body: some View {
        ZStack {
            VStack {
                    VStack {
                        Text("Select Gamemode")
                            .fontWeight(.heavy)
                        .multilineTextAlignment(.center)
                        .padding(17.0).foregroundColor(.white).font(Font(UIFont(name: "Avenir", size: 23.0)!))
                        .foregroundColor(Color.white)
                    Spacer()
                    HStack {
                        NavigationLink(destination: RoyaleMotherView(color: self.bgColor, category: self.category)) {
                            Text("Royale Mode").padding(8.0)
                                .foregroundColor(Color.white)
                               
                                .background(Color.green)
                                .cornerRadius(10.0) .multilineTextAlignment(.center).foregroundColor(.white).font(Font(UIFont(name: "Avenir", size: 20.0)!))
                        }
                        
                        Spacer()
                        
                        NavigationLink(destination: ContentView(color: self.bgColor, category: self.category)) {
                            Text("Single Player").padding(8.0)
                                .foregroundColor(Color.white)
                                .background(Color.orange)
                                .cornerRadius(10.0)
                                .multilineTextAlignment(.center).foregroundColor(.white).font(Font(UIFont(name: "Avenir", size: 20.0)!))
                        }
                    }
                    .frame(width: 160.0)
                }
                    .frame(width: 200.0, height: 200.0)
                    .cornerRadius(/*@START_MENU_TOKEN@*/3.0/*@END_MENU_TOKEN@*/)
                }
                .frame(width: 200.0, height: 300.0)
                .cornerRadius(/*@START_MENU_TOKEN@*/20.0/*@END_MENU_TOKEN@*/)
                .background(/*@START_MENU_TOKEN@*/Color.gray/*@END_MENU_TOKEN@*/)
            .border(self.bgColor, width: /*@START_MENU_TOKEN@*/7/*@END_MENU_TOKEN@*/)
                       
            }
    }
}

struct PopUp_Previews: PreviewProvider {
    static var previews: some View {
        PopUp()
    }
}
