//
//  ItemView.swift
//  ToDo
//
//  Created by Ash Kumar on 2024-03-04.
//

import SwiftUI

struct ItemView: View {
    
    @StateObject var itemModel = ItemViewModel()
    @Binding var newItemPresented: Bool
    var body: some View {
        VStack {
            Text("New Item")
                .bold()
                .font(.system(size: 32))
                .padding()
            
            Form{
                // Title
                TextField("Item Name", text: $itemModel.title)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                // Due Date
                DatePicker("Due Date", selection: $itemModel.dueDate)
                    .datePickerStyle(GraphicalDatePickerStyle())
                
                // Button
                NormalButton(text: "Create", color: .blue) {
                    if itemModel.canSave {
                        itemModel.save()
                        newItemPresented = false
                    } else {
                        itemModel.showAlert = true
                    }
                    
                }
            }.alert(isPresented: $itemModel.showAlert, content: {
                Alert(title: Text("Error"), message: Text("Please fill in all fields and select a valid due date"))
            })
        }
    }
}

#Preview {
    ItemView(newItemPresented: Binding(get: {
        return true
    }, set:{ _ in
    }
    ))
}
