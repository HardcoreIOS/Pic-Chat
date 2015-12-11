//
//  LoginSignupViewController.swift
//  Pic Chat
//
//  Created by HardcoreIOS on 12/11/15.
//  Copyright © 2015 HardcoreIOS. All rights reserved.
//

import UIKit
import Parse
import ParseUI

class LoginSignupViewController: PFLogInViewController{
	
	override func viewWillAppear(animated: Bool) {
		super.viewWillAppear(animated)
		self.navigationController?.navigationBarHidden = false

	}
	
	var logoName = "logo"
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		// HIDE IT
		self.navigationController?.navigationBarHidden = true
		
	
		// Show the VC's
		let signUpVC = PFSignUpViewController()
		signUpVC.delegate = self
		
		let loginVC = PFLogInViewController()
		loginVC.delegate = self
		
		self.delegate = self
		self.signUpController = signUpVC
		
		// Configure the lOGO
		logInView?.logo = UIImageView(image: UIImage(named: logoName)!)
		logInView?.logo?.contentMode = .ScaleAspectFit
		
		signUpVC.signUpView?.logo = UIImageView(image: UIImage(named: logoName))
		signUpVC.signUpView?.logo?.contentMode = .ScaleAspectFit
		
	}
	
	func showInbox() {
		self.navigationController?.popToRootViewControllerAnimated(true)
	}
	
}

// 1. Create the PFSignUpViewController Delegate Extension
extension LoginSignupViewController : PFSignUpViewControllerDelegate {
	
	func signUpViewController(signUpController: PFSignUpViewController, didSignUpUser user: PFUser) {
		self.dismissViewControllerAnimated(true, completion: nil)
		showInbox()
	}

}

// 2. Create the LoginViewController Delegate Extension
extension LoginSignupViewController : PFLogInViewControllerDelegate {
	
	func logInViewController(logInController: PFLogInViewController, didLogInUser user: PFUser) {
		showInbox()
	}
	
	func logInViewController(logInController: PFLogInViewController, didFailToLogInWithError error: NSError?) {
		showAlert("Error", message: "Failed to login, please try again", okButton: "OK")
		
		let alertController = UIAlertController(title: "Error", message: "Failed to login, please try again", preferredStyle: .Alert)
		let action = UIAlertAction(title: "OK", style: .Default, handler: nil)
		
		alertController.addAction(action)
		self.presentViewController(alertController, animated: true, completion: nil)
	}
}

// 3. Alert Controller Function which can be re-used!
func showAlert(title: String, message: String, okButton: String) {

	let alertController = UIAlertController(title: title, message: message, preferredStyle: .Alert)
	let action = UIAlertAction(title: okButton, style: .Default, handler: nil)

	alertController.addAction(action)
	
}




