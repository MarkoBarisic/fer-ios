////
////  DescriptionView.swift
////  iosQuiz
////
////  Created by Marko Barisic on 12/04/2019.
////  Copyright © 2019 Marko Barisic. All rights reserved.
////
//
//import UIKit
//
//class QuizView: UIView {
//    
//    var category: String = ""
//    var level: Int = 0
//    var quizzes: [Quiz] = []
//    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//    }
//    
//    convenience init(frame: CGRect, category:String, level: Int, quizzes: [Quiz]){
//        self.init(frame: frame)
//        self.category = category
//        self.level = level
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
//        for object in quizzes{
//            if object.category == self.category && object.level == self.level {
//                let imageView = object.imageView
//                
//                let labelDescription: UILabel = {
//                    let label = UILabel(frame: .zero)
//                    label.text = "\(object.title)\n\(object.description)"
//                    label.font = UIFont.systemFont(ofSize: 25)
//                    label.textColor = UIColor.white
//                    label.numberOfLines = 0
//                    label.backgroundColor = UIColor.clear
//                    label.textAlignment = .center
//                    label.adjustsFontSizeToFitWidth = true
//                    return label
//                }()
////                let imageView: UIImageView = {
////                    let imageV = UIImageView(frame: .zero)
////                    let quizService = QuizService()
////                    quizService.fetchImage(urlString: object.imageString) {(img) in
////                        DispatchQueue.main.async {
////                            imageV.image = img
////                        }
////                    }
////                    return imageV
////                }()
//                
//                let categoryLevelLabel: UILabel = {
//                    let label = UILabel(frame: .zero)
//                    label.text = "\(self.category) level \(self.level)"
//                    label.font = UIFont.systemFont(ofSize: 50)
//                    label.textColor = UIColor.white
//                    label.numberOfLines = 0
//                    label.backgroundColor = UIColor.clear
//                    label.textAlignment = .center
//                    label.adjustsFontSizeToFitWidth = true
//                    return label
//                }()
//                self.addSubview(imageView)
//                imageView.constraint(bottom: self.topAnchor, bFloat: 150, top: self.topAnchor, tFloat: 0, right: self.rightAnchor, rFloat: 0, left: self.leftAnchor, lFloat: 0)
//                self.addSubview(categoryLevelLabel)
//                categoryLevelLabel.constraint(bottom: imageView.bottomAnchor, bFloat: 55, top: imageView.bottomAnchor, tFloat: 5, right: self.rightAnchor, rFloat: 0, left: self.leftAnchor, lFloat: 0)
//                self.addSubview(labelDescription)
//                labelDescription.constraint(bottom: categoryLevelLabel.bottomAnchor, bFloat: 55, top: categoryLevelLabel.bottomAnchor, tFloat: 10, right: self.rightAnchor, rFloat: 0, left: self.leftAnchor, lFloat: 0)
//                self.addSubview(buttonStart)
//                buttonStart.constraint(bottom: labelDescription.bottomAnchor, bFloat: 80, top: labelDescription.bottomAnchor, tFloat: 20, right: self.rightAnchor, rFloat: -75, left: self.leftAnchor, lFloat: 75)
//            }
//        }
//    }
//    
//    //    UIViews
//    
//    let buttonStart: UIButton = {
//        let button = UIButton(type: .system)
//        button.setTitle("START", for: .normal)
//        button.setTitleColor(.white, for: .normal)
//        button.titleLabel?.font = UIFont.systemFont(ofSize: 30)
//        button.backgroundColor = UIColor.green
//        return button
//    }()
//}

