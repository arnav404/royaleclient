//
//  CategoryButton.swift
//  Royale
//
//  Created by Arnav Thirunagari on 2/17/20.
//  Copyright © 2020 Arnav Thirunagari. All rights reserved.
//

import SwiftUI
import Combine

class CategoryData: ObservableObject {
    @Published var category = 21
    @Published var bgColor = Color.blue
    @Published var screenShown = false
}

struct CategoryButton: View {
    
    @State var name = "Science"
    @State var bgColor = Color.pink
    @State var color = Color.pink
    @State var category = 19
    @ObservedObject var cd = CategoryData()
    
    var body: some View {
        Button(action: {
            self.cd.screenShown = true
            self.cd.bgColor = self.bgColor
            self.cd.category = self.category
        }) {
        VStack {
                    Text(self.name).font(Font(UIFont(name: "Avenir", size: 20.0)!)).fontWeight(.black).foregroundColor(self.color)
                    Image(name)
                        .accentColor(self.color)
                }
            }.frame(width: 125.0, height: 150.0)
            .background(self.bgColor)
                .cornerRadius(15.0)
                .shadow(radius: 2.0)
    }
}

struct CategoryButton_Previews: PreviewProvider {
    static var previews: some View {
        CategoryButton()
    }
}
