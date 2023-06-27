//
//  CustomDivider.swift
//  MyTwitter
//
//  Created by Шарап Бамматов on 27.06.2023.
//

import SwiftUI

struct CustomDivider: View {
    @State var width = UIScreen.main.bounds.width
    
    var body: some View {
        Rectangle()
            .frame(width: width, height: 1, alignment: .center)
            .foregroundColor(.gray)
            .opacity(0.3)
    }
}

struct CustomDivider_Previews: PreviewProvider {
    static var previews: some View {
        CustomDivider()
    }
}
