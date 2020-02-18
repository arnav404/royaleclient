//
//  CategoryButton.swift
//  Royale
//
//  Created by Arnav Thirunagari on 2/17/20.
//  Copyright © 2020 Arnav Thirunagari. All rights reserved.
//

import SwiftUI

struct CategoryButton: View {
    
    @State var name = "Science"
    @State var bgColor = Color.pink
    @State var color = Color.pink
    @State var category = 21
    
    var body: some View {
        NavigationLink(destination: ContentView(color: self.bgColor)) {
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
