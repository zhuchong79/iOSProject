//
//  ViewController1.m
//  AnimationTest
//
//  Created by hxl on 16/6/22.
//  Copyright © 2016年 hxl. All rights reserved.
//

#import "ViewController1.h"

#import "AnimationView.h"

@interface ViewController1 ()

@end

@implementation ViewController1

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIImageView * iv = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 460)];
    iv.image = [UIImage imageNamed:@"image1"];
    [self.view addSubview:iv];
    
    AnimationView *triView = [[AnimationView alloc] initWithFrame:CGRectMake(0, 200, 200,200)];
    triView.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:triView];

    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationWillStartSelector:@selector(animationDidStart:)];
    [UIView setAnimationDidStopSelector:@selector(animationDidStop:finished:)];
    [UIView setAnimationDelay:0.0f];
    [UIView setAnimationDuration:3.0f];
    [UIView setAnimationRepeatAutoreverses:YES];
    [UIView setAnimationRepeatCount:MAXFLOAT];
    
    iv.alpha = 0.0f;
    triView.alpha = 0.0f;
    [UIView commitAnimations];
    //[iv release];
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
-(void)animationDidStart:(CAAnimation *)anim
{
    NSLog(@"animation is start ...");
}

-(void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    NSLog(@"animation is over ...");
}

@end
