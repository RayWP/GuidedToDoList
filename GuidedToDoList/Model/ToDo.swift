//
//  ToDo.swift
//  GuidedToDoList
//
//  Created by Raymond on 25/06/21.
//

import Foundation

struct ToDo{
    var title: String
    var isComplete: Bool
    var dueDate: Date
    var notes: String?
    
    static func loadToDos() -> [ToDo]? {
        return nil
    }
    
    static func loadSampleToDos() -> [ToDo] {
        let todo1 = ToDo(title: "Event 1", isComplete: false, dueDate: Date(), notes: "Notes 1")
        let todo2 = ToDo(title: "Event 2", isComplete: false, dueDate: Date(), notes: "Notes 2")
        let todo3 = ToDo(title: "Event 3", isComplete: false, dueDate: Date(), notes: "Notes 3")
        
        return [todo1, todo2, todo3]
    }
    
    static let dueDateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        return formatter
    }()
}
