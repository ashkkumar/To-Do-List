//
//  ToDoListIttemsViewModel.swift
//  ToDo
//
//  Created by Ash Kumar on 2024-03-04.
//

import Foundation
import FirebaseFirestore

class ToDoListIttemsViewModel: ObservableObject{
    
    @Published var showingNewItemView: Bool = false
    
    private let userId: String
    
    
    init(userID: String){
        self.userId = userID
        
    }
    
    func delete(id: String){
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(userId)
            .collection("todos")
            .document(id)
            .delete()
        
    }
    
}
