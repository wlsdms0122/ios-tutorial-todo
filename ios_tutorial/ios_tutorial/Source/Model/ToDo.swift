//
//  ToDo.swift
//  ios_tutorial
//
//  Created by JSilver on 2020/05/19.
//  Copyright © 2020 JSilver. All rights reserved.
//

import Foundation

struct ToDo {
    let content: String
    let description: String
    let priority: Priority
    
    let createAt: Date
    var isDone: Bool
    
    init(content: String, description: String, priority: Priority) {
        self.content = content
        self.description = description
        self.priority = priority
        createAt = Date()
        isDone = false
    }
    
    init(content: String) {
        self.init(content: content, description: "", priority: .medium)
    }
}

enum Priority: Int {
    case high = 0
    case medium
    case low
}
