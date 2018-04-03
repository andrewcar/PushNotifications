//
//  Frames.swift
//  FirebasePushNotifications
//
//  Created by Andrew Carvajal on 4/2/18.
//  Copyright © 2018 HouseCallMD. All rights reserved.
//

import UIKit

struct OnboardingFrames {
    var enableNotificationsButtonHidden: CGRect
    var enableNotificationsButtonShowing: CGRect
}

class Frames: NSObject {
    static let shared = Frames()
    fileprivate override init() {}
    
    var onboardingFrames: OnboardingFrames?
    
    let padding: CGFloat = 15
    
    func populateOnboardingFrames(viewFrame: CGRect) {
        let buttonSize = CGSize(width: viewFrame.width - (padding * 4), height: 60)
        let enableNotificationsButtonHidden = CGRect(x: viewFrame.midX - (buttonSize.width / 2), y: viewFrame.maxY + 100, width: buttonSize.width, height: buttonSize.height)
        let enableNotificationsButtonShowing = CGRect(x: viewFrame.midX - (buttonSize.width / 2), y: viewFrame.midY - (buttonSize.height / 2), width: buttonSize.width, height: buttonSize.height)
        
        onboardingFrames = OnboardingFrames(enableNotificationsButtonHidden: enableNotificationsButtonHidden,
                                            enableNotificationsButtonShowing: enableNotificationsButtonShowing)
    }
}
