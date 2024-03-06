//
//  RegistrationView.swift
//  ToDo
//
//  Created by Ash Kumar on 2024-03-04.
//

import SwiftUI

struct RegistrationView: View {
    
    @StateObject var regModel = RegistrationViewModel()
    
    var body: some View {
        VStack{
            //Header
            HeaderView(title: "Register", subtitle: "Start your Journey", color: .pink)
                .offset(y: -39)
            Spacer()
            
            Form {
                TextField("Name", text: $regModel.name)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                    .autocorrectionDisabled()
                TextField("Email Address", text: $regModel.email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                    .autocorrectionDisabled()
                SecureField("Password", text: $regModel.password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                    .autocorrectionDisabled()
                
                NormalButton(text: "Create Account", color: .pink){
                    regModel.register()
                }
                
            }.offset(y: -50)
        }
    }
}

#Preview {
    RegistrationView()
}
