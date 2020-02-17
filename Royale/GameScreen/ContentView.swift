//
//  ContentView.swift
//  Royale
//
//  Created by Arnav Thirunagari on 2/16/20.
//  Copyright © 2020 Arnav Thirunagari. All rights reserved.
//

import SwiftUI
import UIKit

struct ContentView: View {
    var body: some View {
        ZStack {
            
            Color(UIColor(red: 49.0/255.0, green: 49.0/255.0, blue: 49.0/255.0, alpha: 1.0))
            .edgesIgnoringSafeArea(.all)
            
            
            VStack {
                VStack {
                    
                    TimerView()
                    
                    Spacer()
                    
                    Text("Who is the greatest quarterback of all time?").font(Font(UIFont(name: "Avenir", size: 30.0)!)).fontWeight(.bold).foregroundColor(Color.white).multilineTextAlignment(.center)
                }.frame(height: 225.0)
                
                Spacer()
            
                VStack {
                    
                    OptionButton(name: "Joe Montana")
                    
                    Spacer()
                    
                    OptionButton(name: "Steve Young")
                    
                    Spacer()
                    
                    OptionButton(name: "Jimmy Garoppolo")
                    
                    Spacer()
                    
                    OptionButton(name: "All of the Above")
                }
                .frame(height: CGFloat(250.0))
            }.frame(height: CGFloat(525.0))
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
