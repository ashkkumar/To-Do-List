//
//  LoginViewModel.swift
//  ToDo
//
//  Created by Ash Kumar on 2024-03-04.
//

import FirebaseAuth
import Foundation

class LoginViewModel: ObservableObject {
    
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var errorMsg: String = ""
    
    init(){
        
    }
    
    func login(){
        guard validate() else{
            return
        }
        
        // Try to log in
        
        Auth.auth().signIn(withEmail: email, password: password)
    }
    
    private func validate() -> Bool{
        errorMsg = ""
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
                !password.trimmingCharacters(in: .whitespaces).isEmpty
        else{
            errorMsg = "Please fill in all fields"
            return false
        }
        
        guard email.contains("@") && email.contains(".")
        else{
            errorMsg = "Please Enter a Valid Email Address"
            return false
        }
        
        return true
    }
    
}
