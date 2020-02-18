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
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State var showsAlert = false
    @State var color = Color.purple
    @State var networkingManager = NetworkingManager()
    
    var alert: Alert {
        Alert(title: Text("Quit?"), message: Text("Are you sure you want to leave?"), primaryButton: .destructive(Text("Yes")) {
                self.presentationMode.wrappedValue.dismiss()
            }, secondaryButton: .default(Text("No")))
    }
    
    var body: some View {
        ZStack {
            
            Color(UIColor(red: 49.0/255.0, green: 49.0/255.0, blue: 49.0/255.0, alpha: 1.0))
            .edgesIgnoringSafeArea(.all)
            
            
            VStack {
                VStack {
                    
                    TimerView(color: self.color)
                    
                    Spacer()
                    
                    Text(networkingManager.questionList.results[0].question).font(Font(UIFont(name: "Avenir", size: 20.0)!)).fontWeight(.bold).foregroundColor(Color.white).multilineTextAlignment(.center).padding(10.0)
                }.frame(height: 225.0)
                
                Spacer()
            
                VStack {
                    
                    OptionButton(name: networkingManager.questionList.results[0].correct_answer)
                    
                    Spacer()
                    
                    OptionButton(name: networkingManager.questionList.results[0].incorrect_answers[0])
                    
                    Spacer()
                    
                    OptionButton(name: networkingManager.questionList.results[0].incorrect_answers[1])
                    
                    Spacer()
                    
                    OptionButton(name: networkingManager.questionList.results[0].incorrect_answers[2])
                }
                .frame(height: CGFloat(250.0))
            }.frame(height: CGFloat(525.0)).offset(x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: /*@START_MENU_TOKEN@*/-50.0/*@END_MENU_TOKEN@*/)
       
            Button(action: {
                self.showsAlert = true
                       }) {
                            Text("X").frame(width: 20.0, height: 20.0).padding(10.0)
                                .accentColor(Color.white)
                                .background(Color.red)
                                
            }.alert(isPresented: self.$showsAlert, content: { self.alert })
            .clipShape(Circle()).frame(width: 40.0, height: 40.0).position(CGPoint(x:40.0, y:0.0))
        }.navigationBarBackButtonHidden(true)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
