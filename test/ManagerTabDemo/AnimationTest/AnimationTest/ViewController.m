//
//  ViewController.m
//  AnimationTest
//
//  Created by hxl on 16/6/22.
//  Copyright © 2016年 hxl. All rights reserved.
//

#import "ViewController.h"
#import "AnimationView.h"
#import <QuartzCore/CAAnimation.h>

@interface ViewController ()
{
    __block AnimationView *triView;
}
@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) IBOutlet UIView *drawView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //[_imageView beginAnimaion]
       //[_drawView drawRect:CGRectMake(0,200,20,30)];
    
  //  [_drawView.layer addAnimation:[self opacityForever_Animation:0.5] forKey:nil];
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(0, 350, 100, 30)];
    [btn setBackgroundColor:[UIColor blueColor]];
    [btn setTitle:@"start" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(anistart) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:btn];
    
    UIButton *btnstop = [[UIButton alloc]initWithFrame:CGRectMake(150, 350, 100, 30)];
    [btnstop setBackgroundColor:[UIColor blueColor]];
    [btnstop setTitle:@"stop" forState:UIControlStateNormal];
    [btnstop addTarget:self action:@selector(anistop) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:btnstop];
    
    triView = [[AnimationView alloc] initWithFrame:CGRectMake(0, 400, 200,200)];
    triView.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:triView];
    //[triView test];
    
    //[triView ]
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void) anistart
{
    [triView test];
}

- (void) anistop
{
    [triView stop];
}

#if 0
#pragma mark === 永久闪烁的动画 ======

-(CABasicAnimation *)opacityForever_Animation:( float )time

{
 
    CABasicAnimation *animation = [CABasicAnimationanimationWithKeyPath : @"opacity"]; // 必须写 opacity 才行。
    
    animation. fromValue = [ NSNumbernumberWithFloat : 1.0f ];
    
    animation. toValue = [ NSNumbernumberWithFloat : 0.0f ]; // 这是透明度。
    
    animation. autoreverses = YES ;
    
    animation. duration = time;
    
    animation. repeatCount = MAXFLOAT ;
    
    animation. removedOnCompletion = NO ;
    
    animation. fillMode = kCAFillModeForwards ;
    
    animation. timingFunction =[ CAMediaTimingFunctionfunctionWithName : kCAMediaTimingFunctionEaseIn ]; /// 没有的话是均匀的动画。
    
    return animation;
 
   
}
#endif
@end
