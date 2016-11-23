//
//  ViewController.m
//  PListTestOSX
//
//  Created by hxl on 16/5/3.
//  Copyright © 2016年 hxl. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view.
}

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}
- (IBAction)Addplistfile:(id)sender {
    NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSLog(@"%@", path);
    //获取完整路径
    NSString *documentsPath = [path objectAtIndex:0];
    NSString *plistPath = [documentsPath stringByAppendingPathComponent:@"usersList.plist"];
    NSMutableDictionary *usersDic = [[NSMutableDictionary alloc ] init];
    //设置属性值
    [usersDic setObject:@"chan" forKey:@"name"];
    [usersDic setObject:@"123456" forKey:@"password"];
    //写入文件
    [usersDic writeToFile:plistPath atomically:YES];
}

- (IBAction)readfile:(id)sender {
    NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSLog(@"%@", path);
    //获取完整路径
    NSString *documentsPath = [path objectAtIndex:0];
    NSString *plistPath = [documentsPath stringByAppendingPathComponent:@"usersList.plist"];
    
    NSMutableDictionary *usersDic = [[NSMutableDictionary alloc]initWithContentsOfFile:plistPath];
    
    NSLog(@"usersDic:%@",usersDic);
    
    [usersDic setObject:@"red" forKey:@"color"];
    [usersDic writeToFile:plistPath atomically:YES];
}

@end
