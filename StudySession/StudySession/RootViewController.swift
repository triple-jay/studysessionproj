//
//  RootViewController.swift
//  StudySession
//
//  Created by Jeremy Jung on 11/16/19.
//  Copyright © 2019 Jeremy Jung. All rights reserved.
//

import UIKit

class RootViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let viewController = ViewController()
        
        
        viewController.tabBarItem = UITabBarItem(title: "Study Sessions", image: UIImage(named: "bookmark"), selectedImage: UIImage(named: "bookmark"))
        
        let inputViewController = InputViewController()
        
        inputViewController.tabBarItem = UITabBarItem(title: "New Session", image: UIImage(named: "plus-sign"), selectedImage: UIImage(named: "plus-sign"))
        
        let mySessionViewController = MySessionViewController()
        
        mySessionViewController.tabBarItem = UITabBarItem(title: "My Sessions", image: UIImage(named: "star"), selectedImage: UIImage(named: "star"))
        
        let viewControllerList = [viewController, mySessionViewController, inputViewController]
        
        viewControllers = viewControllerList
        viewControllers = viewControllerList.map {
            UINavigationController(rootViewController: $0)
//           add my study session tab (bookmark)
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
