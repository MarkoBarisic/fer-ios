//
//  Question + CoreDataProperties.swift
//  iosQuiz
//
//  Created by Marko Barisic on 23/06/2019.
//  Copyright © 2019 Marko Barisic. All rights reserved.
//

import Foundation
import CoreData
import UIKit

extension Question {
    
    @nonobjc public class func fetchRequest() -> NSFetchRequest<Question> {
        return NSFetchRequest<Question>(entityName: "Question")
    }
    
    @NSManaged public var answers: [String]
    @NSManaged public var correctAnswer: Int32
    @NSManaged public var id: Int32
    @NSManaged public var question: String

}
