//
//  LoginView.swift
//  ToDo
//
//  Created by Ash Kumar on 2024-03-04.
//

import SwiftUI

struct LoginView: View {
    
    @StateObject var loginModel = LoginViewModel()
    
    var body: some View {
        NavigationView {
            VStack{
                //Header
                HeaderView(title: "To Do List",subtitle: "Be Productive, Be Better", color: .blue)
                
                
                //Login Form
                Form {
                    
                    if !loginModel.errorMsg.isEmpty {
                        Text(loginModel.errorMsg)
                            .foregroundColor(.red)
                    }
                    
                    TextField("Enter Email Address", text: $loginModel.email)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                        .autocorrectionDisabled()
                    SecureField("Password", text: $loginModel.password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                        .autocorrectionDisabled()
                    
                    NormalButton(text: "Login", color: .blue){
                        loginModel.login()
                    }
                }
                
                
                // Create User
                VStack{
                    Text("Not signed up yet?")
                    NavigationLink("Create an Account", destination: RegistrationView())
                        
                }.padding(.bottom, 50)
                
            }
        }
        Spacer()
    }
}

#Preview {
    LoginView()
}
