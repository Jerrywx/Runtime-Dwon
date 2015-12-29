//
//  PresentationController.h
//  转场
//
//  Created by Jerry on 15/6/18.
//  Copyright (c) 2015年 Jerry. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PresentationController : UIPresentationController

#pragma mark - dimmy
/// 是否显示 dimmy (默认显示)
@property (nonatomic, assign, getter=isDimmy) BOOL dimmy;

/// 是否点击 dimmu 退出 (默认是)
@property (nonatomic, assign, getter=isAble) BOOL able;

/// 设置 dimmy 颜色 (默认灰色)
@property (nonatomic, strong) UIColor *color;

/// 设置透明度 (默认0.4)
@property (nonatomic, assign) CGFloat alpha;

/// dimmy 出现动画方式 (默认淡入)
@property (nonatomic, copy) BOOL (^dimAppear)();

/// dimmy 消失动画方式 (默认淡出)
@property (nonatomic, copy) BOOL (^dimDisAppear)();


// This is a test;
@property (nonatomic, copy) void(^myBlock)();


@end
