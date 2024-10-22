//
//  HomeScreen.swift
//  Royale
//
//  Created by Arnav Thirunagari on 2/17/20.
//  Copyright © 2020 Arnav Thirunagari. All rights reserved.
//

import SwiftUI

struct HomeScreen: View {
    @State var show = true
    @ObservedObject var cd = CategoryData()
    
    var body: some View {
        NavigationView {
        ZStack {
            Color(UIColor(red: 49.0/255.0, green: 49.0/255.0, blue: 49.0/255.0, alpha: 1.0))
            .edgesIgnoringSafeArea(.all)
            
            VStack {
                
                Text("Trivia Royale")
                    .font(Font(UIFont(name: "Avenir", size: 50.0)!))
                    .fontWeight(.heavy)
                    .foregroundColor(Color.white)
                
                Spacer()
                
                VStack {
                    HStack {
                        CategoryButton(name: "Culture", bgColor: Color.purple, color: Color(Color.RGBColorSpace.displayP3, red: 145.0/255.0, green: 58.0/255.0, blue: 143.0/255.0, opacity: 1.0), category: 26, cd: self.cd)
                       
                            Spacer()
                        CategoryButton(name: "History", bgColor: Color.blue, color: Color(Color.RGBColorSpace.displayP3, red: 74.0/255.0, green: 104.0/255.0, blue: 217.0/255.0, opacity: 1.0), category: 23, cd: self.cd)
                    }
                    .frame(width: 275.0)
                    
                    Spacer()
                    
                    HStack {
                        CategoryButton(name: "Science", bgColor: Color.green, color: Color(Color.RGBColorSpace.displayP3, red: 75.0/255.0, green: 154.0/255.0, blue: 78.0/255.0, opacity: 1.0), category: 17, cd: self.cd)
                       
                            Spacer()
                        CategoryButton(name: "Sports", bgColor: Color.orange, color: Color(Color.RGBColorSpace.displayP3, red: 171.0/255.0, green: 100.0/255.0, blue: 80.0/255.0, opacity: 1.0), category: 21, cd: self.cd)
                    }
                    .frame(width: 275.0)
                }
                .frame(height: 325.0)
                
            }
            .frame(height: 430.0)
            .offset(x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: /*@START_MENU_TOKEN@*/-50.0/*@END_MENU_TOKEN@*/)
            
            
            if self.cd.screenShown {
                
                GeometryReader{_ in
                    
                    PopUp(bgColor: self.cd.bgColor, category: self.cd.category)
                    
                }.background(
                    
                    Color.black.opacity(0.65)
                        .edgesIgnoringSafeArea(.all)
                        .onTapGesture {
                            print("HELLOOO")
                            withAnimation{
                                self.cd.screenShown.toggle()
                            }
                        }
                
                )
            }
            
        }
            
        }
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
