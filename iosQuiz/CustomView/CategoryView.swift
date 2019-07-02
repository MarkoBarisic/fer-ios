////
////  CategoryView.swift
////  iosQuiz
////
////  Created by Marko Barisic on 11/04/2019.
////  Copyright © 2019 Marko Barisic. All rights reserved.
////
//
//import UIKit
//
//class CategoryView: UIView {
//    
//    private var categories: [Quiz] = []
//    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//    }
//    
//    convenience init(frame: CGRect, catList: [Quiz]){
//        self.init(frame: frame)
//        self.categories = catList
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
//        self.addSubview(labelCategory)
//        setupConstraints()
//        var categoryList: [String] = []
//        var offset: CGFloat = 0
//        for category in categories{
//            if categoryList.contains(category.category) == false{
//                categoryList.append(category.category)
//                let buttonCategory: UIButton = {
//                    let button = UIButton(type: .system)
//                    button.setTitle("\(category.category)", for: .normal)
//                    button.setTitleColor(.white, for: .normal)
//                    button.titleLabel?.font = UIFont.systemFont(ofSize: 30)
////                    button.addTarget(self, action: #selector(CategoryView.test(sender:)), for: UIControlEvents.allEvents)
//                    button.backgroundColor = category.color
//                    return button
//                }()
//                self.addSubview(buttonCategory)
//                
//                buttonCategory.constraint(bottom: labelCategory.bottomAnchor, bFloat: 50+offset, top: labelCategory.bottomAnchor, tFloat: 5+offset, right: self.rightAnchor, rFloat: 0, left: self.leftAnchor, lFloat: 0)
//                
//                offset += 50
//            }
//        }
//    }
//    
//    @objc func  test(sender: UIButton){
//        
//    }
//    
//    func setupConstraints(){
//        labelCategory.constraint(bottom: self.topAnchor, bFloat: 55, top: self.topAnchor, tFloat: 0, right: self.rightAnchor, rFloat: 0, left: self.leftAnchor, lFloat: 0)
//    }
//    
//    
////    UIViews
//    
//
//    let labelCategory: UILabel = {
//        let label = UILabel(frame: .zero)
//        label.text = "Pick a category"
//        label.font = UIFont.systemFont(ofSize: 50)
//        label.textColor = UIColor.white
//        label.numberOfLines = 0
//        label.backgroundColor = UIColor.clear
//        label.textAlignment = .center
//        label.adjustsFontSizeToFitWidth = true
//        return label
//    }()
//
//}

