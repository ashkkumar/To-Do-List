//
//  ProfileView.swift
//  ToDo
//
//  Created by Ash Kumar on 2024-03-04.
//

import SwiftUI

struct ProfileView: View {
    
    @StateObject var profileViewModel = ProfileViewModel()
    
    var body: some View {
        NavigationView{
            VStack{
                // Avatar
                    Image(systemName: "person.circle")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                        .frame(width: 125, height: 125)
                    
                    // Info
                    VStack(alignment: .leading) {
                        
                        HStack{
                            Text("ID: ")
                                .bold()
                            Text("ckahbiuch1912eii1udb")
                        }
                        .padding()
                        HStack{
                            Text("Name: ")
                                .bold()
                            Text("")
                        }
                        .padding()
                        HStack{
                            Text("Email: ")
                                .bold()
                            Text("")
                        }
                        .padding()
                        
                    }
                    
                    Spacer()
                    // Sign Out
                    Button(action: {
                        profileViewModel.signout()
                    }, label: {
                        Text("Sign Out")
                    }).tint(.red)
                    
                }
            }
                
            .navigationTitle("Profile")
        }
            
    }
    

#Preview {
    ProfileView()
}
