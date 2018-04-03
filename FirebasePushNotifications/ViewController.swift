//
//  ViewController.swift
//  FirebasePushNotifications
//
//  Created by Andrew Carvajal on 4/2/18.
//  Copyright © 2018 HouseCallMD. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var enableNotificationsButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        view.backgroundColor = UIColor(red: 116/255, green: 185/255, blue: 255/255, alpha: 1)
        
        Frames.shared.populateOnboardingFrames(viewFrame: view.frame)
        
        configureEnableNotificationsButton()
        showEnableNotificationsButton()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    func showEnableNotificationsButton() {
        UIView.animate(withDuration: 0.8, delay: 2, usingSpringWithDamping: 0.6, initialSpringVelocity: 1.5, options: .curveEaseOut, animations: {
            
            self.enableNotificationsButton.frame = (Frames.shared.onboardingFrames?.enableNotificationsButtonShowing)!
        }) { (finished) in
        }
    }
    
    func configureEnableNotificationsButton() {
        enableNotificationsButton = UIButton(frame: (Frames.shared.onboardingFrames?.enableNotificationsButtonHidden)!)
        enableNotificationsButton.setTitle("Enable notifications", for: .normal)
        enableNotificationsButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 23)
        enableNotificationsButton.titleLabel?.textAlignment = .center
        enableNotificationsButton.backgroundColor = UIColor(red: 255/255, green: 107/255, blue: 129/255, alpha: 1)
        enableNotificationsButton.addTarget(self, action: #selector(enableNotificationsButtonTapped), for: .touchUpInside)
        enableNotificationsButton.layer.cornerRadius = 15
        enableNotificationsButton.layer.masksToBounds = true
        view.addSubview(enableNotificationsButton)
    }
    
    @objc func enableNotificationsButtonTapped(sender: UIButton) {
        
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "EnableNotificationsButtonTapped"), object: nil)
        
        UIView.animate(withDuration: 8, animations: {
            self.enableNotificationsButton.backgroundColor = UIColor(red: 214/255, green: 48/255, blue: 49/255, alpha: 1)
        }) { (finished) in
            self.enableNotificationsButton.setTitle("Good", for: .normal)
            UIView.animate(withDuration: 0, delay: 3, usingSpringWithDamping: 1.5, initialSpringVelocity: 1.5, options: .curveEaseOut, animations: {
                
                self.enableNotificationsButton.setTitle("You can close the app now", for: .normal)
            }, completion: { (finished) in
            })
        }
    }
}

