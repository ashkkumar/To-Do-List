//
//  ToDoApp.swift
//  ToDo
//
//  Created by Ash Kumar on 2024-03-04.
//

import FirebaseCore
import SwiftUI

@main
struct ToDoApp: App {
    
    init(){
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
