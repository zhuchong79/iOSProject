//
//  UIViewController2.m
//  ManagerTabDemo
//
//  Created by hxl on 16/6/3.
//  Copyright © 2016年 hxl. All rights reserved.
//

#import "UIViewController2.h"
#import <QuartzCore/QuartzCore.h>
@interface UIViewController2 ()
@property(strong,nonatomic)IBOutlet UIButton *btn;
@end

@implementation UIViewController2

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    _btn.frame = CGRectMake(0, 100, 190,30);
    [_btn setTitle:@"截屏测试" forState:UIControlStateNormal];

    [_btn setBackgroundColor:[UIColor whiteColor]];
    [_btn setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
    [self.view addSubview:_btn];
    [_btn addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
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
-(IBAction) buttonClicked:(id)sender
{
    UIGraphicsBeginImageContext(self.view.bounds.size);     //currentView 当前的view
    
    [self.view.layer renderInContext:UIGraphicsGetCurrentContext()];
    
    UIImage *viewImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    UIImageWriteToSavedPhotosAlbum(viewImage, nil, nil, nil);
    

}

@end
