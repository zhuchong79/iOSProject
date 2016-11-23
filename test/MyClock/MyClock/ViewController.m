//
//  ViewController.m
//  MyClock
//
//  Created by hxl on 16/7/18.
//  Copyright © 2016年 hxl. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
//    UILocalNotification *notification=[[UILocalNotification alloc] init];
//    
//    if (notification!=nil) {
//        
//        NSDate *now=[NSDate new];
//        
//        notification.fireDate=[now dateByAddingTimeInterval:10];//10秒后通知
//        
//        notification.repeatInterval=0;//循环次数，kCFCalendarUnitWeekday一周一次
//        
//        notification.timeZone=[NSTimeZone defaultTimeZone];
//        
//        notification.applicationIconBadgeNumber=1; //应用的红色数字
//        
//        notification.soundName= UILocalNotificationDefaultSoundName;//声音，可以换成alarm.soundName = @"myMusic.caf"
//        
//        //去掉下面2行就不会弹出提示框
//        
//        notification.alertBody=@"通知内容";//提示信息 弹出提示框
//        
//        notification.alertAction = @"打开";  //提示框按钮
//        
//        //notification.hasAction = NO; //是否显示额外的按钮，为no时alertAction消失
//        
//        
//        
//        // NSDictionary *infoDict = [NSDictionary dictionaryWithObject:@"someValue" forKey:@"someKey"];
//        
//        //notification.userInfo = infoDict; //添加额外的信息
//        
//        [[UIApplication sharedApplication] scheduleLocalNotification:notification];      
//        
//    }    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
