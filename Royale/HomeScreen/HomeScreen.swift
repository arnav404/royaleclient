//
//  HomeScreen.swift
//  Royale
//
//  Created by Arnav Thirunagari on 2/17/20.
//  Copyright © 2020 Arnav Thirunagari. All rights reserved.
//

import SwiftUI

struct HomeScreen: View {
    var body: some View {
        ZStack {
            Color(UIColor(red: 49.0/255.0, green: 49.0/255.0, blue: 49.0/255.0, alpha: 1.0))
            .edgesIgnoringSafeArea(.all)
            
            VStack {
                
                Text("Play Royale")
                    .font(Font(UIFont(name: "Avenir", size: 50.0)!))
                    .fontWeight(.heavy)
                    .foregroundColor(Color.white)
                
                Spacer()
                
                VStack {
                    HStack {
                        CategoryButton(name: "Culture", bgColor: Color.purple, color: Color(Color.RGBColorSpace.displayP3, red: 145.0/255.0, green: 58.0/255.0, blue: 143.0/255.0, opacity: 1.0))
                       
                            Spacer()
                        CategoryButton(name: "History", bgColor: Color.blue, color: Color(Color.RGBColorSpace.displayP3, red: 74.0/255.0, green: 104.0/255.0, blue: 217.0/255.0, opacity: 1.0))
                    }
                    .frame(width: 275.0)
                    
                    Spacer()
                    
                    HStack {
                        CategoryButton(name: "Science", bgColor: Color.green, color: Color(Color.RGBColorSpace.displayP3, red: 75.0/255.0, green: 154.0/255.0, blue: 78.0/255.0, opacity: 1.0))
                       
                            Spacer()
                        CategoryButton(name: "Sports", bgColor: Color.orange, color: Color(Color.RGBColorSpace.displayP3, red: 171.0/255.0, green: 100.0/255.0, blue: 80.0/255.0, opacity: 1.0))
                    }
                    .frame(width: 275.0)
                }
                .frame(height: 325.0)
                
            }
            .frame(height: 450.0)
            
        }
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
