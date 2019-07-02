//
//  LoginInScreenViewController.swift
//  iosQuiz
//
//  Created by Marko Barisic on 19/06/2019.
//  Copyright © 2019 Marko Barisic. All rights reserved.
//

import UIKit

class LoginInScreenViewController: UIViewController {

    let loginService = LoginService()
    
    @IBOutlet weak var loginButton: UIButton!
    
    @IBOutlet weak var usernameTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var logoImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        prepareForAnimating()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        animateEverythingIn()
    }
    
    private func prepareForAnimating() {
        logoImageView.transform = CGAffineTransform(scaleX: 0, y: 0)
        logoImageView.alpha = 0.0
        
        usernameTextField.transform = CGAffineTransform(translationX: -view.bounds.width, y: 0)
        usernameTextField.alpha = 0.0
        
        passwordTextField.transform = CGAffineTransform(translationX: -view.bounds.width, y: 0)
        passwordTextField.alpha = 0.0
        
        loginButton.transform = CGAffineTransform(translationX: -view.bounds.width, y: 0)
        loginButton.alpha = 0.0
    }
    
    private func animateEverythingIn() {
        UIView.animate(withDuration: 2.0, delay: 0, options: .curveEaseOut, animations: {
            self.logoImageView.transform = CGAffineTransform.identity
            self.logoImageView.alpha = 1.0
        })
        
        UIView.animate(withDuration: 1.0, delay: 0, options: .curveEaseOut, animations: {
            self.usernameTextField.transform = CGAffineTransform.identity
            self.usernameTextField.alpha = 1.0
        })
        
        UIView.animate(withDuration: 1.0, delay: 0.5, options: .curveEaseOut, animations: {
            self.passwordTextField.transform = CGAffineTransform.identity
            self.passwordTextField.alpha = 1.0
        })
        
        UIView.animate(withDuration: 1.0, delay: 1.0, options: .curveEaseOut, animations: {
            self.loginButton.transform = CGAffineTransform.identity
            self.loginButton.alpha = 1.0
        })
        
    }
    
    
    private func animateEverythingOut(completion: @escaping (Bool) -> Void) {
        UIView.animate(withDuration: 1.5, delay:0.0 , animations: {
            self.logoImageView.transform = CGAffineTransform(translationX: 0, y: -self.view.bounds.height)
            self.logoImageView.alpha = 0.0
        })
        
        UIView.animate(withDuration: 1.5, delay: 0.2, animations: {
            self.usernameTextField.transform = CGAffineTransform(translationX: 0, y: -self.view.bounds.height)
            self.usernameTextField.alpha = 0.0
        })
        
        UIView.animate(withDuration: 1.5, delay: 0.4, animations: {
            self.passwordTextField.transform = CGAffineTransform(translationX: 0, y: -self.view.bounds.height)
            self.passwordTextField.alpha = 0.0
        })
        
        UIView.animate(withDuration: 1.5, delay: 0.6, animations: {
            self.loginButton.transform = CGAffineTransform(translationX: 0, y: -self.view.bounds.height)
            self.loginButton.alpha = 0.0
        }, completion: completion)
    }
    
    @IBAction func loginButtonTapped(_ sender: UIButton) {
//        print("button pressed")
//        print(UserDefaults.standard.data(forKey: "token"))
        guard let username = usernameTextField.text, let password = passwordTextField.text else {
            DispatchQueue.main.sync {
                self.showAlert()
            }
            return
        }
        let urlString = "https://iosquiz.herokuapp.com/api/session"
        loginService.login(urlString: urlString, username: username, password: password)
        {(arguments) in
            guard let (token, Id) = arguments
                else{
//                    print("greška")
                    DispatchQueue.main.sync {
                        self.showAlert()
                    }
                    return
            }
//            print(username)
            UserDefaults.standard.set(token, forKey: "token")
            UserDefaults.standard.set(Id, forKey: "Id")
            UserDefaults.standard.set(username, forKey: "username")
            UserDefaults.standard.set(password, forKey: "password")
            
            DispatchQueue.main.async {
                self.animateEverythingOut { _ in
                    let appDelegate = UIApplication.shared.delegate as! AppDelegate
                    appDelegate.window!.rootViewController = TabBarViewController()
                }
            }
        }
    }
    
    private func showAlert() {
        let alertController = UIAlertController(title: "Login", message: "Wrong username or password!", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Cancel", style: .default))
        self.present(alertController, animated: true, completion: nil)
    }

}
