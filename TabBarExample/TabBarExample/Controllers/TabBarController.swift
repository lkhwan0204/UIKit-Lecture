//
//  TabBarController.swift
//  TabBarExample
//
//  Created by kyuhyeon Lee on 3/5/25.
//


import UIKit

class TabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()

        let homeVC = HomeViewController()
        let settingsVC = SettingsViewController()
        let profileVC = ProfileViewController()

        homeVC.tabBarItem = 
	        UITabBarItem(tabBarSystemItem: .favorites, tag: 0)
        settingsVC.tabBarItem = 
	        UITabBarItem(tabBarSystemItem: .more, tag: 1)
        profileVC.tabBarItem = 
	        UITabBarItem(tabBarSystemItem: .contacts, tag: 2)

        self.viewControllers = [homeVC, settingsVC, profileVC]
    }
}