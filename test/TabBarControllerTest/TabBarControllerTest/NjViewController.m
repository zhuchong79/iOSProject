//
//  NjViewController.m
//  TabBarControllerTest
//
//  Created by hxl on 16/4/11.
//  Copyright © 2016年 hxl. All rights reserved.
//

#import "NjViewController.h"

@interface NjViewController ()

@end

@implementation NjViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [_text1 addTarget:self
                  action:@selector(myIBActionMethod:)
        forControlEvents:UIControlEventEditingChanged];
    _slide.maximumValue=100;
    _slide.minimumValue=0;
    _slide.value=50;
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

- (IBAction)OnSlider:(id)sender {
    NSLog(@"%d",(int)_slide.value);
    _text1.text=[NSString stringWithFormat:@"%d",(int)_slide.value];

}
- (IBAction)myIBActionMethod:(id)sender {
    
    if (_text1.text.length>10) {NSLog(@"Bigger than 10");}
    else{NSLog(@"Less than 10");}

}
@end
