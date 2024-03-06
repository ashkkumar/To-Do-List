//
//  CreateItemsView.swift
//  ToDo
//
//  Created by Ash Kumar on 2024-03-04.
//

import SwiftUI

struct CreateItemsView: View {
    
    @StateObject var createdModel = CreateItemsViewModel()
    
    let item: ToDoListItem
    var body: some View {
        HStack{
            VStack(alignment: .leading){
                Text(item.title)
                    .font(.body)
                Text("\(Date(timeIntervalSince1970: item.dueDate).formatted(date: .abbreviated, time: .shortened))")
                    .font(.footnote)
            }
            Spacer()
            
            Button(action: {
                createdModel.toggleDone(item: item)
            }, label: {
                Image(systemName: item.isDone ? "checkmark.circle.fill" : "circle")
                    .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
            })
        }
    }
}

#Preview {
    CreateItemsView(item: .init(id: "12e312", title: "milk", dueDate: Date().timeIntervalSince1970, createdDate: Date().timeIntervalSince1970, isDone: false))
}
