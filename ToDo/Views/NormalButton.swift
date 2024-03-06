//
//  NormalButton.swift
//  ToDo
//
//  Created by Ash Kumar on 2024-03-04.
//

import SwiftUI

struct NormalButton: View {
    
    let text: String
    let color: Color
    let action: ()-> Void
    
    var body: some View {
        Button(
            action: {
                action()
            },
               label: {
                   ZStack{
                       RoundedRectangle(cornerRadius: 15)
                           .foregroundColor(color)
                       Text(text)
                           .foregroundColor(.white)
                           .bold()
                   }
               }).padding()
    }
}

#Preview {
    NormalButton(text: "Button", color: .blue){
        //Action
    }
}
