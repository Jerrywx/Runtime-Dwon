//
//  AnimatedTransitioning.h
//  转场
//
//  Created by Jerry on 15/6/18.
//  Copyright (c) 2015年 Jerry. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AnimatedTransitioning : NSObject <UIViewControllerAnimatedTransitioning>

//
- (instancetype)initWithPresenting:(BOOL) isPresention;

@end
