//
//  SelectViewController.swift
//  TestStretchyHeader
//
//  Created by Shane Whitehead on 1/4/18.
//  Copyright © 2018 Shane Whitehead. All rights reserved.
//

import UIKit

class SelectViewController: UIViewController {
	
	@IBOutlet weak var selectionView: UIView!
	@IBOutlet weak var bottomConstraint: NSLayoutConstraint!
	
	@IBOutlet weak var visualEffectView: UIVisualEffectView!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		visualEffectView.effect = nil
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		bottomConstraint.constant = -(16 + selectionView.frame.size.height)
	}
	
	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)
		bottomConstraint.constant = 16
		UIView.animate(withDuration: 1.0) {
			self.visualEffectView.effect = UIBlurEffect(style: .light)
			self.view.layoutIfNeeded()
		}
	}
	
	override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
//		navigationController?.popViewController(animated: true)
		print("Dismiss")
		bottomConstraint.constant = -(16 + selectionView.frame.size.height)
		UIView.animate(withDuration: 1.0, animations: {
			self.visualEffectView.effect = nil
			self.view.layoutIfNeeded()
		}) { (completed) in
			self.dismiss(animated: false) {
			}
		}
	}
	
}
