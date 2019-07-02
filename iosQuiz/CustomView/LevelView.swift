////
////  levelView.swift
////  iosQuiz
////
////  Created by Marko Barisic on 12/04/2019.
////  Copyright © 2019 Marko Barisic. All rights reserved.
////
//
//import UIKit
//
//class LevelView: UIView {
//
//    var category: String = ""
//    var quizzes: [Quiz] = []
//    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//    }
//    
//    convenience init(frame: CGRect, category: String, quizzes: [Quiz]){
//        self.init(frame: frame)
//        self.category = category
//        self.quizzes = quizzes
//        setup()
//    }
//    
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//    func setup(){
//        setupViews()
//    }
//    
//    func setupViews(){
//        self.addSubview(labelLevel)
//        setupConstraints()
//        var offset: CGFloat = 0
//        for object in quizzes{
//            if object.category == category{
//                let buttonLevel: UIButton = {
//                    let button = UIButton(type: .system)
//                    button.setTitle("Level \(object.level)", for: .normal)
//                    button.setTitleColor(.white, for: .normal)
//                    button.titleLabel?.font = UIFont.systemFont(ofSize: 30)
//                    button.backgroundColor = object.color
//                    return button
//                }()
//                self.addSubview(buttonLevel)
//                buttonLevel.constraint(bottom: labelLevel.bottomAnchor, bFloat: 50+offset, top: labelLevel.bottomAnchor, tFloat: 5+offset, right: self.rightAnchor, rFloat: 0, left: self.leftAnchor, lFloat: 0)
//                offset += 50
//            }
//        }
//    }
//    
//    func setupConstraints(){
//        labelLevel.constraint(bottom: self.topAnchor, bFloat: 55, top: self.topAnchor, tFloat: 0, right: self.rightAnchor, rFloat: 0, left: self.leftAnchor, lFloat: 0)
//        
//    }
//    
////    UIViews
//
//    let labelLevel: UILabel = {
//        let label = UILabel(frame: .zero)
//        label.text = "Pick a level"
//        label.font = UIFont.systemFont(ofSize: 50)
//        label.textColor = UIColor.white
//        label.numberOfLines = 0
//        label.backgroundColor = UIColor.clear
//        label.textAlignment = .center
//        label.adjustsFontSizeToFitWidth = true
//        return label
//    }()
//}

