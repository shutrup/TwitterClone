//
//  TopBar.swift
//  MyTwitter
//
//  Created by Шарап Бамматов on 27.06.2023.
//

import SwiftUI

struct TopBar: View {
    @Binding var x: CGFloat
    
    var body: some View {
        VStack {
            HStack {
                Button {
                    withAnimation {
                        x = 0
                    }
                } label: {
                    Image(systemName: "line.horizontal.3")
                        .font(.system(size: 24))
                        .foregroundColor(Color("bg"))
                }
                
                Spacer()
                
                Image("twitter")
                    .resizable()
                    .scaledToFill()
                    .padding(.trailing)
                    .frame(width: 20, height: 20)
                
                Spacer()
            }
            .padding()
            
            CustomDivider()
        }
        .background(.white)
    }
}

struct TopBar_Previews: PreviewProvider {
    static var previews: some View {
        TopBar(x: .constant(0.5))
    }
}
