//
//  AppDelegate.swift
//  StudySession
//
//  Created by Jeremy Jung on 11/14/19.
//  Copyright © 2019 Jeremy Jung. All rights reserved.
//

import UIKit
import GoogleSignIn

let userDefaults = UserDefaults.standard

let encoder = JSONEncoder()
let decoder = JSONDecoder()

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, GIDSignInDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        // Initialize Sing-In
        GIDSignIn.sharedInstance().clientID = "1038521907855-vbcutei2dp23e0ruembqn3tbno6t0bj7.apps.googleusercontent.com"
        GIDSignIn.sharedInstance().delegate = self
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = UIStoryboard(name: "LaunchScreen", bundle: nil).instantiateInitialViewController() ?? UIViewController()
        window?.makeKeyAndVisible()
        
        // Override point for customization after application launch.
        if (GIDSignIn.sharedInstance()?.currentUser != nil) {
            
        } else {
            window?.rootViewController = SignInViewController()
        }

        return true
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        return GIDSignIn.sharedInstance().handle(url)
    }
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if let error = error {
           if (error as NSError).code == GIDSignInErrorCode.hasNoAuthInKeychain.rawValue {
            print("The user has not signed in before or they have since signed out.")
           } else {
             print("\(error.localizedDescription)")
           }
           return
         }
        window?.rootViewController = UINavigationController(rootViewController: RootViewController())
         // Perform any operations on signed in user here.
         let userId = user.userID                  // For client-side use only!
         let idToken = user.authentication.idToken // Safe to send to the server
         let fullName = user.profile.name
         let givenName = user.profile.givenName
         let familyName = user.profile.familyName
         let email = user.profile.email
        
    }
    
    func sign(_ signIn: GIDSignIn!, didDisconnectWith user: GIDGoogleUser!, withError error: Error!) {
        let screen=UIWindow(frame: UIScreen.main.bounds)
        screen.rootViewController = SignInViewController()
        screen.makeKeyAndVisible()
    }
    
  
}

