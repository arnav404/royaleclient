//
//  RoyaleMotherView.swift
//  Royale
//
//  Created by Arnav Thirunagari on 2/28/20.
//  Copyright © 2020 Arnav Thirunagari. All rights reserved.
//

import SwiftUI

struct RoyaleMotherView: View {
    @ObservedObject var page = NavigationController()
    @State var color = Color.blue
    @State var category = 21
    
    var body: some View {
        VStack {
            if(self.page.page == "lobby") {
                Lobby(color: self.color, category: self.category, page: self.page)
            } else {
                RoyaleQuestion(nav: self.page, questionData: page.questionData)
            }
        }
    }
    
}

struct RoyaleMotherView_Previews: PreviewProvider {
    static var previews: some View {
        RoyaleMotherView()
    }
}
