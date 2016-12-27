//
//  ViewController.m
//  Runtime_Down
//
//  Created by 王潇 on 2016/12/26.
//  Copyright © 2016年 王潇. All rights reserved.
//

#import "ViewController.h"
#import <objc/runtime.h>
#import "TestClass.h"

@interface ViewController ()

@end

@implementation ViewController

void test(id self, SEL _cmd) {
	
	printf("This is a Test!\n");
}

- (void)viewDidLoad {
	[super viewDidLoad];
	
	self.view.backgroundColor = [UIColor whiteColor];

	/// 修改对象的方法
//	Method method = class_getInstanceMethod([TestClass class], @selector(printSelf));
	/// 修改类方法
	Method method = class_getClassMethod([TestClass class], @selector(printClass));
	
	IMP dzn_newImplementation = method_setImplementation(method, (IMP)test);
	NSLog(@"==========");
	[TestClass printClass];
	NSLog(@"==========");
	dzn_newImplementation();
	NSLog(@"==========");
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
	
	TestClass *test = [TestClass new];
//	[test printSelf];
	[TestClass printClass];
}



@end
