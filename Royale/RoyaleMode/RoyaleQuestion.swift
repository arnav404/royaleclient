//
//  RoyaleQuestion.swift
//  Royale
//
//  Created by Arnav Thirunagari on 2/16/20.
//  Copyright © 2020 Arnav Thirunagari. All rights reserved.
//

import SwiftUI
import UIKit

struct RoyaleQuestion: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State var showsAlert = false
    @State var color = Color.purple
    @ObservedObject var tl = TimeLeft()
    @ObservedObject var gd = GameData()
    @ObservedObject var screenShown = ScreenShown()
    @State var answeredCorrect = true
    @ObservedObject var nav = NavigationController()
    @State var category = 21
    @State var isOn = true
    @State var questionData = []
    @State var questionText = ""
    @State var responses = []
    @State var correctAnswer = ""
    
    @State var countdown = Timer.publish(every: 0.01, on: .main, in: .common).autoconnect()
    
    var alert: Alert {
        Alert(title: Text("Quit?"), message: Text("Are you sure you want to leave?"), primaryButton: .destructive(Text("Yes")) {
                self.presentationMode.wrappedValue.dismiss()
            }, secondaryButton: .default(Text("No")) {
                self.isOn = true
            })
    }
    
    
    
    var body: some View {
        ZStack {
             
             Color(UIColor(red: 49.0/255.0, green: 49.0/255.0, blue: 49.0/255.0, alpha: 1.0))
             .edgesIgnoringSafeArea(.all)
             
             
             VStack {
                 VStack {
                     
                     TimerView(color: self.color, tl: self.tl).onReceive(countdown, perform: { _ in
                         if self.tl.currentTime > 1.0 {
                             if(self.isOn) {
                                 self.tl.currentTime -= 0.01
                             }
                         } else {
                            self.tl.currentTime = 15.99
                            self.gd.disabled = true
                            self.isOn = false
                            if(self.gd.selectedButton == self.gd.correctButton) {
                                    self.gd.colorIDs[self.gd.selectedButton] = 2
                                    self.answeredCorrect = true
                            } else if(self.gd.selectedAnswer != ""){
                                self.gd.colorIDs[self.gd.selectedButton] = 3
                                self.gd.colorIDs[self.gd.correctButton] = 2
                                self.answeredCorrect = false
                            } else {
                                self.gd.colorIDs[self.gd.correctButton] = 2
                                self.answeredCorrect = false
                            }
                            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) { // Change `2.0` to the desired number of seconds.
                                   // Code you want to be delayed
                                self.screenShown.screenShown = true
                            }
                            DispatchQueue.main.asyncAfter(deadline: .now() + 4.0) { // Change `2.0` to the desired number of seconds.
                                // Code you want to be delayed
                                if(self.answeredCorrect == false) {
                                    self.presentationMode.wrappedValue.dismiss()
                                }
                                self.isOn = true
                                self.gd.disabled = false
                                self.gd.colorIDs = [0,0,0,0]
                                self.gd.questionNumber+=1
                                if(self.gd.questionNumber == 5) {
                                    self.gd.questionNumber = 0
                                }
                                self.gd.selectedAnswer = ""
                                if let item = self.questionData[self.gd.questionNumber] as? [String:Any] {
                                    print("IN HERE")
                                    self.questionText = item["question"]! as! String
                                    self.gd.colorIDs = [0,0,0,0]
                                    self.gd.selectedAnswer = ""
                                    self.gd.options = item["incorrect_answers"] as! Array<String>
                                    self.gd.options.append(item["correct_answer"] as! String)
                                    self.gd.options.shuffle()
                                    self.gd.correctButton = self.gd.options.firstIndex(of: item["correct_answer"] as! String)!
                                    self.gd.correctButton = self.gd.options.firstIndex(of: item["correct_answer"] as! String)!
                                }
                         }
                        }})
                     
                     Spacer()
                     

                    Text("\(self.questionText)").font(Font(UIFont(name: "Avenir", size: 20.0)!)).fontWeight(.bold).foregroundColor(Color.white).multilineTextAlignment(.center).padding(10.0)
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
                 self.isOn = false
                 self.showsAlert = true
                        }) {
                             Text("X").frame(width: 20.0, height: 20.0).padding(10.0)
                                 .accentColor(Color.white)
                                 .background(Color.red)
                                 
             }.alert(isPresented: self.$showsAlert, content: { self.alert })
             .clipShape(Circle()).frame(width: 40.0, height: 40.0).position(CGPoint(x:40.0, y:0.0))
            
            if self.screenShown.screenShown {
                
                if(self.answeredCorrect) {
                    GeometryReader{_ in
                        
                        StandingsPopUp(screenShown: self.screenShown, buttonColor: Color.green, title: "You Got It!!", buttonText: "Keep Going")
                        
                    }.background(
                        
                        Color.black.opacity(0.8)
                            .edgesIgnoringSafeArea(.all)
                    
                    )
                } else {
                    GeometryReader{_ in
                        
                        StandingsPopUp(screenShown: self.screenShown, buttonColor: Color.red, title: "You Are Out!!", buttonText: "Go Home")
                        
                    }.background(
                        
                        Color.black.opacity(0.8)
                            .edgesIgnoringSafeArea(.all)
                    
                    )
                }
                
                
            }
            
         }.onAppear {
            self.tl.currentTime = 15.99
            self.isOn = true
            print("CURRENT QUESTION: \(self.questionData[self.gd.questionNumber])")
            if let item = self.questionData[self.gd.questionNumber] as? [String:Any] {
                print("IN HERE")
                self.questionText = item["question"]! as! String
                self.gd.colorIDs = [0,0,0,0]
                self.gd.selectedAnswer = ""
                self.gd.options = item["incorrect_answers"] as! Array<String>
                self.gd.options.append(item["correct_answer"] as! String)
                self.gd.options.shuffle()
                self.gd.correctButton = self.gd.options.firstIndex(of: item["correct_answer"] as! String)!
            }
         }.navigationBarBackButtonHidden(true)
    }
    
}

struct RoyaleQuestion_Previews: PreviewProvider {
    static var previews: some View {
        RoyaleQuestion()
    }
}
