//
//  MainViewController.swift
//  aDreamLeaf
//
//  Created by 엄태양 on 2023/03/27.
//

import UIKit

class MainViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBar.backgroundColor = UIColor(named: "mainColor")
        self.tabBar.tintColor = UIColor(named: "subColor")
        self.setViewControllers([UINavigationController(rootViewController: HomeViewController(viewModel: HomeViewModel())), UINavigationController(rootViewController: SearchViewController(viewModel: SearchViewModel())), UINavigationController(rootViewController: AccountViewController(viewModel: AccountViewModel()))], animated: true)
    }
}
