//
//  ContentView.swift
//  ToDo
//
//  Created by Ash Kumar on 2024-03-04.
//

import SwiftUI

struct MainView: View {
    
    
    @StateObject var viewModel = MainViewModel()
    
    var body: some View {
        NavigationView {
            if viewModel.isSignedIn, !viewModel.currentUserID.isEmpty{
                TabView{
                    ToDoListItemsView(userId: viewModel.currentUserID)
                        .tabItem {
                            Label("Home", systemImage: "house")
                        }
                    ProfileView()
                        .tabItem {
                            Label("Profile", systemImage: "person.circle")
                        }
                }
                
            } else{
                LoginView()
            }
        }
    }
}

#Preview {
    MainView()
}
