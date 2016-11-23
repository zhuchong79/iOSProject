//
//  AnimateViewController.m
//  AnimationTest
//
//  Created by hxl on 16/6/22.
//  Copyright © 2016年 hxl. All rights reserved.
//

#import "AnimateViewController.h"
//
//  ViewController.m
//  CABasicAnimationDemo
//
//  Created by haotian on 14-6-13.
//  Copyright (c) 2014年 Baseus. All rights reserved.
//

#import "ViewController.h"

@interface AnimateViewController ()
@property (strong, nonatomic) UIView *ViewTest;
@end

@implementation AnimateViewController
@synthesize ViewTest;
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.ViewTest.backgroundColor = [UIColor redColor];
    //组合动画调用
    [self startAnimation2];
    
    //永久闪烁动画
    [self opacityForever_Animation:1.0];
    
    ////有闪烁次数的动画
    //[self opacityTimes_Animation:10 durTimes:0.3];
    
    //画一条线	路径
    [self drawACurvedLine];
    
    //路径动画
    //[self animateCicleAlongPath];
    
}

-(void)startAnimation
{
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"position"];
    animation.fromValue = [NSValue valueWithCGPoint:CGPointMake(50, 50)];
    animation.toValue = [NSValue valueWithCGPoint:CGPointMake(300, 300)];
    animation.duration = 3.0f;
    animation.repeatCount = 1;
    //animation.removedOnCompletion = NO; //完成后是否回到原来状态，如果为NO 就是停留在动画结束时的状态
    //animation.fillMode = kCAFillModeRemoved;//动画完成后返回到原来状态
    //animation.fillMode = kCAFillModeBackwards;
    animation.fillMode = kCAFillModeForwards;//当动画完成时，保留在动画结束的状态
    
    [self.ViewTest.layer addAnimation:animation forKey:nil];
}

-(void)startAnimation1
{
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.translation.y"];
    animation.fromValue = [NSNumber numberWithFloat:0.0f];
    animation.toValue   = [NSNumber numberWithFloat:10.0f];
    //animation.duration = 0.5f;
    //animation.fillMode = kCAFillModeForwards;
    //animation.removedOnCompletion = NO;
    //animation.repeatCount = 2;
    //[self.ViewTest.layer addAnimation:animation forKey:nil];
    
    CABasicAnimation *animation1 = [CABasicAnimation animationWithKeyPath:@"transform.translation.x"];
    animation.fromValue = [NSNumber numberWithFloat:0.0f];
    animation.toValue   = [NSNumber numberWithFloat:10.0f];
    //animation.duration = 0.5f;
    //animation.fillMode = kCAFillModeForwards;
    //animation.removedOnCompletion = NO;
    //animation.repeatCount = 2;
    //[self.ViewTest.layer addAnimation:animation1 forKey:nil];
    
    CAAnimationGroup *groupAnimation = [CAAnimationGroup animation];
    groupAnimation.duration = 2.0f;
    groupAnimation.autoreverses  = YES;
    groupAnimation.repeatCount = 5;
    [groupAnimation setAnimations:[NSArray arrayWithObjects:animation,animation1, nil]];
    
    [self.ViewTest.layer addAnimation:groupAnimation forKey:nil];
}

//组合动画
-(void)startAnimation2
{
    //界限
    CABasicAnimation *boundsAnimation = [CABasicAnimation animationWithKeyPath:@"bounds"];
    boundsAnimation.fromValue = [NSValue valueWithCGRect: self.ViewTest.bounds];
    boundsAnimation.toValue = [NSValue valueWithCGRect:CGRectZero];
    //透明度变化
    CABasicAnimation *opacityAnimation = [CABasicAnimation animationWithKeyPath:@"opacity"];
    opacityAnimation.fromValue = [NSNumber numberWithFloat:1.0];
    opacityAnimation.toValue = [NSNumber numberWithFloat:0.5];
    
    //位置移动
    CABasicAnimation *animation  = [CABasicAnimation animationWithKeyPath:@"position"];
    animation.fromValue =  [NSValue valueWithCGPoint: self.ViewTest.layer.position];
    CGPoint toPoint = self.ViewTest.layer.position;
    toPoint.x += 180;
    animation.toValue = [NSValue valueWithCGPoint:toPoint];
    
    //旋转动画
    CABasicAnimation* rotationAnimation =
    [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];//"z"还可以是“x”“y”，表示沿z轴旋转
    
    rotationAnimation.toValue = [NSNumber numberWithFloat:(2 * M_PI) * 3];
    // 3 is the number of 360 degree rotations
    
    // Make the rotation animation duration slightly less than the other animations to give it the feel
    // that it pauses at its largest scale value
    rotationAnimation.duration = 3.0f;
    rotationAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]; //缓入缓出
    //rotationAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    
    //缩放动画
    CABasicAnimation *scaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    scaleAnimation.fromValue = [NSNumber numberWithFloat:0.0];
    scaleAnimation.toValue = [NSNumber numberWithFloat:1.0];
    scaleAnimation.duration = 3.0f;
    scaleAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    //组合动画
    CAAnimationGroup *animationGroup = [CAAnimationGroup animation];
    animationGroup.duration = 3.0f;
    animationGroup.autoreverses = YES;   //是否重播，原动画的倒播
    animationGroup.repeatCount = NSNotFound;//HUGE_VALF;	 //HUGE_VALF,源自math.h
    [animationGroup setAnimations:[NSArray arrayWithObjects:rotationAnimation, scaleAnimation,boundsAnimation, nil]];
    
    //将上述两个动画编组
    
    [self.ViewTest.layer addAnimation:animationGroup forKey:@"animationGroup"];
}

//永久闪烁的动画
-(void)opacityForever_Animation:(float)time
{
    CABasicAnimation *animation=[CABasicAnimation animationWithKeyPath:@"opacity"];
    animation.fromValue=[NSNumber numberWithFloat:1.0];
    animation.toValue=[NSNumber numberWithFloat:0.0];
    animation.autoreverses=YES;
    animation.duration=time;
    animation.repeatCount=FLT_MAX;
    animation.removedOnCompletion=NO;
    animation.fillMode=kCAFillModeForwards;
    
    [self.ViewTest.layer addAnimation:animation forKey:@"opacityForever"];
}
/**************************************************************************/

//有闪烁次数的动画

-(void)opacityTimes_Animation:(float)repeatTimes durTimes:(float)time;
{
    CABasicAnimation *animation=[CABasicAnimation animationWithKeyPath:@"opacity"];
    animation.fromValue=[NSNumber numberWithFloat:1.0];
    animation.toValue=[NSNumber numberWithFloat:0.4];
    animation.repeatCount=repeatTimes;
    animation.duration=time;
    animation.removedOnCompletion=NO;
    animation.fillMode=kCAFillModeForwards;
    animation.timingFunction=[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    animation.autoreverses=YES;
    
    [self.ViewTest.layer addAnimation:animation forKey:@"opacityTimes"];
    
}
/**************************************************************************/
//路径动画

-(void)keyframeAniamtion:(CGMutablePathRef)path durTimes:(float)time Rep:(float)repeatTimes
{
    
}

//在视图中画一条线
-(void)drawACurvedLine
{
    UIGraphicsBeginImageContext(CGSizeMake(320, 460));
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetLineWidth(context, 3);
    CGContextSetStrokeColorWithColor(context, [UIColor blueColor].CGColor);
    //设置起点
    CGContextMoveToPoint(context, 10, 10);
    
    CGContextAddQuadCurveToPoint(context, 10, 450, 310, 450);
    //CGContextAddQuadCurveToPoint(context, 310, 10, 10, 10);
    
    //划线
    CGContextDrawPath(context, kCGPathStroke);
    
    //得到一个image 从目前的矢量上下文
    UIImage *curve = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    UIImageView *curveView = [[UIImageView alloc]initWithImage:curve];
    curveView.frame = CGRectMake(1, 1, 320, 460);
    [curveView setBackgroundColor:[UIColor clearColor]];
    [self.view addSubview:curveView];
}

-(void)animateCicleAlongPath
{
    //准备关键帧动画
    CAKeyframeAnimation *pathAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    pathAnimation.calculationMode = kCAAnimationPaced;
    pathAnimation.fillMode = kCAFillModeForwards;
    pathAnimation.removedOnCompletion = NO;
    pathAnimation.duration = 5.0f;
    pathAnimation.repeatCount = 200;
    //pathAnimation.autoreverses = YES; //原路返回，而不是从头再来
    //设置动画路径
    //CGPoint endPoint = CGPointMake(310, 450);
    CGMutablePathRef curvedPath = CGPathCreateMutable();
    CGPathMoveToPoint(curvedPath, NULL, 10, 10);
    CGPathAddQuadCurveToPoint(curvedPath, NULL, 10, 450, 310, 450);
    CGPathAddQuadCurveToPoint(curvedPath, NULL, 310, 10, 10, 10);
    //已经有了路径，我们要告诉动画  路径
    pathAnimation.path = curvedPath;
    CGPathRelease(curvedPath);  //这里要手工释放
    
    [self.ViewTest.layer addAnimation:pathAnimation forKey:nil];
    
}
/**************************************************************************/



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end