//
//  TestClass.h
//  Runtime_Down
//
//  Created by 王潇 on 2016/12/26.
//  Copyright © 2016年 王潇. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TestClass : NSObject

@property (nonatomic, strong) NSString	*attr;

@property (nonatomic, strong) NSNumber	*number;

@property (nonatomic, assign) NSInteger	numb1;

@property (nonatomic, assign) NSInteger	numb2;

@property (nonatomic, assign) NSInteger	numb3;

- (void)printSelf;

+ (void)printClass;

@end
