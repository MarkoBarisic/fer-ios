//
//  QuizScore.swift
//  iosQuiz
//
//  Created by Marko Barisic on 24/06/2019.
//  Copyright © 2019 Marko Barisic. All rights reserved.
//

import Foundation

struct QuizScore {
    let score: Double
    let username: String
    
    init?(json: Any){
        if  let jsonDict = json as? [String : Any],
            let scoreOpt = jsonDict["score"] as? String,
            let usernameOpt = jsonDict["username"] as? String
        {
            if let scoreDouble = Double(scoreOpt) {
                self.score = scoreDouble
                self.username = usernameOpt
            } else {return nil}
        } else {return nil}
    }
}
