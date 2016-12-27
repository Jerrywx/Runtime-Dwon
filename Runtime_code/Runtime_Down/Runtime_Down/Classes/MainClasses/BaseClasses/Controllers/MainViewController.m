//
//  MainViewController.m
//  Runtime_Down
//
//  Created by 王潇 on 2016/12/27.
//  Copyright © 2016年 王潇. All rights reserved.
//

#import "MainViewController.h"
#import "ClassesViewController.h"

@interface MainViewController () <UITableViewDataSource, UITableViewDelegate>

/// tableView
@property (nonatomic, strong) UITableView	*tableView;
/// 数据源
@property (nonatomic, strong) NSArray		*dataSource;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	
	[self setupView];
}

- (void)setupView {
	
	/// 初始化界面
	self.title = @"Runtime😀!";
	self.view.backgroundColor = [UIColor whiteColor];
	
	/// 创建 tableView
	self.tableView = ({
		UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds
															  style:UITableViewStyleGrouped];
		tableView.dataSource	= self;
		tableView.delegate		= self;
		tableView.rowHeight		= 55;
		[tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"runtimeCell"];
		[self.view addSubview:tableView];
		tableView;
	});
	
	
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"runtimeCell"];
	
	NSDictionary *dict = self.dataSource[indexPath.row];
	cell.textLabel.text = dict[@"title"];
	
	return cell;
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	///
	[tableView deselectRowAtIndexPath:indexPath animated:YES];
	
	///
	// 1. 设置 cell 点击动画
	[tableView deselectRowAtIndexPath:indexPath animated:YES];
	
	// 2. 获取控制器类名
	NSDictionary *dict = self.dataSource[indexPath.row];
	NSString *conName = dict[@"controller"];
	
	// 3. 创建控制器
	Class class = NSClassFromString(conName);
	UIViewController *controller = [class new];
	
	// 4. 跳转控制器
	[self.navigationController pushViewController:controller animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
	return 0.1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
	return 0.1;
}

#pragma mark - Lazy Loading

- (NSArray *)dataSource {
	
	if (_dataSource) {
		return _dataSource;
	}
	
	_dataSource = @[@{@"title"		: @"Rumtime - Working with Classes",
					  @"controller"	: @"ClassesViewController"},
					@{@"title"		: @"Rumtime - Working with Classes",
					  @"controller"	: @"ClassesViewController"},
					@{@"title"		: @"Rumtime - Working with Classes",
					  @"controller"	: @"ClassesViewController"},
					@{@"title"		: @"Rumtime - Working with Classes",
					  @"controller"	: @"ClassesViewController"},
					@{@"title"		: @"Rumtime - Working with Classes",
					  @"controller"	: @"ClassesViewController"},];

	return _dataSource;
}


@end
