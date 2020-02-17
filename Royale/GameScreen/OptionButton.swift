//
//  OptionButton.swift
//  Royale
//
//  Created by Arnav Thirunagari on 2/17/20.
//  Copyright © 2020 Arnav Thirunagari. All rights reserved.
//

import SwiftUI

struct OptionButton: View {
    
    @State var name = "Jimmy Garoppolo"
    @State var color = Color(UIColor(red: 49.0/255.0, green: 49.0/255.0, blue: 49.0/255.0, alpha: 1.0))
    @State var bgColor = Color.white
    static var notClicked = true
    
    var body: some View {
        Button(action: {
            if(OptionButton.notClicked) {
                self.bgColor = Color.gray
                self.color = Color.white
                OptionButton.notClicked = false
            }
            
        }) {
            Text(self.name)
                .font(Font(UIFont(name: "Avenir", size: 20.0)!)).fontWeight(.bold)
                .padding(10.0)
                .frame(width: 300.0, height: 50.0)
                .background(self.bgColor)
                .accentColor(self.color)
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
