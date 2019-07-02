//
//  TabBarViewController.swift
//  iosQuiz
//
//  Created by Marko Barisic on 27/06/2019.
//  Copyright © 2019 Marko Barisic. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBar.barTintColor = UIColor.gray
        tabBar.isTranslucent = false
        tabBar.tintColor = UIColor.orange
        tabBar.unselectedItemTintColor = .white
        
//        quizList
        let quizListViewModel = QuizListViewModel()
        let quizListVC = QuizListViewController(viewModel: quizListViewModel)
        let quizListNavigationController = UINavigationController(rootViewController: quizListVC)
        
        quizListNavigationController.navigationBar.tintColor = UIColor.white
        quizListNavigationController.navigationBar.barTintColor = UIColor.orange
        let textAttributes = [NSAttributedStringKey.foregroundColor:UIColor.white]
        quizListNavigationController.navigationBar.titleTextAttributes = textAttributes
        
        let quizListTabBarItem = UITabBarItem(title: "Quiz List", image: UIImage(named: "list2"), tag: 0)
        quizListNavigationController.tabBarItem = quizListTabBarItem
        
//        quizSearch
        let quizSerachViewModel = QuizListViewModel()
        let quizSerachVC = QuizSearchViewController(viewModel: quizSerachViewModel)
        
        let quizSearchNavigationController = UINavigationController(rootViewController: quizSerachVC)
        quizSearchNavigationController.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 1)
        
        quizSearchNavigationController.navigationBar.tintColor = UIColor.white
        quizSearchNavigationController.navigationBar.barTintColor = UIColor(red: 0.2, green: 0.2, blue: 1.0, alpha: 1.0)
        quizSearchNavigationController.navigationBar.titleTextAttributes = textAttributes
        
//        userSettings
        let settingsVC = SettingsViewController()
        let settingsTabBarItem = UITabBarItem(title: "Settings", image: UIImage(named: "user2"), tag: 2)
        settingsVC.tabBarItem = settingsTabBarItem
        
        viewControllers = [quizListNavigationController, quizSearchNavigationController, settingsVC]
        
        selectedIndex = 0
    }
}
