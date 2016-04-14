//
//  ViewController.m
//  EventTest
//
//  Created by hxl on 16/4/11.
//  Copyright © 2016年 hxl. All rights reserved.
//

#import "ViewController.h"
#include "MyUITextField.h"
@interface ViewController ()
{
   // @property (strong, nonatomic) IBOutlet UITextField *name;
    //@property (strong, nonatomic) IBOutlet MyUITextField *pwd;
    __weak IBOutlet UITextField *pwd;
    __weak IBOutlet UITextField *name;

}

@end

@implementation ViewController

//@synthesize text1;
//@synthesize pwd;
//@synthesize name;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
   // pwd=[[MyUITextField alloc]initWithTextColor:[UIColor greenColor] withBackgroudColor:[UIColor whiteColor]];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(IBAction)click:(id)sender
{
    static bool ischange=true;
    UIButton *btn = (UIButton *)sender;
    if (ischange) {
        
        btn.backgroundColor=[UIColor greenColor];
    }
    else
    {
    btn.backgroundColor=[UIColor redColor];
    }
    ischange=!ischange;
   // NSLog(@"adsf");

}
-(IBAction)calc:(id)sender
{
//        NSInteger sum=  self.pwd.text.integerValue+self.name.text.integerValue;
    NSInteger sum=  pwd.text.integerValue+name.text.integerValue;
    
    NSLog(@"%d",sum);

}
@end
