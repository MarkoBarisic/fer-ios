//
//  UIView extensions.swift
//  iosQuiz
//
//  Created by Marko Barisic on 10/04/2019.
//  Copyright © 2019 Marko Barisic. All rights reserved.
//

import UIKit

extension UIView{
    func constraint(bottom: NSLayoutAnchor<NSLayoutYAxisAnchor>?, bFloat: CGFloat?
        , top: NSLayoutAnchor<NSLayoutYAxisAnchor>?, tFloat: CGFloat?
        , right: NSLayoutAnchor<NSLayoutXAxisAnchor>?, rFloat: CGFloat?
        , left:NSLayoutAnchor<NSLayoutXAxisAnchor>?, lFloat: CGFloat?){
        
        self.translatesAutoresizingMaskIntoConstraints = false
        
        if let bAnchor = bottom{
            self.bottomAnchor.constraint(equalTo: bAnchor, constant: bFloat!).isActive = true
        }
        if let tAnchor = top{
            self.topAnchor.constraint(equalTo: tAnchor, constant: tFloat!).isActive = true
        }
        if let rAnchor = right{
            self.rightAnchor.constraint(equalTo: rAnchor, constant: rFloat!).isActive = true
        }
        if let lAnchor = left{
            self.leftAnchor.constraint(equalTo: lAnchor, constant: lFloat!).isActive = true
        }
    }
    
    func constraint(bottom: NSLayoutAnchor<NSLayoutYAxisAnchor>?, bFloat: CGFloat?
        , top: NSLayoutAnchor<NSLayoutYAxisAnchor>?, tFloat: CGFloat?
        , leading: NSLayoutAnchor<NSLayoutXAxisAnchor>?, lFloat: CGFloat?
        , trailing:NSLayoutAnchor<NSLayoutXAxisAnchor>?, trFloat: CGFloat?){
        
        self.translatesAutoresizingMaskIntoConstraints = false
        
        if let bAnchor = bottom{
            self.bottomAnchor.constraint(equalTo: bAnchor, constant: bFloat!).isActive = true
        }
        if let tAnchor = top{
            self.topAnchor.constraint(equalTo: tAnchor, constant: tFloat!).isActive = true
        }
        if let trAnchor = trailing{
            self.rightAnchor.constraint(equalTo: trAnchor, constant: trFloat!).isActive = true
        }
        if let lAnchor = leading{
            self.leftAnchor.constraint(equalTo: lAnchor, constant: lFloat!).isActive = true
        }
    }
    
    func fitToSafeEdges(toView view: UIView){
        self.translatesAutoresizingMaskIntoConstraints = false
        
        self.constraint(bottom: view.safeAreaLayoutGuide.bottomAnchor, bFloat: 0
            , top: view.safeAreaLayoutGuide.topAnchor, tFloat: 0
            , right: view.safeAreaLayoutGuide.rightAnchor, rFloat: 0
            , left: view.safeAreaLayoutGuide.leftAnchor, lFloat: 0)
    }
    
    func fitToEdges(toView view: UIView){
        self.translatesAutoresizingMaskIntoConstraints = false
        
        self.constraint(bottom: view.bottomAnchor, bFloat: 0
            , top: view.topAnchor, tFloat: 0
            , right: view.rightAnchor, rFloat: 0
            , left: view.leftAnchor, lFloat: 0)
    }
    
}
