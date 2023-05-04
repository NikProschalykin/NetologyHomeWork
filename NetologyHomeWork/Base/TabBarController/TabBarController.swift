//
//  TabBarController.swift
//  NetologyHomeWork
//
//  Created by Николай Прощалыкин on 07.04.2023.
//

import UIKit

class TabBarController: UITabBarController {

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        UITabBar.appearance().backgroundColor = .white
        
        let feedViewController = createFeedViewController()
        let logInViewController = createProfileViewController()
        setViewControllers([feedViewController, logInViewController], animated: false)
    }
    
    
    private func createFeedViewController() -> UINavigationController {
        let feedViewController = FeedViewController()
        feedViewController.title = "Feed"
        feedViewController.tabBarItem = UITabBarItem(title: "Feed", image: UIImage(systemName: "doc.richtext"), tag: 0)
        return NavBarController(rootViewController: feedViewController)
    }
    
    private func createProfileViewController() -> UINavigationController {
        let logInViewController = LogInViewController()

        logInViewController.title = "Log in"
        logInViewController.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(systemName: "person.circle"), tag: 1)

        return NavBarController(rootViewController: logInViewController)
    }
}

