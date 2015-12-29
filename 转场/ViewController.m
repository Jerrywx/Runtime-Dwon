//
//  ViewController.m
//  转场
//
//  Created by Jerry on 15/6/18.
//  Copyright (c) 2015年 Jerry. All rights reserved.
//

#import "ViewController.h"
#import "AViewController.h"
#import "PresentationController.h"

@interface ViewController () <UIViewControllerTransitioningDelegate>

//
@property (nonatomic, strong) AViewController *cc;

@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	
	// UIButton
	UIButton *btn = [UIButton buttonWithType:UIButtonTypeContactAdd];
	btn.center = CGPointMake(30, 80);
	[self.view addSubview:btn];
	
	// Controller
	AViewController *c = [[AViewController alloc] init];
	self.cc = c;
	
	self.cc.color = [UIColor blueColor];
	self.cc.alpha = 1;
	
	self.cc.myTest = ^{
		NSLog(@"This is a test");
	};
	
	
	// 目标控制器设置
//	self.cc.modalPresentationStyle = UIModalPresentationCustom;
//	self.trans = [[TransitioningDelegate alloc] init];
//	self.cc.transitioningDelegate = self.trans;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
	
	[self presentViewController:self.cc animated:YES completion:^{
		
		NSLog(@"over");
	}];
}


@end
