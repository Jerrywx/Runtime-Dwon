//
//  ClassesViewController.m
//  Runtime_Down
//
//  Created by 王潇 on 2016/12/27.
//  Copyright © 2016年 王潇. All rights reserved.
//

#import "ClassesViewController.h"
#import <objc/runtime.h>
#import "TestClass.h"

@interface ClassesViewController ()

@end

@implementation ClassesViewController

- (void)viewDidLoad {
    [super viewDidLoad];

	self.title = @"Working with Classes";
	self.view.backgroundColor = [UIColor whiteColor];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//	[self jr_class_getName];
//	[self jr_class_isMetaClass];
//	[self jr_class_getSuperclass];
//	[self jr_class_setSuperclass];
//	[self jr_class_getVersion];
	[self jr_class_getInstanceSize];
}

#pragma mark - Code Sample
/// class_getName	获取类名称
- (void)jr_class_getName {
	const char *className = class_getName([UITableViewCell class]);
	NSLog(@"UITableViewCell: %s", className);
}

/// class_isMetaClass	判断指定类是否是原类
- (void)jr_class_isMetaClass {
	
	if (class_isMetaClass([UITableView class])) {
		NSLog(@"UITableView 是原类");
	} else {
		NSLog(@"UITableView 不是原类");
	}
	
	if (class_isMetaClass([NSObject class])) {
		NSLog(@"NSObject 是原类");
	} else {
		NSLog(@"NSObject 不是原类");
	}
}

/// class_getSuperclass		获取父类
- (void)jr_class_getSuperclass {

	Class myClass = [UITableView class];
	
	while (!class_isMetaClass(myClass) && myClass) {
		/// 获取类名
		NSLog(@"class: %s", class_getName(myClass));
		/// 获取父类
		myClass = class_getSuperclass(myClass);
	}
}

/// class_setSuperclass		设置类的父类
- (void)jr_class_setSuperclass {
	
	Class tableClass = [TestClass class];
	Class myClass    = [UIView class];
	// 已经弃用, 不推荐使用
	class_setSuperclass(tableClass, myClass);
	Class superClass = class_getSuperclass(tableClass);
	
	NSLog(@"tableClass 的父类:%s", class_getName(superClass));
}

/// class_getVersion		获取类定义的版本
- (void)jr_class_getVersion {
	
	Class testClass = [UICollectionView class];
	
	int version = class_getVersion(testClass);
	NSLog(@"UITableView : %d", version);
}

/// class_getInstanceSize	获取某类创建对象的大小
- (void)jr_class_getInstanceSize {
	
	size_t size1 = class_getInstanceSize([TestClass class]);

	size_t size2 = class_getInstanceSize([UIView class]);
	
	size_t size3 = class_getInstanceSize([UICollectionView class]);
	
	NSLog(@"===== %zu  %zu   %zu", size1, size2, size3);
}

@end











