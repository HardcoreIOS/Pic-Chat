//
//  EditFriendsTableViewController.swift
//  Pic Chat
//
//  Created by HarcoreIOS on 12/11/15.
//  Copyright © 2015 HarcoreIOS. All rights reserved.
//

import UIKit
import Parse

class EditFriendsTableViewController: UITableViewController {
	
	var friends = [PFUser]()
	private var users = [PFUser]()
	private var currentUser = PFUser.currentUser()!
	
	struct StoryBoard {
		static let CellIdentifier = "Friend Cell"
	}
	
    // MARK: - ViewController Lifecycle
	
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Edit Friends"
		
		// Call the function
		fetchUsers()
	}
	
	
	private func fetchUsers() {
		
		let userQuery = PFUser.query()
		userQuery?.orderByAscending("username")
		
		userQuery?.findObjectsInBackgroundWithBlock({ (users, error) -> Void in
			
			//  1. Check if the error is nil or not
			if error == nil {
				// Do something
				self.users = users as! [PFUser]
				self.tableView.reloadData()
			} else {
				// Show the error with an alert
				let alertController = UIAlertController(title: "Error", message: error.debugDescription, preferredStyle: .Alert)
				alertController.addAction(UIAlertAction(title: "Ok!", style: .Default, handler: nil))
				self.presentViewController(alertController, animated: true, completion: nil)
			}
			
		})// End of findObjectsInBackgroundWithBlock({})
	
		// MARK: - UITableViewDataSource
		func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
			// #warning Incomplete implementation, return the number of rows
			return self.users.count
		}
		
		// Cell for row isn't working!
		func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
			return UITableViewCell()
		}
		
		
		
	}// End of fetchUsers() function


}



