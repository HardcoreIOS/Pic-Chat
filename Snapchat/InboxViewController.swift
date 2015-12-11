//
//  InboxViewController.swift
//  Pic Chat	
//
//  Created by HardcoreIOS on 12/11/15.
//  Copyright © 2015 HardcoreIOS. All rights reserved.
//

import UIKit
import Parse
import ParseUI

class InboxViewController: UITableViewController {
	
	struct Storyboard {
		static let showLoginSegue = "Show Log In"
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()

		if PFUser.currentUser() == nil {
			self.performSegueWithIdentifier(Storyboard.showLoginSegue, sender: nil)
		}
	
	}

	@IBAction func logoutDidTap(sender: AnyObject) {
		PFUser.logOut()
		self.performSegueWithIdentifier(Storyboard.showLoginSegue, sender: nil)
	}

	override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
		
		if segue.identifier == Storyboard.showLoginSegue {
			
			let loginSignUpVC = segue.destinationViewController as! LoginSignupViewController
			loginSignUpVC.hidesBottomBarWhenPushed = true
			loginSignUpVC.navigationItem.hidesBackButton = true
		}
	}

}









