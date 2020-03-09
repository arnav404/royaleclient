//
//  StandingsPopUp.swift
//  Royale
//
//  Created by Arnav Thirunagari on 3/8/20.
//  Copyright © 2020 Arnav Thirunagari. All rights reserved.
//

import SwiftUI

struct StandingsPopUp: View {
    
    @ObservedObject var screenShown = ScreenShown()
    @State var bgColor = Color.black
    @State var buttonColor = Color.green
    @State var category = 21
    @State var peopleLeft = 3
    @State var title = "You Got It"
    @State var buttonText = ""
    
    var body: some View {
        ZStack {
            VStack {
                    VStack {
                        Text(self.title)
                            .fontWeight(.heavy)
                        .multilineTextAlignment(.center)
                        .padding(17.0).foregroundColor(.white).font(Font(UIFont(name: "Avenir", size: 23.0)!))
                        .foregroundColor(Color.white)
                        
                        Text("\(self.peopleLeft) People Left")
                            .fontWeight(.heavy)
                        .multilineTextAlignment(.center)
                        .padding(17.0).foregroundColor(.white).font(Font(UIFont(name: "Avenir", size: 23.0)!))
                        .foregroundColor(Color.white)
                        
                    Spacer()
                        Button(action: {
                            print("BUTTON CLICKED")
                            self.screenShown.screenShown = false
                        }) {
                            Text(self.buttonText).padding(8.0)
                            .foregroundColor(Color.white)
                            .background(self.buttonColor)
                            .cornerRadius(10.0)
                            .multilineTextAlignment(.center).foregroundColor(.white).font(Font(UIFont(name: "Avenir", size: 20.0)!))
                        }.frame(width: 160.0)
                }
                    .frame(width: 200.0, height: 200.0)
                    .cornerRadius(/*@START_MENU_TOKEN@*/3.0/*@END_MENU_TOKEN@*/)
                }
                .frame(width: 200.0, height: 300.0)
                .cornerRadius(/*@START_MENU_TOKEN@*/20.0/*@END_MENU_TOKEN@*/)
            .background(Color.init(UIColor(red: 50.0/255.0, green: 50.0/255.0, blue: 50.0/255.0, alpha: 1.0)))
            .border(self.bgColor, width: /*@START_MENU_TOKEN@*/7/*@END_MENU_TOKEN@*/)
                       
            }
    }
    
}

struct StandingsPopUp_Previews: PreviewProvider {
    static var previews: some View {
        StandingsPopUp()
    }
}
