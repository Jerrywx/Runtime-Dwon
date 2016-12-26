//
//  AViewController.m
//  转场
//
//  Created by Jerry on 15/6/18.
//  Copyright (c) 2015年 Jerry. All rights reserved.
//

#import "AViewController.h"
#import "PresentationController.h"
#import "AnimatedTransitioning.h"

@interface AViewController ()


@end

@implementation AViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
	
	if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
		self.dimmy	= YES;
		self.able	= YES;
		self.color	= [UIColor grayColor];
	}
	return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
	
	self.view.backgroundColor	= [UIColor greenColor];
	UIButton *btn				= [UIButton buttonWithType:UIButtonTypeContactAdd];
	btn.center					= CGPointMake(100, 100);
	[self.view addSubview:btn];
	[btn addTarget:self action:@selector(dismis) forControlEvents:UIControlEventTouchUpInside];
}

- (void)dismis {

	[self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - initialization
- (instancetype)init {
	
	if (self = [super init]) {
		
		// 设置转场代理, 和转场方式
		self.modalPresentationStyle = UIModalPresentationCustom;
		self.transitioningDelegate = self;
	}
	return self;
}

#pragma mark - UIViewControllerTransitioningDelegate
// 
- (UIPresentationController *)presentationControllerForPresentedViewController:(UIViewController *)presented presentingViewController:(UIViewController *)presenting sourceViewController:(UIViewController *)source {

	if (presented == self) {
		
		self.presentDelegate = [[PresentationController alloc] initWithPresentedViewController:presented presentingViewController:presenting];
		
		self.presentDelegate.dimmy = self.dimmy;				// 是否显示
		self.presentDelegate.able = self.able;					// 使能
		self.presentDelegate.color = self.color;				// 颜色
		self.presentDelegate.alpha = self.alpha;				// 透明度
		self.presentDelegate.dimAppear = self.dimAppear;		// 显示动画
		self.presentDelegate.dimDisAppear = self.dimDisAppear;	// 消失动画
		// this is a test
		self.presentDelegate.myBlock = self.myTest;

		return self.presentDelegate;
	}
	return nil;
	
	
	
}

// presented 动画
- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source
{
	
	if (presented == self) {
		
		return [[AnimatedTransitioning alloc] initWithPresenting:YES];
	}
	return nil;
}

// dismis 动画
- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
	
	if (dismissed == self) {
		return [[AnimatedTransitioning alloc] initWithPresenting:NO];
	}
	return NO;
}


@end
