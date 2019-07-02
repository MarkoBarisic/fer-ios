//
//  LeaderboardViewModel.swift
//  iosQuiz
//
//  Created by Marko Barisic on 28/06/2019.
//  Copyright © 2019 Marko Barisic. All rights reserved.
//

import Foundation

class LeaderboardViewModel {
    private var quizScores: [QuizScore]?
    private var quiz: Quiz
    
    var quizTitle: String {
        return quiz.title
    }
    
    init(forQuiz quiz: Quiz) {
        self.quiz = quiz
    }
    
    func fetchQuizScores(completion: @escaping () -> Void) {
        let quizService = QuizService()
        quizService.fetchScore(urlString: "https://iosquiz.herokuapp.com/api/score?quiz_id=\(quiz.id)") { [weak self] (quizScores) in
            self?.quizScores = quizScores?.sorted { (quizScore1, quizScore2) in
                return quizScore1.score > quizScore2.score
            }
            completion()
        }
    }
    
    func numberOfRows() -> Int {
        return quizScores?.count ?? 0
    }
    
    func scoreCellData(atIndexPath indexPath: IndexPath) -> ScoreCellData? {
        guard let quizScores = quizScores else {
            return nil
        }
        let quizScore = quizScores[indexPath.row]
        return ScoreCellData(place: indexPath.row + 1, user: quizScore.username, score: quizScore.score)
    }
}
