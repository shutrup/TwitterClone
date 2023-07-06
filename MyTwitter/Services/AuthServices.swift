//
//  AuthService.swift
//  MyTwitter
//
//  Created by Шарап Бамматов on 06.07.2023.
//

import SwiftUI

public class AuthServices {
    static func makeRequest() {
        guard let url = URL(string: "http://localhost:3000/users") else {
            return
        }
        
        let session = URLSession.shared
        
        var req = URLRequest(url: url)
        req.httpMethod = "POST"
        
        do {
            req.httpBody = try JSONSerialization.data(withJSONObject: reqBody, options: .prettyPrinted)
        } catch let error {
            print(error)
        }
        
        
        req.setValue("application/json", forHTTPHeaderField: "Content-Type")
        req.setValue("application/json", forHTTPHeaderField: "Accept")
        
        let task = session.dataTask(with: req) { data, res, error in
            guard error == nil else {
                return
            }
            
            guard let data = data else {
                return
            }
            
            do {
                if let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String : Any] {
                    
                }
            } catch let error {
                print(error)
            }
        }
            
        task.resume()
    }
}
