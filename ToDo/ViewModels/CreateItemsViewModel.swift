//
//  CreateItemsViewModel.swift
//  ToDo
//
//  Created by Ash Kumar on 2024-03-04.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation

class CreateItemsViewModel: ObservableObject{
    
    
    init(){}
    
    func toggleDone(item: ToDoListItem){
        var newItem = item
        newItem.setDone(!item.isDone)
        
        guard let uid = Auth.auth().currentUser?.uid else{
            return
        }
        
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(uid)
            .collection("todos")
            .document(newItem.id)
            .setData(newItem.asDictionary())
    }
    
}
