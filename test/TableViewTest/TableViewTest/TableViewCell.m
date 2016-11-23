//
//  TableViewCell.m
//  TableViewTest
//
//  Created by hxl on 16/7/7.
//  Copyright © 2016年 hxl. All rights reserved.
//

#import "TableViewCell.h"

@implementation TableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
//
//  EFSMineViewController.m
//  EFSMobile
//
//  Created by zhanglu on 15/11/24.
//  Copyright © 2015年 Elephants Financial Service. All rights reserved.
//

#import "EFSMineViewController.h"
#import "EFSMineListItemCell.h"
#import "EFSCircleImageView.h"
#import "EFSUserManager.h"
#import "EFSAnalytics.h"
#import "EFSChartAdapter.h"
#import "TSMessage+YTX.h"
#import "EFSChartAdapter.h"

#import "EFSUserManager+Extension.h"

#import "EFSNFXGResetPasswordViewController.h"
#import "EFSSettingNotificationViewController.h"
#import "EFSNFXGTradeManager.h"

#import <MBProgressHUD/MBProgressHUD.h>

#import <SDWebImage/UIImageView+WebCache.h>
#import "EFSNFXGLoginView.h"
#import "EFSSwipeLockSetViewController.h"
#import "EFSNavigationController.h"
#import "EFSLearnWebViewController.h"

NSString *kChangeNicknameSegueString = @"Change Nick Name";
NSString *kShowAboutusSegueString = @"Show About Us";
NSString *kShowFeedback = @"Show Feedback";
NSString *kShowSettingNotification = @"Show Setting Notification";
NSString *kShowNotificationTypePage = @"Show Notification Type Page";



@interface EFSMineViewController() <UITableViewDataSource, UITableViewDelegate>
{
    NSMutableArray *_mineItems;
    BOOL _isSettingNotification;
}
@property (weak, nonatomic) IBOutlet EFSCircleImageView *userAvatar;
@property (weak, nonatomic) IBOutlet UILabel *nicknameLabel;
@property (weak, nonatomic) IBOutlet UIButton *loginButton;
@property (weak, nonatomic) IBOutlet UIButton *changeNicknameButton;
@property (weak, nonatomic) IBOutlet UIButton *arrowButton;
@property (weak, nonatomic) IBOutlet UIButton *customerButton;
@property (copy, nonatomic) NSArray *availableMineItems;

@end

@implementation EFSMineViewController

- (NSMutableArray *)mineItems
{
    if (_mineItems == nil) {
        _mineItems = [NSMutableArray arrayWithArray: @[
                                                       @[
                                                           //@TODO("获取最新的推送列表信息，这一版先不做")
                                                           //                           [NSMutableDictionary dictionaryWithDictionary:@{@"icon" : @"mine_message", @"title": @"消息提醒"}],
                                                           [NSMutableDictionary dictionaryWithDictionary:@{@"icon" : @"changePw", @"title": @"修改交易密码"}],
                                                           [NSMutableDictionary dictionaryWithDictionary:@{@"icon" : @"mine_msg_setting", @"title": @"推送设置"}],
                                                           ],
                                                       @[
                                                           [NSMutableDictionary dictionaryWithDictionary:@{@"icon" : @"mine_learn", @"title": @"新手学堂"}],
                                                           [NSMutableDictionary dictionaryWithDictionary:@{@"icon" : @"mine_clean", @"title": @"清空缓存",@"sizeLabel": @""/*,  @"subtitle": @"若遇上行情问题，建议尝试清除缓存！"*/}],
                                                           [NSMutableDictionary dictionaryWithDictionary:@{@"icon" : @"mine_suggest", @"title": @"建议反馈"/*, @"subtitle": @"使用时有任何疑问，请反馈给我们！"*/}],
                                                           [NSMutableDictionary dictionaryWithDictionary:@{@"icon" : @"mine_about", @"title": @"关于大象"}],
                                                           
                                                           ]
                                                       ]];
    }
    return _mineItems;
}

- (void)updateAvailableMineItems
{
    @weakify(self);
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        @strongify(self);
        NSMutableArray *availableMineItems = [NSMutableArray array];
        for (NSArray *sectionItems in self.mineItems) {
            BOOL hasItems = NO;
            NSMutableArray *availableSectionItems = [NSMutableArray array];
            for (NSDictionary *item in sectionItems) {
                
                if (![item[@"isHidden"] boolValue]) {
                    hasItems = YES;
                    [availableSectionItems addObject:item];
                }
                if (item[@"sizeLabel"]) {
                    [item setValue:[NSString stringWithFormat:@"约%.2fMB",[[EFSChartAdapter sharedAdapter] getCacheInfo]] forKey:@"sizeLabel"];
                }
            }
            if (hasItems) {
                [availableMineItems addObject:availableSectionItems];
            }
        }
        self.availableMineItems = [NSArray arrayWithArray:availableMineItems];
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView reloadData];
        });
    });
}

- (void) updateUI
{
    self.tableView.backgroundView = nil;
    self.tableView.backgroundColor = [UIColor lightBackgroundColor];
}

- (void)updateUserUI
{
    EFSUser *currentUser = [EFSUserManager sharedManager].currentUser;
    [self.userAvatar sd_setImageWithURL:currentUser.imgUrl];
    [self.changeNicknameButton setTitle:currentUser.nickname forState:UIControlStateNormal];
    self.loginButton.hidden = YES;
    self.changeNicknameButton.hidden = NO;
    self.arrowButton.hidden = NO;
}

- (void)resetUserUI
{
    self.loginButton.hidden = NO;
    self.changeNicknameButton.hidden = YES;
    self.arrowButton.hidden = YES;
    self.userAvatar.image = nil;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self updateUI];
    
    @weakify(self);
    [[[RACSignal merge:@[
                         RACObserve([EFSUserManager sharedManager], currentUser.token),
                         RACObserve([EFSUserManager sharedManager], currentUser.phoneNum)
                         ]
       ] replayLast] subscribeNext:^(id x) {
        @strongify(self);
        if ([[EFSUserManager sharedManager] hasLogin]) {
            [self updateUserUI];
        }
        else {
            [self resetUserUI];
        }
        [self updateAvailableMineItems];
    }];
    
    [[RACSignal merge:@[[self.changeNicknameButton rac_signalForControlEvents:UIControlEventTouchUpInside],
                        [self.arrowButton rac_signalForControlEvents:UIControlEventTouchUpInside]]]subscribeNext:^(id x) {
        if ([[EFSUserManager sharedManager] hasLogin]) {
            [self performSegueWithIdentifier:kChangeNicknameSegueString sender:nil];
        }
    }];
    
    // 交易退出后隐藏 修改交易密码Cell
    [RACObserve([EFSNFXGTradeManager sharedManager], tradeToken) subscribeNext:^(NSString *x) {
        @strongify(self);
        if (x) {
            self.mineItems[0][0][@"isHidden"] = @NO;
        } else {
            self.mineItems[0][0][@"isHidden"] = @YES;
        }
        [self updateAvailableMineItems];
    }];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    //    self.headerView.bounds = CGRectMake(0, 0, self.headerView.bounds.size.width, self.headerView.bounds.size.width / 15.0 * 7 - 100);
    [self updateAvailableMineItems];
}

- (void)viewDidAppear:(BOOL)animated {
    
    [super viewDidAppear:animated];
    if ([[EFSUserManager sharedManager] hasLogin]) {
        [self showSetSwipeLockPassword];
    }
    [self checkInSettingNotification];
}

- (void)checkInSettingNotification
{
    if (_isSettingNotification && [EFSUserManager sharedManager].currentUser.token) {
        _isSettingNotification = NO;
        [self performSegueWithIdentifier:kShowSettingNotification sender:self];
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (!self.availableMineItems) {
        return 0;
    }
    NSDictionary *dataItem = self.availableMineItems[indexPath.section][indexPath.row];
    if ([dataItem.allKeys containsObject:@"subtitle"]) {
        return 65.0f;
    }
    return 52.0f;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if (!self.availableMineItems) {
        return 0;
    }
    return self.availableMineItems.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return ((NSArray *)(self.availableMineItems[section])).count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSArray *dataArray = self.availableMineItems[indexPath.section];
    NSDictionary *itemData = dataArray[indexPath.row];
    
    if ([itemData[@"title"] isEqualToString:@"登出"]) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Log out Cell" forIndexPath:indexPath];
        return cell;
    }
    EFSMineListItemCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Mine List Item Cell" forIndexPath:indexPath];
    [cell configCellWithDataItem: itemData];
    if (dataArray.count == 1) {
        [cell oneRow];
    } else if (indexPath.row == 0) {
        [cell topRow];
    } else if (indexPath.row == dataArray.count - 1) {
        [cell bottomRow];
    } else {
        [cell middleRow];
    }
    return cell;
}

#pragma mark table delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary *itemData = self.availableMineItems[indexPath.section][indexPath.row];
    
    if ([itemData[@"title"] isEqualToString:@"登出"] && [[EFSUserManager sharedManager] hasLogin]) {
        @TODO("EFSAnalytics");
        //        [EFSAnalytics event:LOGOUT];
        [[EFSUserManager sharedManager] logoutAll];
    }
    
    if ([itemData[@"title"] isEqualToString:@"消息提醒"]) {
        [self performSegueWithIdentifier:kShowNotificationTypePage sender:self];
    }
    
    if ([itemData[@"title"] isEqualToString:@"新手学堂"]) {
        [EFSAnalytics eventUmeng:EFS_Discovery_Beginners withData:nil];
        EFSLearnWebViewController* investClass = [[EFSLearnWebViewController alloc] init];
        investClass.title = itemData[@"title"];
#if TESTING
        investClass.configUrl = P(@"test.investClassUrl");
#else
        investClass.configUrl = P(@"investClassUrl");
#endif
        NSString*url =[NSString stringWithFormat:@"http://client.baidao.com/hd/xsxt/index.html?tradeid=%@",[EFSUserManager sharedManager].currentUser.tradeAccount];
        investClass.configUrl =url;
        [self.navigationController pushViewController:investClass animated:YES];
    }
    
    if ([itemData[@"title"] isEqualToString:@"建议反馈"]) {
        [self performSegueWithIdentifier:kShowFeedback sender:self];
    }
    
    if ([itemData[@"title"] isEqualToString:@"清空缓存"]) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:P(@"appname")
                                                        message:@"一旦清空将不能还原"
                                                       delegate:self
                                              cancelButtonTitle:@"取消"
                                              otherButtonTitles:@"确认", nil];
        alert.tag = 1;
        [alert show];
    }
    
    if ([itemData[@"title"] isEqualToString:@"修改交易密码"]) {
        EFSNFXGResetPasswordViewController *resetPw = [UIStoryboard EFSNFXGResetPasswordViewController];
        [self.navigationController pushViewController:resetPw animated:YES];
    }
    
    if ([itemData[@"title"] isEqualToString:@"推送设置"]) {
        if (![EFSUserManager sharedManager].hasLogin) {
            _isSettingNotification = YES;
            [EFSJump jump:JumpTypeLogin withData:nil from:self];
        } else {
            [self performSegueWithIdentifier:kShowSettingNotification sender:self];
        }
    }
    
    if ([itemData[@"title"] isEqualToString:@"关于大象"]) {
        [self performSegueWithIdentifier:kShowAboutusSegueString sender:self];
    }
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (void)alertView:(UIAlertView *)theAlert clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 1 && theAlert.tag == 1) {
        
        NSAssert(self.parentViewController.parentViewController!=nil, @"self.parentViewController.parentViewController is not nil");
        NSAssert([self.parentViewController.parentViewController isKindOfClass:[UITabBarController class]], @"self.parentViewController.parentViewController must be the root viewController");
        
        [MBProgressHUD showHUDAddedTo:self.parentViewController.parentViewController.view animated:YES];
        @weakify(self);
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH , 0), ^{
            [[EFSChartAdapter sharedAdapter] clearAllDataCache];
            @strongify(self);
            dispatch_async(dispatch_get_main_queue(), ^{
                [MBProgressHUD hideHUDForView:self.parentViewController.parentViewController.view animated:YES];
                for (NSArray *sectionItems in self.mineItems){
                    for (NSDictionary *item in sectionItems) {
                        if (item[@"sizeLabel"]) {
                            [item setValue:[NSString stringWithFormat:@"约%.2fMB",[[EFSChartAdapter sharedAdapter] getCacheInfo]] forKey:@"sizeLabel"];
                        }
                    }
                }
                [self.tableView reloadData];
                [TSMessage ytx_showNotificationInViewController:self title:@"清除成功" type:TSMessageNotificationTypeSuccess];
            });
        });
        return;
    }
    
    if (theAlert.tag == 2) {
        [EFSUserManager sharedManager].mUserPassWordInfo.isFirstLogin = NO;
        [[EFSUserManager sharedManager] saveUserPassWordToCache];
        if (buttonIndex == 1) {
            EFSSwipeLockSetViewController *mController = [[self storyboard] instantiateViewControllerWithIdentifier:EFSSwipeLockSetID];
            [self.navigationController pushViewController:mController animated:YES];
        }
    }
}

- (void)showSetSwipeLockPassword {
    
    static BOOL isShow = NO;
    if ([EFSUserManager sharedManager].mUserPassWordInfo.isFirstLogin == NO) {
        return;
    }
    
    if (isShow == YES) {
        isShow = NO;
        return;
    }
    
    UIAlertView *mAlertView = [[UIAlertView alloc] initWithTitle:@"账户保护" message:@"设置手势密码,一次设置,使您的账号更安全、交易更方便!" delegate:self cancelButtonTitle:@"忽略" otherButtonTitles:@"设置", nil];
    mAlertView.tag = 2;
    [mAlertView show];
    isShow = YES;
}

- (IBAction)gotLogin:(id)sender //登录
{
    if (![[EFSUserManager sharedManager] hasLogin]) {
        [EFSJump jump:JumpTypeLogin withData:nil from:self];
    }
}

@end
