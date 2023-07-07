//
//  RequestServices.swift
//  MyTwitter
//
//  Created by Шарап Бамматов on 07.07.2023.
//

import Foundation

public class RequestServices {
    public static var requestDomain = ""
    
    public static func postTweet(text: String, user: String, username: String, userId: String, completion: @escaping (_ result: [String : Any]?) -> Void) {
        let params = [
            "text": text,
            "userId": userId,
            "username": username,
            "user": user
        ] as [String : Any]
        
        guard let url = URL(string: requestDomain) else { return }
        
        let session = URLSession.shared
        
        var req = URLRequest(url: url)
        req.httpMethod = "POST"
        
        do {
            req.httpBody = try JSONSerialization.data(withJSONObject: params, options: .prettyPrinted)
        } catch {
            print("JSONSerialization ERROR")
        }
        
        let token = UserDefaults.standard.string(forKey: "jsonwebtoken")!
        req.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        req.addValue("application/json", forHTTPHeaderField: "Content-Type")
        req.addValue("application/json", forHTTPHeaderField: "Accept")
        
        let task = session.dataTask(with: req) { data, res, error in
            guard error == nil else { return }
            
            guard let data = data else { return }
            
            do {
                if let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String : Any] {
                    completion(json)
                }
            } catch {
                print("JSONSerialization error")
            }
        }
        
        task.resume()
    }
    
    static func fetchTweets(completion: @escaping (_ result: Result<Data?, NetworkError>) -> Void) {
        guard let url = URL(string: requestDomain) else { return }
        
        let session = URLSession.shared
        
        var req = URLRequest(url: url)
        req.httpMethod = "GET"
        req.addValue("application/json", forHTTPHeaderField: "Content-Type")
        req.addValue("application/json", forHTTPHeaderField: "Accept")
        
        let task = session.dataTask(with: req) { data, res, error in
            guard error == nil else {
                completion(.failure(.noData))
                return
            }
            
            guard let data = data else {
                completion(.failure(.noData))
                return
            }
            
            completion(.success(data))
        }
        
        task.resume()
    }
}
