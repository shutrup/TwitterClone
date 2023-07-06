//
//  AuthService.swift
//  MyTwitter
//
//  Created by Шарап Бамматов on 06.07.2023.
//

import SwiftUI

enum NetworkError: Error {
    case invalidError
    case noData
    case decodingError
}

enum AuthenticationError: Error {
    case invalidCredentials
    case custom(errorMessage: String)
}

public class AuthServices {
    
    public static var requestDomain = ""
    
    static func login(email: String, password: String, completion: @escaping (_ result: Result<Data?,AuthenticationError>) -> Void) {
        guard let urlString = URL(string: "http://localhost:3000/users/login") else {
            return
        }
        
        makeRequest(
            urlString: urlString,
            reqBody: [
                "email": email,
                "password": password
            ])
        { result in
            switch result {
            case .success(let success):
                completion(.success(success))
            case .failure:
                completion(.failure(.invalidCredentials))
            }
        }
    }
    
    static func register(name: String, username: String, email: String, password: String, completion: @escaping (_ result: Result<Data?,AuthenticationError>) -> Void) {
        guard let urlString = URL(string: "http://localhost:3000/users") else {
            return
        }
        
        makeRequest(
            urlString: urlString,
            reqBody: [
                "name": name,
                "username": username,
                "email": email,
                "password": password
            ])
        { result in
            switch result {
            case .success(let data):
                completion(.success(data))
            case .failure:
                completion(.failure(.invalidCredentials))
            }
        }
    }
    
    static func makeRequest(urlString: URL, reqBody: [String : Any], completion: @escaping (_ result: Result<Data?,NetworkError>) -> Void) {
        let session = URLSession.shared
        
        var req = URLRequest(url: urlString)
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
                completion(.failure(.noData))
                return
            }
            
            do {
                if let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String : Any] {
                    
                }
            } catch {
                completion(.failure(.decodingError))
            }
        }
            
        task.resume()
    }
}
