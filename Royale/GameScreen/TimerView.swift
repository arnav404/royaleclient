//
//  Timer.swift
//  Royale
//
//  Created by Arnav Thirunagari on 2/17/20.
//  Copyright © 2020 Arnav Thirunagari. All rights reserved.
//

import SwiftUI
import Combine

class TimeLeft: ObservableObject {
    var didChange = PassthroughSubject<TimeLeft, Never>()
    @Published var currentTime = 0.0 {
        didSet {
            didChange.send(self)
        }
    }
}

struct TimerView: View {
    @State var color = Color.purple
    @ObservedObject var tl = TimeLeft()
    
    func getPath() -> Path {
        var p = Path()
        p.addArc(center: CGPoint(x: 50, y:50), radius: 50.0, startAngle: .degrees(0), endAngle: .degrees(Double(15-self.tl.currentTime+1)/15.0*360+0.01), clockwise: true)
        return p.strokedPath(StrokeStyle(lineWidth: 8.0))
    }
    
    var body: some View {
        Text("\(Int(tl.currentTime))")
            .font(.largeTitle)
            .foregroundColor(Color.white)
            .padding(.all)
            .frame(width: 100.0, height: 100.0)
            .background(self.color)
            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
            .overlay(getPath())
    }
}

struct Timer_Previews: PreviewProvider {
    static var previews: some View {
        TimerView()
    }
}
