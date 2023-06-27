//
//  Keyboard + Exts.swift
//  MyTwitter
//
//  Created by Шарап Бамматов on 27.06.2023.
//

import SwiftUI

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

