//
//  PresentationController.m
//  转场
//
//  Created by Jerry on 15/6/18.
//  Copyright (c) 2015年 Jerry. All rights reserved.
//

#import "PresentationController.h"

@interface PresentationController ()

@property (nonatomic, strong) UIView *dimm;

@end

@implementation PresentationController


- (void)presentationTransitionWillBegin {
	
	[self.containerView addSubview:self.dimm];
	
	[self.containerView addSubview:[self presentedView]];

	[[self.presentedViewController transitionCoordinator] animateAlongsideTransition:^(id<UIViewControllerTransitionCoordinatorContext> context) {
		self.dimm.alpha = self.alpha;
	} completion:^(id<UIViewControllerTransitionCoordinatorContext> context) {
		
	}];
	
	NSLog(@"%s", __FUNCTION__);
}

- (void)presentationTransitionDidEnd:(BOOL)completed {
	
	self.myBlock();
	
	NSLog(@"%s", __FUNCTION__);
}

- (void)dismissalTransitionWillBegin {
	NSLog(@"%s", __FUNCTION__);
}

- (void)dismissalTransitionDidEnd:(BOOL)completed {
	NSLog(@"%s", __FUNCTION__);
}

- (CGRect)frameOfPresentedViewInContainerView {
	
	CGRect frame = CGRectInset(self.containerView.bounds, 50, 100);
	return frame;
}


#pragma makr - 懒加载
- (UIView *)dimm {
	
	if (!_dimm && self.dimmy) {
		
		_dimm = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];

		if (self.color == nil) {
			_dimm.backgroundColor = [UIColor grayColor];
		}else {
			_dimm.backgroundColor = self.color;
		}
		if (self.alpha == 0) {
			self.alpha = 0.4;
		}
		
		_dimm.alpha = 0.0;
	}
	return _dimm;
}

@end
