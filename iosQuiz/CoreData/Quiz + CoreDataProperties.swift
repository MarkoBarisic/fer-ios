//
//  Quiz + CoreDataProperties.swift
//  iosQuiz
//
//  Created by Marko Barisic on 23/06/2019.
//  Copyright © 2019 Marko Barisic. All rights reserved.
//

import Foundation
import CoreData
import UIKit

enum QuizCategory: String {
    case sports = "SPORTS"
    case science = "SCIENCE"
    
    var color: UIColor  {
        switch self {
        case .sports:
            return UIColor.yellow
        case .science:
            return UIColor.orange
        }
    }
}


extension Quiz{
    
    @nonobjc public class func fetchRequest() -> NSFetchRequest<Quiz>{
        return NSFetchRequest<Quiz>(entityName: "Quiz")
    }
    
    @NSManaged public var category: String
    @NSManaged public var desc: String?
    @NSManaged public var id: Int32
    @NSManaged public var imageUrl: String?
    @NSManaged public var level: Int32
    @NSManaged public var opened: Bool
    @NSManaged public var title: String
    @NSManaged public var questions: NSOrderedSet
    
    @objc(addQuestionsObject:)
    @NSManaged public func addToQuestions(_ value: Question)
    
    @objc(insertObject:inQuestionsAtIndex:)
    @NSManaged public func insertIntoQuestions(_ value: Question, at idx: Int)
    
    @objc(removeObjectFromQuestionsAtIndex:)
    @NSManaged public func removeFromQuestions(at idx: Int)
    
    @objc(insertQuestions:atIndexes:)
    @NSManaged public func insertIntoQuestions(_ values: [Question], at indexes: NSIndexSet)
    
    @objc(removeQuestionsAtIndexes:)
    @NSManaged public func removeFromQuestions(at indexes: NSIndexSet)
    
    @objc(replaceObjectInQuestionsAtIndex:withObject:)
    @NSManaged public func replaceQuestions(at idx: Int, with value: Question)
    
    @objc(replaceQuestionsAtIndexes:withQuestions:)
    @NSManaged public func replaceQuestions(at indexes: NSIndexSet, with values: [Question])

    @objc(removeQuestionsObject:)
    @NSManaged public func removeFromQuestions(_ value: Question)
    
    @objc(addQuestions:)
    @NSManaged public func addToQuestions(_ values: NSOrderedSet)
    
    @objc(removeQuestions:)
    @NSManaged public func removeFromQuestions(_ values: NSOrderedSet)

}
