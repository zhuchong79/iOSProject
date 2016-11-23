//
//  KCTableTableViewController.m
//  TableViewTest
//
//  Created by hxl on 16/6/29.
//  Copyright © 2016年 hxl. All rights reserved.
//

#import "KCTableTableViewController.h"
#import "KCContact.h"
#import "KCContactGroup.h"

@interface KCTableTableViewController ()<UITableViewDataSource,UITableViewDelegate,UIAlertViewDelegate>
{
    UITableView *_tableView;
    NSMutableArray *_contacts;//联系人模型
    NSIndexPath *_selectedIndexPath;
}

@end

@implementation KCTableTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    [self initData];
    
    _tableView= [[UITableView alloc]initWithFrame:CGRectMake(0,44,self.view.bounds.size.width,self.view.bounds.size.height-44) style:UITableViewStylePlain];
    
    //设置数据源，注意必须实现对应的UITableViewDataSource协议
    _tableView.dataSource=self;
    [_tableView setDelegate:self];
    
    [self.view addSubview:_tableView];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    // NSLog(@"计算分组数");
    return _contacts.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    // NSLog(@"计算每组（组% ld）行数",section);
    KCContactGroup *group = _contacts[section];
    return group.contacts.count;
}

#pragma mark返回每行的单元格
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    //NSLog(@"生成单元格（组:%i,行:%i)",indexPath.section,indexPath.row);
    KCContactGroup *group = _contacts[indexPath.section];
    KCContact * contack = group.contacts[indexPath.row];
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:nil];
    cell.textLabel.text = [contack getName];
    cell.detailTextLabel.text = contack.phoneNumber;
    
    
    
    // Configure the cell...
    
    return cell;
}
#pragma mark 返回每组头标题名称
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
   // NSLog(@"生成 组（%zd）名称",section);
    KCContactGroup *group = _contacts[section];
    return group.name;
}
#pragma mark 返回每组尾部说明
-(NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section{
    //NSLog(@"生成尾部（组%zd）详情",section);
    KCContactGroup *group=_contacts[section];
    return group.detail;
}
#pragma mark 返回每组标题索引
-(NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView{
    //NSLog(@"生成组索引");
    NSMutableArray *indexs=[[NSMutableArray alloc]init];
    for(KCContactGroup *group in _contacts){
        [indexs addObject:group.name];
    }
    return indexs;
}
#if 1


#pragma mark - 代理方法
#pragma mark 设置分组标题内容高度
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    //NSLog(@"设置分组标题内容高度");
    if(section==0){
        return 40;
    }
    return 30;
}

#pragma mark 设置每行高度（每行高度可以不一样）
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 45;
}

#pragma mark 设置尾部说明内容高度
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 30;
}


#endif
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)initData
{
    _contacts = [[NSMutableArray alloc]init];
    KCContact *contact1 = [KCContact initWithFirstName:@"Cui" andLastName:@"Kenshin" andPhoneNumber:@"18400121234"];
    KCContact *contact2 = [KCContact initWithFirstName:@"Cui" andLastName:@"Tom" andPhoneNumber:@"18400121235"];
    KCContactGroup *group1 = [KCContactGroup initWithName:@"C" andDetail:@"With names beginning with C" andContacts:[NSMutableArray arrayWithObjects:contact1,contact2,nil]];
    [_contacts addObject:group1];
    
    KCContact *contact3 = [KCContact initWithFirstName:@"Lee" andLastName:@"Terry" andPhoneNumber:@"18400121234"];
    KCContact *contact4 = [KCContact initWithFirstName:@"Lee" andLastName:@"Jack" andPhoneNumber:@"18400121236"];
    KCContact *contact5 = [KCContact initWithFirstName:@"Lee" andLastName:@"Rose" andPhoneNumber:@"18400121237"];
    KCContactGroup *group2 = [KCContactGroup initWithName:@"L" andDetail:@"With names beginning with L" andContacts:[NSMutableArray arrayWithObjects:contact3,contact4,contact5,nil]];
    [_contacts addObject:group2];
    
    KCContact *contact6 = [KCContact initWithFirstName:@"Sun" andLastName:@"Terry" andPhoneNumber:@"18400121234"];
    KCContact *contact7 = [KCContact initWithFirstName:@"Sun" andLastName:@"Jack" andPhoneNumber:@"18400121236"];
    KCContact *contact8 = [KCContact initWithFirstName:@"Sun" andLastName:@"Rose" andPhoneNumber:@"18400121237"];
    KCContactGroup *group3 = [KCContactGroup initWithName:@"S" andDetail:@"With names beginning with S" andContacts:[NSMutableArray arrayWithObjects:contact6,contact7,contact8,nil]];
    [_contacts addObject:group3];
    
    KCContact *contact9 = [KCContact initWithFirstName:@"Wang" andLastName:@"Gang" andPhoneNumber:@"18400121234"];
    KCContact *contact10 = [KCContact initWithFirstName:@"Wang" andLastName:@"Qiang" andPhoneNumber:@"18400121236"];
    KCContact *contact11 = [KCContact initWithFirstName:@"Wang" andLastName:@"Kui" andPhoneNumber:@"18400121237"];
    KCContact *contact12 = [KCContact initWithFirstName:@"Wang" andLastName:@"Can" andPhoneNumber:@"18400121237"];
    KCContact *contact13 = [KCContact initWithFirstName:@"Wang" andLastName:@"Hua" andPhoneNumber:@"18400121237"];
    KCContactGroup *group4 = [KCContactGroup initWithName:@"W" andDetail:@"With names beginning with W" andContacts:[NSMutableArray arrayWithObjects:contact9,contact10,contact11,contact12,contact13,nil]];
    [_contacts addObject:group4];
    
    KCContact *contact16=[KCContact initWithFirstName:@"Zhang" andLastName:@"Joy" andPhoneNumber:@"18500131246"];
    KCContact *contact14=[KCContact initWithFirstName:@"Zhang" andLastName:@"Vivan" andPhoneNumber:@"18500131247"];
    KCContact *contact15=[KCContact initWithFirstName:@"Zhang" andLastName:@"Joyse" andPhoneNumber:@"18500131248"];
    KCContactGroup *group5=[KCContactGroup initWithName:@"Z" andDetail:@"With names beginning with Z" andContacts:[NSMutableArray arrayWithObjects:contact16,contact14,contact15, nil]];
    [_contacts addObject:group5];
    
}


#pragma mark 点击行
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    _selectedIndexPath=indexPath;
    KCContactGroup *group=_contacts[indexPath.section];
    KCContact *contact=group.contacts[indexPath.row];
    //创建弹出窗口
    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"System Info" message:[contact getName] delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK", nil];
    alert.alertViewStyle=UIAlertViewStylePlainTextInput; //设置窗口内容样式
    UITextField *textField= [alert textFieldAtIndex:0]; //取得文本框
    textField.text=contact.phoneNumber; //设置文本框内容
    [alert show]; //显示窗口
}

#pragma mark 窗口的代理方法，用户保存数据
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    //当点击了第二个按钮（OK）
    if (buttonIndex==1) {
        UITextField *textField= [alertView textFieldAtIndex:0];
        //修改模型数据
        KCContactGroup *group=_contacts[_selectedIndexPath.section];
        KCContact *contact=group.contacts[_selectedIndexPath.row];
        contact.phoneNumber=textField.text;
        //刷新表格
       // [_tableView reloadData];//不推荐，会重刷所有数据,使用下面的方法
        
        NSArray *indexPaths=@[_selectedIndexPath];//需要局部刷新的单元格的组、行
        [_tableView reloadRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationLeft];//后面的参数代表更新时的动画

    }
}

#pragma mark 重写状态样式方法
-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}

@end
