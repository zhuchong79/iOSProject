//
//  ViewController.h
//  MyFirstiOSApp
//
//  Created by hxl on 16/4/11.
//  Copyright © 2016年 hxl. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITextField *name;

@property (strong, nonatomic) IBOutlet UITextField *pwd;

-(IBAction)click;
@end

