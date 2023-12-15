//
//  MainTabBarController.swift
//  Cinemaify
//
//  Created by Enes Sancar on 15.12.2023.
//

import UIKit

final class MainTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureVC()
    }
    
    private func configureVC() {
        
        UITabBar.appearance().backgroundColor = .clear
        UITabBar.appearance().tintColor = MovieColor.playButonBG
        UITabBar.appearance().unselectedItemTintColor = .systemGray
        
        viewControllers = [
            createNavController(for: HomeVC(), title: "Home", imageName: "house.fill"),
            
            createNavController(for: SearchVC(), title: "Search", imageName: "magnifyingglass"),
            
            createNavController(for: DownloadsVC(), title: "Download", imageName: "arrow.down.to.line") ,
            
            createNavController(for: ProfileVC(), title: "Profile", imageName: "person")
        ]
    }
    
    fileprivate func createNavController(for viewController: UIViewController, title: String, imageName: String) -> UIViewController {
        
        let navController = UINavigationController(rootViewController: viewController)
        navController.navigationBar.prefersLargeTitles = true
        viewController.navigationItem.title = title
        viewController.view.backgroundColor = .systemBackground
        navController.tabBarItem.title = title
        navController.tabBarItem.image = UIImage(systemName: imageName)
        navController.navigationBar.tintColor = .systemRed
        return navController
    }
}
