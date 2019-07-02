////
////  MainView.swift
////  iosQuiz
////
////  Created by Marko Barisic on 10/04/2019.
////  Copyright © 2019 Marko Barisic. All rights reserved.
////
//
//import UIKit
//
//
//
//class QuizMainView: UIView{
//    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        setupMainView()
//    }
//    
////    weak var delegate
//    
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//    private func setupMainView(){
//        setupViews()
//        setupConstraints()
//    }
//    
//    func setupViews(){
//        self.addSubview(mainView)
//        self.addSubview(buttonDohvati)
//        self.addSubview(buttonFunFact)
//        self.addSubview(labelFunFact)
////        self.addSubview(buttonStack)
////        buttonStack.addArrangedSubview(buttonDohvati)
////        buttonStack.addArrangedSubview(buttonFunFact)
////        buttonStack.addArrangedSubview(labelFunFact)
//    }
//    
//    func setupConstraints(){
//        
//        mainView.fitToEdges(toView: self)
//
//        buttonDohvati.constraint(bottom: self.safeAreaLayoutGuide.topAnchor, bFloat: 60, top: self.safeAreaLayoutGuide.topAnchor, tFloat: 10, right: self.rightAnchor, rFloat: -10, left: self.leftAnchor, lFloat: 10)
//        
//        buttonFunFact.constraint(bottom: buttonDohvati.bottomAnchor, bFloat: 50, top: buttonDohvati.bottomAnchor, tFloat: 5, right: self.rightAnchor, rFloat: -10, left: self.leftAnchor, lFloat: 10)
//        
//        labelFunFact.constraint(bottom: buttonFunFact.bottomAnchor, bFloat: 80, top: buttonFunFact.bottomAnchor, tFloat: 5, right: self.rightAnchor, rFloat: -10, left: self.leftAnchor, lFloat: 10)
//        
////        buttonStack.constraint(bottom: self.safeAreaLayoutGuide.topAnchor , bFloat: 160
////            , top: self.safeAreaLayoutGuide.topAnchor, tFloat: 10
////            , right: self.rightAnchor, rFloat: -10
////            , left: self.leftAnchor, lFloat: 10)
//    }
//    
//    
//    func nba(times: Int){
//        labelFunFact.text = "The word NBA is mentioned \(times) times!"
//        self.labelFunFact.isHidden = false
//    }
//    
//    //    add views
//    
//    func addCustomView(customView: UIView){
//        switch self.subviews.last {
//        case is CategoryView, is QuestionView, is LevelView, is QuizView:
//            self.subviews.last?.removeFromSuperview()
//        default: break
//        }
//        self.addSubview(customView)
//        customView.constraint(bottom: nil, bFloat: 0, top: labelFunFact.bottomAnchor, tFloat: 0, right: self.rightAnchor, rFloat: -5, left: self.leftAnchor, lFloat: 5)
//    }
//    
//    func dohvacamKvizove(){
//        labelFunFact.text = "Dohvaćam kvizove..."
//        labelFunFact.isHidden = false
//    }
//    
//    //    UIViews
//    
//    let mainView: UIView = {
//        let view = UIView(frame: .zero)
//        view.backgroundColor = UIColor.red.withAlphaComponent(0.6)
//        return view
//    }()
//    let labelFunFact: UILabel = {
//        let label = UILabel(frame: .zero)
//        label.text = ""
//        label.isHidden = true
//        label.font = UIFont.systemFont(ofSize: 30)
//        label.textColor = UIColor.black
//        label.numberOfLines = 0
//        label.backgroundColor = UIColor.clear
//        label.textAlignment = NSTextAlignment.center
//        return label
//    }()
//    
//    let buttonStack: UIStackView = {
//        let stackView = UIStackView(frame: .zero)
//        stackView.axis = .vertical
//        stackView.distribution = .equalSpacing
//        stackView.spacing = 5
//        return stackView
//    }()
//    
//    let buttonDohvati: UIButton = {
//        let button = UIButton(type: .system)
//        button.setTitle("Dohvati", for: .normal)
//        button.titleLabel?.font = UIFont.systemFont(ofSize: 40)
//        button.setTitleColor(.white, for: .normal)
//        button.backgroundColor = UIColor.yellow.withAlphaComponent(0.5)
//        return button
//    }()
//    
//    let buttonFunFact: UIButton = {
//        let button = UIButton(type: .system)
//        button.setTitle("Fun fact", for: .normal)
//        button.titleLabel?.font = UIFont.systemFont(ofSize: 30)
//        button.setTitleColor(.white, for: .normal)
//        button.backgroundColor = UIColor.blue.withAlphaComponent(0.5)
//        return button
//    }()
//}

