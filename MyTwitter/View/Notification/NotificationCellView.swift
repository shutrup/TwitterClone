//
//  NotificationCellView.swift
//  MyTwitter
//
//  Created by Шарап Бамматов on 27.06.2023.
//

import SwiftUI

struct NotificationCellView: View {
    
    var body: some View {
        VStack {
            CustomDivider()
            
            HStack(alignment: .top) {
                Image(systemName: "person.fill")
                    .resizable()
                    .foregroundColor(.blue)
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                
                VStack(alignment: .leading, spacing: 5) {
                    Image("logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 36, height: 36)
                        .cornerRadius(18)
                    
                    Text("Serega ")
                        .bold()
                        .foregroundColor(.primary)
                    
                    +
                    
                    Text("followed you")
                        .foregroundColor(.black)
                }
                
                Spacer()
            }
            .padding(.leading, 30)
        }
    }
}

struct NotificationCellView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationCellView()
    }
}
