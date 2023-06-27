//
//  MessageCellView.swift
//  MyTwitter
//
//  Created by Шарап Бамматов on 27.06.2023.
//

import SwiftUI

struct MessageCellView: View {
    @State var width = UIScreen.main.bounds.width
    
    var body: some View {
        VStack(alignment: .leading, spacing: nil) {
            CustomDivider()
            
            HStack {
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 60, height: 60)
                    .cornerRadius(30)
                    .padding(.leading)
                
                VStack(alignment: .leading, spacing: 0) {
                    HStack {
                        Text("Serega Pirat")
                            .fontWeight(.bold)
                            .foregroundColor(.primary)
                        
                        Text("@serega_pirat")
                            .foregroundColor(.gray)
                        
                        Spacer(minLength: 0)
                        
                        Text("6/10/23")
                            .foregroundColor(.gray)
                            .padding(.trailing)
                    }
                    
                    Text("Lox fasdfa fasd fasd iuaf iukjf asuhuiaf oub asf aofa sd  ")
                        .foregroundColor(.gray)
                    
                    Spacer()
                }
            }
            .padding(.top, 2)
        }
        .frame(width: width, height: 84)
    }
}

struct MessageCellView_Previews: PreviewProvider {
    static var previews: some View {
        MessageCellView()
    }
}
