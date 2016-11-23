//
//  AnimationView.m
//  AnimationTest
//
//  Created by hxl on 16/6/22.
//  Copyright © 2016年 hxl. All rights reserved.
//

#import "AnimationView.h"

@implementation AnimationView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(void)test
{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationWillStartSelector:@selector(animationDidStart:)];
    [UIView setAnimationDidStopSelector:@selector(animationDidStop:finished:)];
    [UIView setAnimationRepeatAutoreverses:YES];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDelay:0.0f];
    [UIView setAnimationDuration:3.0f];
    [UIView setAnimationRepeatAutoreverses:YES];
    [UIView setAnimationRepeatCount:MAXFLOAT];
    
    self.alpha = 0.0f;
    [UIView commitAnimations];

}
-(void)stop
{
    self.alpha = 1.0f;
    //[UIView setAnimationRepeatAutoreverses:NO];
}
-(void)drawRect:(CGRect)rect
{

    UIBezierPath* path = [[ UIBezierPath alloc]init];
    [path moveToPoint:CGPointMake(50,50)];
    [path addLineToPoint:CGPointMake(160,150)];
    [path addLineToPoint:CGPointMake(10,150)];
    
    //关闭path
    [path closePath];
    
    
    //三角形内填充绿色
    [[UIColor greenColor] setFill];
    [path fill];
    
    //三角形的边框红色
    [[UIColor redColor] setStroke];
    [path stroke];
    
    //在DrawRect方法中使用NSAttributedString画文字
    NSAttributedString *attrString = [[NSAttributedString alloc] initWithString:@"this is my triangle"];
    [attrString drawAtPoint:CGPointMake(150, 150)];
    
    //在DrawRect方法中画图片
    UIImage *image = [UIImage imageNamed:@"image1"];
    [image drawAtPoint:CGPointMake(150, 180)];
    
}

-(void)animate
{
    //[(UIView)self beginAnimations:nil context:nil];
    

}
-(void)animationDidStart:(CAAnimation *)anim
{
    NSLog(@"animation is start ...");
}

-(void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    NSLog(@"animation is over ...");
}
@end
