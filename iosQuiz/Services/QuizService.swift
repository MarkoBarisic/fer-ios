//
//  QuizTitleService.swift
//  iosQuiz
//
//  Created by Marko Barisic on 11/04/2019.
//  Copyright © 2019 Marko Barisic. All rights reserved.
//

import Foundation
import UIKit

struct QuizResult {
    var quizId: Int
    var userId: Int
    var time: Double
    var numOfCorrect: Int
}
class QuizService {
    
    func fetchQuizzes(urlString: String, completion: @escaping ([Quiz]?) -> Void){
        guard let url = URL(string: urlString) else{
            completion(nil)
            return
        }
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) {
            (data, response, error) in
            
            if let data = data {
                var quizzes: [Quiz] = []
                do{
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    guard let jsonDictionary = json as? [String : Any],
                                let quizList = jsonDictionary["quizzes"] as? [[String : Any]]
                        else {
                                completion(nil)
                                return
                        }
                    for jsonQuiz in quizList{
                        if let quiz = Quiz.createFrom(json: jsonQuiz) {
                            quizzes.append(quiz)
                        }
                    }
                    completion(quizzes)
                } catch {
                    completion(nil)
                    print(error.localizedDescription)
                }
            }
        }
        task.resume()
    }
    
    func fetchImage(urlString: String, completion: @escaping (UIImage?) -> Void){
        guard let url = URL(string: urlString)
            else {
                completion(nil)
                return
            }
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) {
            (data, response, error) in
            
            if let data = data{
                let image = UIImage(data: data)
                completion(image)
            } else {
                completion(nil)
            }
        }
        task.resume()
    }
    
    func sendResult(urlString: String, quizResult: QuizResult, completion: @escaping (serverResponse?) -> Void) {
        if let url = URL(string: urlString) {
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            guard let token = UserDefaults.standard.string(forKey: "token") else {
                return
            }
            request.addValue(token, forHTTPHeaderField: "Authorization")
            let parameters: [String: Any] = [
                "quiz_id": quizResult.quizId,
                "user_id": quizResult.userId,
                "time:": quizResult.time,
                "no_of_correct": quizResult.numOfCorrect
            ]
            do {
                request.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
            } catch let error {
                print(error.localizedDescription)
                completion(nil)
            }

            let dataTask = URLSession.shared.dataTask(with: request) { (data, response, error) in
                if let response = response as? HTTPURLResponse {
                    let status = serverResponse(rawValue: response.statusCode)
                    print(response.statusCode)
                    completion(status)
                } else {
                    completion(nil)
                }
            }
            dataTask.resume()
        }
    }
    
    func fetchScore (urlString: String, completion: @escaping ([QuizScore]?) -> Void) {
        guard let url = URL(string: urlString)
            else {
                completion(nil)
                return
            }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        guard let token = UserDefaults.standard.string(forKey: "token")
            else {
                completion(nil)
                return
            }
        request.addValue(token, forHTTPHeaderField: "Authorization")
        var quizScores: [QuizScore] = []
        let task = URLSession.shared.dataTask(with: request) {
            (data, response, error) in
            guard let data = data
                else {
                completion(nil)
                return
                }
            do{
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                guard let jsonList = json as? [Any]
                    else {
                    completion(nil)
                    return
                    }
                for jsonScore in jsonList {
                    if let quizScore = QuizScore(json: jsonScore) {
                        quizScores.append(quizScore)
                    }
                }
                completion(quizScores)
            } catch {
                completion(nil)
            }
        }
        task.resume()
    }
}

enum serverResponse: Int {
    case ok = 200
    case badRequest = 400
    case unauthorized = 401
    case forbidden = 403
    case notFound = 404
}
