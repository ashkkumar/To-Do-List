//
//  ToDoListItemsView.swift
//  ToDo
//
//  Created by Ash Kumar on 2024-03-04.
//

import FirebaseFirestoreSwift
import SwiftUI

struct ToDoListItemsView: View {
    
    @StateObject var todoListItemsModel: ToDoListIttemsViewModel
    @FirestoreQuery var items: [ToDoListItem]
    
    init(userId: String){
        self._items = FirestoreQuery(collectionPath:
                                        "users/\(userId)/todos")
        self._todoListItemsModel = StateObject(
            wrappedValue: ToDoListIttemsViewModel(userID: userId))
    }
    
    var body: some View {
        NavigationView{
            VStack{
                List(items) {
                    item in
                    CreateItemsView(item: item)
                        .listStyle(PlainListStyle())
                        .swipeActions{
                            Button(action: {
                                todoListItemsModel.delete(id: item.id)
                            }, label: {
                                Text("Delete")
                                    
                            }).tint(.red)
                        }
                }
            }
            .navigationTitle("To Do List")
            .toolbar{
                Button(action: {
                    todoListItemsModel.showingNewItemView = true
                }, label: {
                    Image(systemName: "plus")
                })
            }
            .sheet(isPresented: $todoListItemsModel.showingNewItemView, content: {
                ItemView(newItemPresented: $todoListItemsModel.showingNewItemView)
            })
        }
    }
}

#Preview {
    ToDoListItemsView(userId: "QBki07CEFzSILpYsntkFQ0VG2Bu2")
}
