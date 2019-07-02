//
//  QuestionView.swift
//  iosQuiz
//
//  Created by Marko Barisic on 28/06/2019.
//  Copyright © 2019 Marko Barisic. All rights reserved.
//

import UIKit

class QuestionView: UIView {
    
    var questionTextLabel: UILabel?
    var answerButtons: [UIButton] = []
    weak var delegate: QuestionViewDelegate? = nil
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        questionTextLabel = UILabel()
        if let questionTextLabel = questionTextLabel {
            
            addSubview(questionTextLabel)
            questionTextLabel.translatesAutoresizingMaskIntoConstraints = false
            questionTextLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8).isActive = true
            questionTextLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8).isActive = true
            questionTextLabel.textAlignment = NSTextAlignment.center
            questionTextLabel.numberOfLines = 0
            let font = questionTextLabel.font.withSize(18.0)
            questionTextLabel.font = font
            
            let btn0 = createButton(tag: 0)
            addSubview(btn0)
            answerButtons.append(btn0)
            btn0.translatesAutoresizingMaskIntoConstraints = false
            btn0.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 24).isActive = true
            btn0.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -24).isActive = true
            btn0.topAnchor.constraint(equalTo: questionTextLabel.bottomAnchor, constant: 16).isActive = true
            btn0.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
            btn0.heightAnchor.constraint(lessThanOrEqualToConstant: 50).isActive = true
            
            let btn1 = createButton(tag: 1)
            addSubview(btn1)
            answerButtons.append(btn1)
            btn1.translatesAutoresizingMaskIntoConstraints = false
            btn1.topAnchor.constraint(equalTo: btn0.bottomAnchor, constant: 24).isActive = true
            btn1.widthAnchor.constraint(equalTo: btn0.widthAnchor).isActive = true
            btn1.heightAnchor.constraint(equalTo: btn0.heightAnchor).isActive = true
            btn1.centerXAnchor.constraint(equalTo: btn0.centerXAnchor).isActive = true
            btn1.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
            
            
            let btn2 = createButton(tag: 2)
            addSubview(btn2)
            answerButtons.append(btn2)
            btn2.translatesAutoresizingMaskIntoConstraints = false
            btn2.topAnchor.constraint(equalTo: btn1.bottomAnchor, constant: 24).isActive = true
            btn2.widthAnchor.constraint(equalTo: btn0.widthAnchor).isActive = true
            btn2.heightAnchor.constraint(equalTo: btn0.heightAnchor).isActive = true
            btn2.centerXAnchor.constraint(equalTo: btn0.centerXAnchor).isActive = true
            
            let btn3 = createButton(tag: 3)
            addSubview(btn3)
            answerButtons.append(btn3)
            btn3.translatesAutoresizingMaskIntoConstraints = false
            btn3.topAnchor.constraint(equalTo: btn2.bottomAnchor, constant: 24).isActive = true
            btn3.widthAnchor.constraint(equalTo: btn0.widthAnchor).isActive = true
            btn3.heightAnchor.constraint(equalTo: btn0.heightAnchor).isActive = true
            btn3.centerXAnchor.constraint(equalTo: btn0.centerXAnchor).isActive = true
            
            
        }
    }
    
    func populate(with question: QuestionViewModel) {
        questionTextLabel?.text = question.questionText
        answerButtons[0].setTitle(question.answers[0], for: .normal)
        answerButtons[1].setTitle(question.answers[1], for: .normal)
        answerButtons[2].setTitle(question.answers[2], for: .normal)
        answerButtons[3].setTitle(question.answers[3], for: .normal)
    }
    
    
    func setButtonBackgroundColor(at index: Int, color: UIColor) {
        answerButtons[index].backgroundColor = color
    }
    
    
    @objc private func answerTapped(sender: UIButton) {
        delegate?.answerTapped(tag: sender.tag)
    }
    
    private func createButton(tag: Int) -> UIButton {
        let answerButton = UIButton()
        answerButton.backgroundColor = UIColor(red: 0.0, green: 0.6, blue: 0.8, alpha: 1.0)
        answerButton.setTitleColor(UIColor.white, for: .normal)
        answerButton.tag = tag
        answerButton.addTarget(self, action: #selector(answerTapped), for: .touchUpInside)
        return answerButton
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


protocol QuestionViewDelegate: class {
    func answerTapped(tag: Int)
}
