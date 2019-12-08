//
//  SignInViewController.swift
//  StudySession
//
//  Created by Christy Song on 12/8/19.
//  Copyright © 2019 Christy Song. All rights reserved.
//

import UIKit
import GoogleSignIn

class SignInViewController: UIViewController {
    
    var signInButton: GIDSignInButton!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        title = "Sign In"
        view.backgroundColor = .white
        
        signInButton=GIDSignInButton()
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        signInButton.largeContentTitle = "Google Sign-In"
        signInButton.backgroundColor = .lightGray
        view.addSubview(signInButton)
        
        GIDSignIn.sharedInstance()?.presentingViewController = self
        GIDSignIn.sharedInstance()?.restorePreviousSignIn()
        
        setupConstraints()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = true
        self.navigationController?.navigationBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.tabBarController?.tabBar.isHidden = false
        self.navigationController?.navigationBar.isHidden = false
    }
    
    func setupConstraints(){
        NSLayoutConstraint.activate([
            signInButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            signInButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            signInButton.widthAnchor.constraint(equalToConstant: 80),
            signInButton.heightAnchor.constraint(equalToConstant: 60)
        ])
        
    }
}
