//
//  ViewController.m
//  WidgetApp
//
//  Created by hxl on 2016/10/24.
//  Copyright © 2016年 com.hxl.test. All rights reserved.
//

#import "ViewController.h"
#import "TableViewCell.h"
@interface ViewController () <UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSArray *dataArr;
@end

@implementation ViewController
- (void)loadView
{
    _dataArr = [NSArray arrayWithObjects:@"12",@"34",@"56",@"78",nil];
    [super loadView];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    _tableView.delegate=self;
    _tableView.dataSource=self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSUserDefaults*userDefault =[[NSUserDefaults alloc] initWithSuiteName:@"group.hxl.widget"];
    [userDefault setObject:@"123" forKey:@"test"];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -- tableview delegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 40.f;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10.f;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 10.f;
}

#pragma mark --tableview datasource
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TableViewCell *cell = [_tableView dequeueReusableCellWithIdentifier:@"reuse_cell" forIndexPath:indexPath];
    [cell setConfig:_dataArr[indexPath.section]];
    return cell;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return  1;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return _dataArr.count;
}


//先要设Cell可编辑

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath

{
    
    return YES;
    
}

//定义编辑样式

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath

{
    
    [tableView setEditing:YES animated:YES];
    
    return UITableViewCellEditingStyleDelete;
    
}

//进入编辑模式，按下出现的编辑按钮后

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath

{
    
    [tableView setEditing:NO animated:YES];
    
}
@end
