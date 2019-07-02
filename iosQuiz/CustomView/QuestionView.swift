////
////  QuestionView.swift
////  iosQuiz
////
////  Created by Marko Barisic on 10/04/2019.
////  Copyright © 2019 Marko Barisic. All rights reserved.
////
//
//import UIKit
//
//class QuestionView: UIView {
//
//    var question: Question? = nil
//    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//    }
//    
//    convenience init(frame: CGRect, question: Question) {
//        self.init(frame: frame)
//        self.question = question
//        setupView()
//    }
//    
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//    func setupView(){
//        setupViews()
//    }
//    
//    func setupViews(){
//        let labelQuestion: UILabel = {
//            let label = UILabel(frame: .zero)
//            label.text = "\(question!.question)"
//            label.font = UIFont.systemFont(ofSize: 30)
//            label.numberOfLines = 0
//            label.textAlignment = .left
//            label.textColor = UIColor.white
//            label.backgroundColor = UIColor.clear
//            label.adjustsFontSizeToFitWidth = true
//            return label
//        }()
//        
//        let buttonA: UIButton = {
//            let button = UIButton(type: .system)
//            button.setTitle("a) \(question!.answers[0])", for: .normal)
//            button.setTitleColor(.white, for: .normal)
//            button.titleLabel?.font = UIFont.systemFont(ofSize: 30)
//            button.backgroundColor = UIColor.clear
//            return button
//        }()
//        
//        let buttonB: UIButton = {
//            let button = UIButton(type: .system)
//            button.setTitle("b) \(question!.answers[1])", for: .normal)
//            button.setTitleColor(.white, for: .normal)
//            button.titleLabel?.font = UIFont.systemFont(ofSize: 30)
//            button.backgroundColor = UIColor.clear
//            return button
//        }()
//        
//        let buttonC: UIButton = {
//            let button = UIButton(type: .system)
//            button.setTitle("c) \(question!.answers[2])", for: .normal)
//            button.setTitleColor(.white, for: .normal)
//            button.titleLabel?.font = UIFont.systemFont(ofSize: 30)
//            button.backgroundColor = UIColor.clear
//            return button
//        }()
//        
//        let buttonD: UIButton = {
//            let button = UIButton(type: .system)
//            button.setTitle("d) \(question!.answers[3])", for: .normal)
//            button.setTitleColor(.white, for: .normal)
//            button.titleLabel?.font = UIFont.systemFont(ofSize: 30)
//            button.backgroundColor = UIColor.clear
//            return button
//        }()
//        
//        self.addSubview(labelQuestion)
//        self.addSubview(buttonA)
//        self.addSubview(buttonB)
//        self.addSubview(buttonC)
//        self.addSubview(buttonD)
//        
//        labelQuestion.constraint(bottom: nil, bFloat: 0, top: self.topAnchor, tFloat: 5, right: self.rightAnchor, rFloat: 0, left: self.leftAnchor, lFloat: 0)
//        
//        buttonA.constraint(bottom: labelQuestion.bottomAnchor, bFloat: 50, top: labelQuestion.bottomAnchor, tFloat: 20, right: self.rightAnchor, rFloat: 0, left: self.leftAnchor, lFloat: 0)
//        
//        buttonB.constraint(bottom: buttonA.bottomAnchor, bFloat: 35, top: buttonA.bottomAnchor, tFloat: 5, right: self.rightAnchor, rFloat: 0, left: self.leftAnchor, lFloat: 0)
//        
//        buttonC.constraint(bottom: buttonB.bottomAnchor, bFloat: 35, top: buttonB.bottomAnchor, tFloat: 5, right: self.rightAnchor, rFloat: 0, left: self.leftAnchor, lFloat: 0)
//        
//        buttonD.constraint(bottom: buttonC.bottomAnchor, bFloat: 35, top: buttonC.bottomAnchor, tFloat: 5, right: self.rightAnchor, rFloat: 0, left: self.leftAnchor, lFloat: 0)
//        
//    }
//    
//    func setupConstraints(){
//        
//    }
//    
////    UIViews
//    
//}

