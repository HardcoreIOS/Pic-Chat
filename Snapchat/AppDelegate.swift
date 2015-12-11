//
//  AppDelegate.swift
//  Pic Chat
//
//  Created by HardcoreIOS on 12/11/15.
//  Copyright © 2015 HardcoreIOS All rights reserved.
//

import UIKit
import Parse
import Bolts
import ParseUI

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
		
		Parse.enableLocalDatastore()
		
		// Initialize Parse.
		Parse.setApplicationId("O7AxuzmmQUJFjv6DKlrOkG55ep9AMEMlVKKdS6xL",
			clientKey: "828RNeLcAsDZHdFS7sGxdvasC7PPLSUCf7r1YMxD")
		
		customizeAppearance()

		
        return true
    }
    
    func customizeAppearance() {
        let tintColor = UIColor(red: 255/255, green: 45/255, blue: 85/255, alpha: 1)
        window!.tintColor = tintColor
    }


}













