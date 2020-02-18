//
//  NetworkingManager.swift
//  Royale
//
//  Created by Arnav Thirunagari on 2/17/20.
//  Copyright © 2020 Arnav Thirunagari. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

class NetworkingManager : ObservableObject {
    
    @State var category = 21
    
    var didChange = PassthroughSubject<NetworkingManager, Never>()
    var questionList = QuestionList(results: []) {
        didSet {
            didChange.send(self)
        }
    }
    
    init() {
        guard let url = URL(string: "https://opentdb.com/api.php?amount=1&category=\(self.category)&type=multiple") else {return}
        URLSession.shared.dataTask(with: url) {
            (data, _, _) in
            guard let data = data else {return}
            let questionList = try! JSONDecoder().decode(QuestionList.self, from: data)
            
            print(questionList)
            
            DispatchQueue.main.async {
                self.questionList = questionList
            }
        }.resume()
    }
}
