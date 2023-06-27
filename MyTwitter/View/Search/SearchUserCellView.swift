//
//  SearchUserCellView.swift
//  MyTwitter
//
//  Created by Шарап Бамматов on 27.06.2023.
//

import SwiftUI

struct SearchUserCellView: View {
    var body: some View {
        HStack {
            Image("logo")
                .resizable()
                .scaledToFit()
                .frame(width: 44, height: 44)
                .clipShape(Circle())
            
            VStack(alignment: .leading) {
                Text("Serega")
                    .fontWeight(.heavy)
                
                Text("@serega_pirat")
            }
            
            Spacer(minLength: 0)
        }
    }
}

struct SearchUserCellView_Previews: PreviewProvider {
    static var previews: some View {
        SearchUserCellView()
    }
}
