//
//  SelectTableViewController.swift
//  TestStretchyHeader
//
//  Created by Shane Whitehead on 1/4/18.
//  Copyright © 2018 Shane Whitehead. All rights reserved.
//

import UIKit

class SelectTableViewController: UITableViewController {
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		tableView.layer.borderWidth = 1
		tableView.layer.borderColor = UIColor.groupTableViewBackground.cgColor
		tableView.layer.cornerRadius = 20
	}
	
	override func numberOfSections(in tableView: UITableView) -> Int {
		return 1
	}
	
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 100
	}
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
		cell?.textLabel?.text = "Row \(indexPath.row)"
		return cell!
	}

}
