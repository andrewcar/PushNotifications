//
//  AppDelegate.swift
//  FirebasePushNotifications
//
//  Created by Andrew Carvajal on 4/2/18.
//  Copyright © 2018 HouseCallMD. All rights reserved.
//

import UIKit
import Firebase
import UserNotifications

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        FirebaseApp.configure()
        
        NotificationCenter.default.addObserver(self, selector: #selector(enableNotificationsButtonTapped), name: NSNotification.Name(rawValue: "EnableNotificationsButtonTapped"), object: nil)
                
        
        return true
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
        
        Messaging.messaging().shouldEstablishDirectChannel = false
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
        
        firebaseHandler()
    }
    
    @objc func refreshToken(notification: Notification) {
        let refreshToken = InstanceID.instanceID().token()!
        print("*** \(refreshToken) ***")
        firebaseHandler()
    }

    func firebaseHandler() {
        Messaging.messaging().shouldEstablishDirectChannel = true
    }
    
    @objc func enableNotificationsButtonTapped() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { (success, error) in
            
            if error == nil {
                print("Successful authorization")
            } else {
                print(error?.localizedDescription as Any)
            }
            
            DispatchQueue.main.async {
                UIApplication.shared.registerForRemoteNotifications()
            }
            
            NotificationCenter.default.addObserver(self, selector: #selector(self.refreshToken(notification:)), name: NSNotification.Name.InstanceIDTokenRefresh, object: nil)
        }
    }
}

