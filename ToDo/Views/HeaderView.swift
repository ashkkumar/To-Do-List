//
//  HeaderView.swift
//  ToDo
//
//  Created by Ash Kumar on 2024-03-04.
//

import SwiftUI

struct HeaderView: View {
    
    let title: String
    let subtitle: String
    let color: Color
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 0)
                .foregroundColor(color)
            
            VStack{
                Text(title)
                    .font(.system(size: 50))
                    .bold()
                Text(subtitle)
                    .font(.system(size: 30))
            }.padding(.top, 40)
            
        }.frame(width: UIScreen.main.bounds.width * 3, height: 300)
            .offset(x: 0, y: -100)
    }
}

#Preview {
    HeaderView(title: "Title", subtitle: "Subtitle", color: .blue)
}
