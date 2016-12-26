//
//  Other.m
//  转场
//
//  Created by Jerry on 15/6/18.
//  Copyright (c) 2015年 Jerry. All rights reserved.
//

#import "Other.h"

@interface Other ()

@end

@implementation Other

- (void)viewDidLoad {
    [super viewDidLoad];
    
	self.view.backgroundColor = [UIColor orangeColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return 5;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	
	UITableViewCell *cell = [[UITableViewCell alloc] init];
	
	return cell;
}


- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView {
	
	[self dismissViewControllerAnimated:YES completion:^{
		NSLog(@"oooo");
	}];
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	
	[self dismissViewControllerAnimated:YES completion:^{
		
		NSLog(@"dismiss");
	}];
}


@end
