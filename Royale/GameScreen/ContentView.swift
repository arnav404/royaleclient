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
    @ObservedObject var networkingManager = NetworkingManager()
    @ObservedObject var tl = TimeLeft()
    @ObservedObject var gd = GameData()
    @State var category = 21
    
    let countdown = Timer.publish(every: 0.01, on: .main, in: .common).autoconnect()
    
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
                    
                    TimerView(color: self.color, tl: self.tl).onReceive(countdown, perform: { _ in
                        if self.tl.currentTime > 1.0 {
                            self.tl.currentTime -= 0.01
                        } else {
                            self.tl.currentTime = 16.0
                            if(self.gd.selectedAnswer == self.networkingManager.questionList.results[self.gd.questionNumber].correct_answer) {
                                    self.gd.colorIDs[self.gd.selectedButton] = 2
                            } else if(self.gd.selectedAnswer != ""){
                                self.gd.colorIDs[self.gd.selectedButton] = 3
                                self.gd.colorIDs[self.gd.correctButton] = 2
                            } else {
                                self.gd.colorIDs[self.gd.correctButton] = 2
                            }
                            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) { // Change `2.0` to the desired number of seconds.
                                // Code you want to be delayed
                                self.gd.colorIDs = [0,0,0,0]
                                self.gd.questionNumber+=1
                                self.gd.selectedAnswer = ""
                                self.gd.options = [self.networkingManager.questionList.results[self.gd.questionNumber].correct_answer, self.networkingManager.questionList.results[self.gd.questionNumber].incorrect_answers[0], self.networkingManager.questionList.results[self.gd.questionNumber].incorrect_answers[1], self.networkingManager.questionList.results[self.gd.questionNumber].incorrect_answers[2]]
                                self.gd.options.shuffle()
                                self.gd.correctButton = self.gd.options.firstIndex(of: self.networkingManager.questionList.results[self.gd.questionNumber].correct_answer)!
                            }
                        }
                    })
                    
                    Spacer()
                    
                Text(networkingManager.questionList.results[self.gd.questionNumber].question).font(Font(UIFont(name: "Avenir", size: 20.0)!)).fontWeight(.bold).foregroundColor(Color.white).multilineTextAlignment(.center).padding(10.0)
                }.frame(height: 225.0)
                
                Spacer()
            
                VStack {
                    
                    OptionButton(id: 0, gd: self.gd)
                    
                    Spacer()
                    
                    OptionButton(id: 1, gd: self.gd)
                    
                    Spacer()
                    
                    OptionButton(id: 2, gd: self.gd)
                    
                    Spacer()
                    
                    OptionButton(id: 3, gd: self.gd)
                }
                .frame(height: CGFloat(250.0))
            }.frame(height: CGFloat(525.0)).offset(x: 0.0, y: -50.0)
       
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
