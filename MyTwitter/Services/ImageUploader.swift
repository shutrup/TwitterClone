//
//  ImageUploader.swift
//  MyTwitter
//
//  Created by Шарап Бамматов on 07.07.2023.
//

import SwiftUI

struct ImageUploader {
    static func uploadImage(paramName: String, fileName: String, image: UIImage, urlPath: String) {
        guard let url = URL(string: "http://localhost:3000\(urlPath)") else { return }
        
        let boundary = UUID().uuidString
        
        let session = URLSession.shared
        
        var req = URLRequest(url: url)
        req.httpMethod = "POST"
        
        let token = UserDefaults.standard.string(forKey: "jsonwebtoken")!
        req.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        req.addValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
        
        var data = Data()
        
        data.append("\r\n--\(boundary)\r\n".data(using: .utf8)!)
        data.append("Content-Disposition: form-data; name=\"\(paramName)\"; filename=\"\(fileName)\"\r\n".data(using: .utf8)!)
        data.append("Content-Type: image/png\r\n\r\n".data(using: .utf8)!)
        data.append(image.pngData()!)
        
        data.append("\r\n--\(boundary)--\r\n".data(using: .utf8)!)
        
        session.uploadTask(with: req, from: data) { data, res, error in
            if error == nil {
                let jsonData = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments)
                
                if let jsonData = jsonData as? [String : Any] {
                    print(jsonData)
                }
            }
        }.resume()
    }
}
