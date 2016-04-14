//
//  ViewController.m
//  MyFirstiOSApp
//
//  Created by hxl on 16/4/11.
//  Copyright © 2016年 hxl. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize name;
@synthesize pwd;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    name.textColor =  [UIColor greenColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)click:(UIButton *)sender {


    NSLog(@"dsaf");
}
-(IBAction)click
{
    NSLog(@"hhhh");

}

@end
