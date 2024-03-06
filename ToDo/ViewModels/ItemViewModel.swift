//
//  ItemViewModel.swift
//  ToDo
//
//  Created by Ash Kumar on 2024-03-04.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation

class ItemViewModel: ObservableObject {
    
    @Published var title: String = ""
    @Published var dueDate: Date = Date()
    @Published var showAlert: Bool = false
    
    init(){}
    
    func save(){
        guard canSave else {
            return
        }
        
        // Get current user ID
        guard let uID = Auth.auth().currentUser?.uid else{
            return
        }
        
        //Create Model
        let newUID = UUID().uuidString
        let newItem = ToDoListItem(id: newUID,
                                   title: title,
                                   dueDate: dueDate.timeIntervalSince1970,
                                   createdDate: Date().timeIntervalSince1970,
                                   isDone: false)
        
        
        // Save model
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(uID)
            .collection("todos")
            .document(newUID)
            .setData(newItem.asDictionary())
    }
    
    var canSave: Bool{
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty
        else{
            return false
        }
        guard dueDate >= Date().addingTimeInterval(-86400)
        else{
            return false
        }
        return true
    }
    
}
