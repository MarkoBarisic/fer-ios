//
//  LoginService.swift
//  iosQuiz
//
//  Created by Marko Barisic on 20/05/2019.
//  Copyright © 2019 Marko Barisic. All rights reserved.
//

import Foundation
import UIKit

class LoginService {
    
    func login(urlString: String, username: String, password: String, completion: @escaping ((String, Int)?) -> ()){
        var request = URLRequest(url: URL(string: urlString)!)
        request.httpMethod = "POST"
        let parameters: [String : String] = ["username": username, "password": password]
        request.httpBody = parameters.percentEscaped().data(using: .utf8)
        let task = URLSession.shared.dataTask(with: request) {(data, response, error) in
            if let data = data {
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    if let jsonDict = json as? [String: Any], let token = jsonDict["token"] as? String,
                        let userId = jsonDict["user_id"] as? Int {
                        completion((token, userId))
                    } else {
                        completion(nil)
                    }
                } catch {
                    completion(nil)
                }
            }
        }
        task.resume()
    }
}

extension Dictionary {
    func percentEscaped() -> String {
        return map { (key, value) in
            let escapedKey = "\(key)".addingPercentEncoding(withAllowedCharacters: .urlQueryValueAllowed) ?? ""
            let escapedValue = "\(value)".addingPercentEncoding(withAllowedCharacters: .urlQueryValueAllowed) ?? ""
            return escapedKey + "=" + escapedValue
            }
            .joined(separator: "&")
    }
}

extension CharacterSet {
    static let urlQueryValueAllowed: CharacterSet = {
        let generalDelimitersToEncode = ":#[]@" // does not include "?" or "/" due to RFC 3986 - Section 3.4
        let subDelimitersToEncode = "!$&'()*+,;="
        
        var allowed = CharacterSet.urlQueryAllowed
        allowed.remove(charactersIn: "\(generalDelimitersToEncode)\(subDelimitersToEncode)")
        return allowed
    }()
}
