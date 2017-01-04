//
//  ViewController.swift
//  Runtime-Swift
//
//  Created by 王潇 on 2017/1/3.
//  Copyright © 2017年 王潇. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	lazy var tableView : JRTableView = JRTableView()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		print(self.tableView)
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}

	
	
	
}

