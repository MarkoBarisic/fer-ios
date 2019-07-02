//
//  QuizTableFooterView.swift
//  iosQuiz
//
//  Created by Marko Barisic on 28/06/2019.
//  Copyright © 2019 Marko Barisic. All rights reserved.
//

import UIKit

protocol QuizTableFooterViewDelegate: class {
    func logoutBtnTapped()
}

class QuizTableFooterView: UIView {
    var logoutButton: UIButton!
    weak var delegate: QuizTableFooterViewDelegate?
    
    @objc func logoutBtnTapped() {
        delegate?.logoutBtnTapped()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = UIColor.green
        
        logoutButton = UIButton()
        addSubview(logoutButton)
        
        logoutButton.translatesAutoresizingMaskIntoConstraints = false
        logoutButton.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        logoutButton.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        logoutButton.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        logoutButton.heightAnchor.constraint(equalTo: self.heightAnchor).isActive = true
        logoutButton.setTitleColor(UIColor.white, for: .normal)
        
        logoutButton.setTitle("Logout", for: .normal)
        logoutButton.addTarget(self, action: #selector(QuizTableFooterView.logoutBtnTapped), for: .touchUpInside)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
