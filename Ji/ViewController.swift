//
//  ViewController.swift
//  Ji
//
//  Created by Honghao Zhang on 2015-07-18.
//  Copyright (c) 2015 Honghao Zhang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	override func viewDidLoad() {
		super.viewDidLoad()
		
		// Init with data
		let googleIndexData = NSData(contentsOfURL: NSURL(string: "http://www.google.com")!)
		if let googleIndexData = googleIndexData {
			let jiGoogleIndexDoc = Ji(htmlData: googleIndexData)!
			
			let nodes = jiGoogleIndexDoc.xPath("//body")
			println("tag name: \(nodes?.first?.name)")
		} else {
			println("google.com is inaccessible")
		}
		
		// Init with URL
		let jiAppleSupportDoc = Ji(htmlURL: NSURL(string: "http://www.apple.com/support")!)
		let titleNode = jiAppleSupportDoc?.xPath("//head/title")?.first
		println("title: \(titleNode?.content)")
		
		// Init with String
		let xmlString = "<?xml version='1.0' encoding='UTF-8'?><note><to>Tove</to><from>Jani</from><heading>Reminder</heading><body>Don't forget me this weekend!</body></note>"
		let xmlDoc = Ji(xmlString: xmlString)
		let bodyNode = xmlDoc?.rootNode?.firstChildWithName("body")
		println("body: \(bodyNode?.content)")
	}
}
