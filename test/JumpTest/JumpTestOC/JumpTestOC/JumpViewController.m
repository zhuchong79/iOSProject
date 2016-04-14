//
//  JumpViewController.m
//  JumpTestOC
//
//  Created by hxl on 16/4/7.
//  Copyright © 2016年 hxl. All rights reserved.
//

#import "JumpViewController.h"

@interface JumpViewController ()

@end

@implementation JumpViewController

@synthesize page2Data;
@synthesize param;
- (void)viewDidLoad {
    [super viewDidLoad];
    
    page2Data.text=param;
    // Do any additional setup after loading the view.
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

@end
