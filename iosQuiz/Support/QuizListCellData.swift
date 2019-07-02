//
//  QuizListCellData.swift
//  iosQuiz
//
//  Created by Marko Barisic on 20/05/2019.
//  Copyright © 2019 Marko Barisic. All rights reserved.
//

import Foundation
import UIKit

struct QuizListCellData{
    let image: UIImage
    let title: String
    let description: String
    let level: Int
    
    init(image: UIImage, title: String, description: String, level: Int) {
        self.image = image
        self.title = title
        self.description = description
        self.level = level
    }
    
}
