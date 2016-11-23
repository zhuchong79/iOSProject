//
//  MarketCloseViewController.m
//  PopWindow
//
//  Created by hxl on 2016/11/23.
//  Copyright © 2016年 com.hxl.ctp. All rights reserved.
//

#import "MarketCloseViewController.h"

@interface MarketCloseViewController ()

@property(nonatomic,strong) UIViewController *transparentModalViewController;
@end

@implementation MarketCloseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (IBAction)closeWindow:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
    //[self dismissTransparentModalViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void) presentTransparentModalViewController: (UIViewController *) aViewController

                                     animated: (BOOL) isAnimated

                                    withAlpha: (CGFloat) anAlpha{
    
    
#if 1
    self.modalPresentationStyle = UIModalPresentationOverCurrentContext;
    self.modalTransitionStyle   = UIModalTransitionStyleCrossDissolve;

    // self.view.alpha = anAlpha;
    [aViewController presentViewController:self animated:YES completion:^(void){
       // [self.view.superview setAlpha:anAlpha];
    }];

#else
    [self.view setBackgroundColor:[UIColor clearColor]];
    self.view.alpha = anAlpha;
    self.view.tag = 20;
    [aViewController.view addSubview:self.view];
    
#endif

}


-(void) dismissTransparentModalViewControllerAnimated:(BOOL) animated{
    
    for (UIView *subview in ([self.transparentModalViewController.view subviews])) {
        if (subview.tag == 20) {
            [subview removeFromSuperview];
        }
    }
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
