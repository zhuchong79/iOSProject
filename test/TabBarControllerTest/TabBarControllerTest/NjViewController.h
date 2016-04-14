//
//  NjViewController.h
//  TabBarControllerTest
//
//  Created by hxl on 16/4/11.
//  Copyright © 2016年 hxl. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NjViewController : UIViewController

@property (strong, nonatomic) IBOutlet UITextField *text1;
@property (strong, nonatomic) IBOutlet UISlider *slide;
- (IBAction)OnSlider:(id)sender;
@end
