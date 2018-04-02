//
//  TestHeaderView.swift
//  TestStretchyHeader
//
//  Created by Shane Whitehead on 31/3/18.
//  Copyright © 2018 Shane Whitehead. All rights reserved.
//

import UIKit
import GSKStretchyHeaderView

class TestHeaderView: GSKStretchyHeaderView {

	@IBOutlet weak var imageSizeConstraint: NSLayoutConstraint!
	@IBOutlet weak var textLabel: UILabel!
	
	let imageSizeRange = 50...100
	let fontSizeRange = 17...24
	
	@IBOutlet weak var blurEffect: UIVisualEffectView!
	
	override func awakeFromNib() {
		super.awakeFromNib()
		
		expansionMode = .topOnly
		
		minimumContentHeight = 180
		maximumContentHeight = 250
		
		contentShrinks = true
		contentExpands = true
		
		contentAnchor = .bottom
	}
	
	override func didChangeStretchFactor(_ stretchFactor: CGFloat) {
		print("Factor \(stretchFactor)")
		
		let actualImageSize = (CGFloat(imageSizeRange.count) * stretchFactor) + CGFloat(imageSizeRange.lowerBound)
		var actualFontSize = (CGFloat(fontSizeRange.count) * stretchFactor) + CGFloat(fontSizeRange.lowerBound)
		actualFontSize = max(CGFloat(fontSizeRange.lowerBound), min(CGFloat(fontSizeRange.upperBound), actualFontSize))
		
		print("actualFontSize = \(actualFontSize)")
		imageSizeConstraint.constant = actualImageSize
		textLabel.font  = textLabel.font.withSize(actualFontSize)
		
		layoutIfNeeded()
	}
	
}
