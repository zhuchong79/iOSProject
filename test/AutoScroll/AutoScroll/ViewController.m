//
//  ViewController.m
//  AutoScroll
//
//  Created by hxl on 16/9/2.
//  Copyright © 2016年 hxl. All rights reserved.
//

#import "ViewController.h"
@interface ViewController ()
{
    CGPoint defaultpt;
}
@property (weak, nonatomic) IBOutlet UILabel *scrollLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //[self scroll];
    // Do any additional setup after loading the view, typically from a nib.
    //self.scrollLabel.frame.origin.x = self.view.bounds.size.width;//self.view.bounds.width;

}
- (void)viewWillAppear:(BOOL)animated
{
    defaultpt = self.scrollLabel.frame.origin;
    defaultpt.x = self.view.bounds.size.width;
    //self.scrollLabel.center = defaultpt;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)scroll
{
 
    [UIView animateWithDuration:2.f delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
        CGPoint temp = self.scrollLabel.center;
        temp.x = 0;
        self.scrollLabel.center = temp;
    } completion:^(BOOL finished){
        self.scrollLabel.center = defaultpt;
        [self scroll];
    
    }];
}
@end
