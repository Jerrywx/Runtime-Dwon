//
//  JRTableView.swift
//  Runtime-Swift
//
//  Created by 王潇 on 2017/1/3.
//  Copyright © 2017年 王潇. All rights reserved.
//

import UIKit

class JRTableView: UITableView {

	override init(frame: CGRect, style: UITableViewStyle) {
		
		///: Use of 'self' in method call 'setupUI' before super.init initializes self
		super.init(frame: frame, style: style)
		setupUI()
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	private func setupUI() {
		print("初始化 JRTableView")
	}
}
