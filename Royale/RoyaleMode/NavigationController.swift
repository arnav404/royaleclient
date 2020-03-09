//
//  NavigationController.swift
//  Royale
//
//  Created by Arnav Thirunagari on 2/28/20.
//  Copyright © 2020 Arnav Thirunagari. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

class NavigationController: ObservableObject {
    @Published var page = "lobby"
    @Published var isOn = true
    @Published var questionData = []
}
