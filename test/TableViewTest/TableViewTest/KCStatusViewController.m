//
//  KCStatusViewController.m
//  TableViewTest
//
//  Created by hxl on 16/6/29.
//  Copyright © 2016年 hxl. All rights reserved.
//

#import "KCStatusViewController.h"
#import "KCStatusTableViewCell.h"
#import "MyTableViewCell.h"

@interface KCStatusViewController ()<UITableViewDataSource,UITableViewDelegate,UIAlertViewDelegate>{
    UITableView *_tableView;
    NSMutableArray *_status;
    NSMutableArray *_statusCells;//存储cell，用于计算高度
}
@end

@implementation KCStatusViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //初始化数据
    [self initData];
    
    //创建一个分组样式的UITableView
    _tableView=[[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    
    //设置数据源，注意必须实现对应的UITableViewDataSource协议
    _tableView.dataSource=self;
    //设置代理
    _tableView.delegate=self;
    
    [self.view addSubview:_tableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
#pragma mark 加载数据
-(void)initData{
    NSString *path=[[NSBundle mainBundle] pathForResource:@"StatusInfo" ofType:@"plist"];
    NSArray *array=[NSArray arrayWithContentsOfFile:path];
    _status=[[NSMutableArray alloc]init];
    _statusCells=[[NSMutableArray alloc]init];
    [array enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        [_status addObject:[KCStatus statusWithDictionary:obj]];
        KCStatusTableViewCell *cell=[[KCStatusTableViewCell alloc]init];
        [_statusCells addObject:cell];
    }];
}
#pragma mark - 数据源方法
#pragma mark 返回分组数
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    
    return 2;
}

#pragma mark 返回每组行数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if (section == 0) {
        return 1;
    }
    return _status.count;
}

#pragma mark返回每行的单元格
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *cellIdentifier=@"UITableViewCellIdentifierKey1";
    //NSLog(@"")
    if(indexPath.section == 0)
    {
        MyTableViewCell *cell;
        cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
        
        if(!cell){
            cell=[[MyTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        }
         return cell;
    }
    else{
    KCStatusTableViewCell *cell;
    cell=[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if(!cell){
        cell=[[KCStatusTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    //在此设置微博，以便重新布局
    KCStatus *status=_status[indexPath.row];
    cell.status=status;
         return cell;
    }
   
}

#pragma mark - 代理方法
#pragma mark 重新设置单元格高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    //KCStatusTableViewCell *cell=[tableView cellForRowAtIndexPath:indexPath];
    
    if(indexPath.section == 0)
    {
        return 255;
    }
    KCStatusTableViewCell *cell= _statusCells[indexPath.row];
    cell.status=_status[indexPath.row];
    return cell.height;
}

#pragma mark 重写状态样式方法
-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}
@end

