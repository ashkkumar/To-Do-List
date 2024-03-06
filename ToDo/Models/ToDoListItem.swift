//
//  ToDoListItem.swift
//  ToDo
//
//  Created by Ash Kumar on 2024-03-04.
//

import Foundation

struct ToDoListItem: Codable, Identifiable {
    
    let id: String
    let title: String
    let dueDate: TimeInterval
    let createdDate: TimeInterval
    var isDone: Bool
    
    mutating func setDone(_ state: Bool){
        isDone = state
    }
}
