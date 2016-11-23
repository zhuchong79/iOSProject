//
//  AutoScrollViewController.m
//  AutoScroll
//
//  Created by hxl on 16/9/2.
//  Copyright © 2016年 hxl. All rights reserved.
//

#import "AutoScrollViewController.h"
@interface AutoScrollViewController ()

{
    CGPoint pt;
    CGRect scrollFrame;
}
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *labelLeft;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *labelRight;


@property (weak, nonatomic) IBOutlet UILabel *scrollLabel;
@end


@implementation AutoScrollViewController

- (void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    _labelLeft.constant=self.view.bounds.size.width;
    [self.view layoutIfNeeded];
    [self scroll];
}
-(void)viewDidAppear:(BOOL)animated
{
//    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"we"
//                                                                             message:@"ewe"
//                                                                      preferredStyle:UIAlertControllerStyleAlert];
//    [self presentViewController:alertController animated:YES completion:nil];
//    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
//    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"好的" style:UIAlertActionStyleDefault handler:nil];
//    [alertController addAction:cancelAction];
//    [alertController addAction:okAction];
//    [super viewDidAppear:animated];
    UIAlertView *showAlert = [[UIAlertView alloc] initWithTitle:@"发现新版本" message:@"afd" delegate:nil cancelButtonTitle:cancelStr otherButtonTitles:@"前去升级", nil];
        [showAlert show];
//        [[showAlert rac_buttonClickedSignal] subscribeNext:^(NSNumber *x) {
//            if (x.integerValue == 0 && _forceUpdateType == 1) {
//                [[UIApplication sharedApplication] openURL:[NSURL URLWithString:_mVersionDict[@"url"]]];
//            }
//    
//            if (x.integerValue == 1 && _forceUpdateType == 2) {
//                _isShowUpdateVersion = NO;
//                [[UIApplication sharedApplication] openURL:[NSURL URLWithString:_mVersionDict[@"url"]]];
//            }
//    
//            if (x.integerValue == 0 && _forceUpdateType == 2) {
//                _isShowUpdateVersion = NO;
//            }
//        }];
    
    
    //self.scrollLabel.frame = CGRectMake(self.view.bounds.size.width, self.scrollLabel.frame.origin.y, self.scrollLabel.frame.size.width, self.scrollLabel.frame.size.height);
}

-(void)viewDidLoad
{
    
}
- (IBAction)btnAction:(id)sender {
        self.scrollLabel.frame = CGRectMake(self.view.bounds.size.width, self.scrollLabel.frame.origin.y, self.scrollLabel.frame.size.width, self.scrollLabel.frame.size.height);
}


- (void)scroll
{
    NSLog(@"x begin:%f",self.scrollLabel.frame.origin.x);
    CGRect rect = _scrollLabel.frame;
    [UIView animateWithDuration:0 delay:0 options:UIViewAnimationOptionCurveLinear animations:^{

        self.scrollLabel.frame = CGRectMake(-self.scrollLabel.frame.size.width ,
                                            self.scrollLabel.frame.origin.y,
                                            self.scrollLabel.frame.size.width,
                                            self.scrollLabel.frame.size.height);
        
    } completion:^(BOOL finished) {
        _scrollLabel.frame = rect;
        [UIView animateWithDuration:6 delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
            
            self.scrollLabel.frame = CGRectMake(-self.scrollLabel.frame.size.width ,
                                                self.scrollLabel.frame.origin.y,
                                                self.scrollLabel.frame.size.width,
                                                self.scrollLabel.frame.size.height);
            
        } completion:^(BOOL finished) {
            NSLog(@"x over:%f",self.scrollLabel.frame.origin.x);
            _scrollLabel.frame = rect;
            [self scroll];
        }];
    }];
}
@end
