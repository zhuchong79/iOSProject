//
//  ViewController.m
//  JumpTestOC
//
//  Created by hxl on 16/4/7.
//  Copyright © 2016年 hxl. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize page1Data;
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*-(void)viewDidAppear:(BOOL)animated
{
    [self performSegueWithIdentifier:@"line1" sender:self];
}
*/

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{

    NSString *data=page1Data.text;
    UIViewController *view=segue.destinationViewController;
    if ([view respondsToSelector:@selector(setParam:)]) {
        
        [view setValue:data forKey:@"param"];
    }
}
@end
