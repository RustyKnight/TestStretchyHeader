//
//  ViewController.swift
//  TestStretchyHeader
//
//  Created by Shane Whitehead on 31/3/18.
//  Copyright © 2018 Shane Whitehead. All rights reserved.
//

import UIKit
import GSKStretchyHeaderView

class ViewController: UITableViewController {

	var headerView: GSKStretchyHeaderView?
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
//		if #available(iOS 11, *) {
//			tableView.contentInsetAdjustmentBehavior = .never
//		} else {
//			automaticallyAdjustsScrollViewInsets = false
//		}
//		var contentInsets = tableView.contentInset
//		if navigationController != nil {
//			contentInsets.top = 64
//		}
//		if tabBarController != nil {
//			contentInsets.bottom = 44
//		}
//		tableView.contentInset = contentInsets
		
		guard let header = loadHeader() else {
			return
		}
		tableView.addSubview(header)
		var insets = tableView.scrollIndicatorInsets
		insets.top = header.maximumContentHeight
		tableView.scrollIndicatorInsets = insets
	}
	
	func loadHeader() -> GSKStretchyHeaderView? {
		guard let header = Bundle.main.loadNibNamed("BlurHeader", owner: self, options: nil)?.first as? TestHeaderView else {
			return nil
		}
		headerView = header
		return header
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
	
	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//		performSegue(withIdentifier: "Select", sender: self)
		
		let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)

		for index in 0..<20 {
			alert.addAction(makeAction(title: "\(indexPath.row)-\(index)"))
		}
		alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (action) in
		}))
		present(alert, animated: true, completion: nil)
		
	}
	
	func makeAction(title: String) -> UIAlertAction {
		let action = UIAlertAction(title: title, style: .default) { (action) in
		}
		action.setValue(SKIcons.imageOfMessageBubble, forKey: "image")
		return action
	}


}

