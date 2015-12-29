//
//  AnimatedTransitioning.m
//  转场
//
//  Created by Jerry on 15/6/18.
//  Copyright (c) 2015年 Jerry. All rights reserved.
//

#import "AnimatedTransitioning.h"
#import "AViewController.h"
#import "ViewController.h"

@interface AnimatedTransitioning () 

//
@property (nonatomic, assign, getter=isPressenting) BOOL Pressenting;

@end

@implementation AnimatedTransitioning

- (instancetype)initWithPresenting:(BOOL) isPresenting {
	
	if (self = [super init]) {
		
		self.Pressenting = isPresenting;
	}
	return self;
}

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
	return 1;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
	
	
	if (self.isPressenting) {
		
		[self animatePresentationWithTransitionContext:transitionContext];
		
//		UIViewController *presentedController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
//		UIView *presentedControllerView = [transitionContext viewForKey:UITransitionContextToViewKey];
//		
//		UIView *containerView = [transitionContext containerView];
//		
//		presentedControllerView.frame = [transitionContext finalFrameForViewController:presentedController];
//		[transitionContext completeTransition:YES];
	} else {
		

		[self animateDismissalWithTransitionContext:transitionContext];
	}
}

- (void)animatePresentationWithTransitionContext:(id<UIViewControllerContextTransitioning>)transitionContext {
	
	NSLog(@"+++++++++++");
	
	UIViewController *presentedController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
	UIView *presentedControllerView = [transitionContext viewForKey:UITransitionContextToViewKey];
	UIView *containerView = [transitionContext containerView];
	
	presentedControllerView.frame = [transitionContext finalFrameForViewController:presentedController];
	CGPoint center = presentedControllerView.center;
	center.y -= containerView.bounds.size.height;
	presentedControllerView.center = center;
	[containerView addSubview:presentedControllerView];
	
//	NSLog(@"---22-- %f", presentedControllerView.center.y);
//	[UIView animateWithDuration:1.0 animations:^{
//		
//		CGPoint center = presentedControllerView.center;
//		center.y += containerView.bounds.size.height;
//		presentedControllerView.center = center;
//		NSLog(@"--22-- %f", presentedControllerView.center.y);
//	} completion:^(BOOL finished) {
//		
//		[transitionContext completeTransition:finished];
//	}];
//	[UIView animateWithDuration:time delay:0 usingSpringWithDamping:0.5 initialSpringVelocity:5.0 options:UIViewAnimationOptionTransitionNone animations:^{
	[UIView animateWithDuration:1.0 delay:0.0 usingSpringWithDamping:0.5 initialSpringVelocity:3.0 options:UIViewAnimationOptionTransitionNone  animations:^{
		
		CGPoint center = presentedControllerView.center;
				center.y += containerView.bounds.size.height;
				presentedControllerView.center = center;
	} completion:^(BOOL finished) {
		
		[transitionContext completeTransition:finished];
	}];
	
}

- (void)animateDismissalWithTransitionContext:(id<UIViewControllerContextTransitioning>)transitionContext {
	
	NSLog(@"------------");
	UIViewController *presentedController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
	UIView *presentedControllerView = [transitionContext viewForKey:UITransitionContextFromViewKey];
	UIView *containerView = [transitionContext containerView];
	
	NSString *str = NSStringFromCGRect(presentedControllerView.frame);
	NSLog(@"----- %@", str);
	
	[UIView animateWithDuration:1.0 delay:0.0 usingSpringWithDamping:1.0 initialSpringVelocity:0.0 options:UIViewAnimationOptionAllowUserInteraction animations:^{
		
		CGPoint center = presentedControllerView.center;
		//		center.y += containerView.bounds.size.height;
		center.y -= containerView.bounds.size.height;
		presentedControllerView.center = center;
	} completion:^(BOOL finished) {
		
		[transitionContext completeTransition:finished];
	}];
	
	
//	[UIView animateWithDuration:1.0 animations:^{
//		CGPoint center = presentedControllerView.center;
//		//		center.y += containerView.bounds.size.height;
//		center.y -= containerView.bounds.size.height;
//		presentedControllerView.center = center;
//		NSLog(@"----- %f", presentedControllerView.center.y);
//	} completion:^(BOOL finished) {
//		
//		[transitionContext completeTransition:finished];
//	}];
}


@end















