//
//  Category.swift
//  iosQuiz
//
//  Created by Marko Barisic on 11/04/2019.
//  Copyright © 2019 Marko Barisic. All rights reserved.
//

import Foundation
import UIKit
import CoreData


@objc(Quiz)
public class Quiz: NSManagedObject {
    
//    class func getEntityName() -> String{
//        return "Quiz"
//    }
    
    class func firstOrCreate(withId id: Int) -> Quiz?{
        let context = DataController.shared.persistentContainer.viewContext
        
        let request: NSFetchRequest<Quiz> = Quiz.fetchRequest()
        request.predicate = NSPredicate(format: "id = %d" , id)
        request.returnsObjectsAsFaults = false
        
        do{
            let quizzes = try context.fetch(request)
            if let quiz = quizzes.first {
                return quiz
            } else {
                let newQuiz = Quiz(context: context)
                return newQuiz
            }
        } catch {
            return nil
        }
    }
    
    class func createFrom(json: [String: Any]) -> Quiz? {
        if
            let category = json["category"] as? String,
            let description = json["description"] as? String?,
            let id = json["id"] as? Int,
            let level = json["level"] as? Int,
            let title = json["title"] as? String,
            let questions = json["questions"] as? [[String: Any]]{
            
            if let quiz = Quiz.firstOrCreate(withId: id){
                quiz.category = category
                quiz.desc = description
                quiz.id = Int32(id)
                quiz.level = Int32(level)
                quiz.title = title
                quiz.imageUrl = json["image"] as? String
                quiz.opened = false
                
                for jsonQuestion in questions{
                    guard let question = Question.createFrom(json: jsonQuestion)
                        else{ return nil }
                    quiz.addToQuestions(question)
                }
                
                do {
                    let context = DataController.shared.persistentContainer.viewContext
                    try context.save()
                    return quiz
                }
                catch {
                    print("Failed saving")
                }
            }
        }
        return nil
    }
}
