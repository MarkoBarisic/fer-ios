//
//  QuizTableFooter.swift
//  iosQuiz
//
//  Created by Marko Barisic on 28/06/2019.
//  Copyright © 2019 Marko Barisic. All rights reserved.
//

import UIKit

class QuizTableFooter: UIView {

    let logoutButton = UIButton.init()
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        logoutButton.titleLabel?.text = "logout"
        
        addSubview(logoutButton)
    }

}
