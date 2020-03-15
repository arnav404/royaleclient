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
import SocketIO

class NavigationController: ObservableObject {
    @Published var page = "lobby"
    @Published var room = ""
    @Published var isOn = true
    @Published var questionData = []
    @Published var manager = SocketManager(socketURL: URL(string: "http://localhost:5000")!, config: [.log(true), .compress])
}
