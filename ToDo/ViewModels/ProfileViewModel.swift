//
//  ProfileViewModel.swift
//  ToDo
//
//  Created by Ash Kumar on 2024-03-04.
//

import Foundation

import FirebaseAuth
import FirebaseFirestore

class ProfileViewModel: ObservableObject {
    
    @Published var user: User? = nil
    
    init(){}
    
    func fetch(){
        guard let userId = Auth.auth().currentUser?.uid else{
            return
        }
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(userId)
            .getDocument{ [weak self] snapshot, error in
                guard let data = snapshot?.data(), error == nil else {
                    return
                }
                
                DispatchQueue.main.async{
                    self?.user = User(
                        id: data["id"] as? String ?? "",
                         name: data["name"] as? String ?? "",
                         emailAddr: data["email"] as? String ?? "")
                }
            }
    }
    
    func signout(){
        do{
            try Auth.auth().signOut()
        } catch{
                print(error)
            }
        }
    
}
