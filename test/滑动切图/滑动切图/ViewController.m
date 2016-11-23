//
//  ViewController.m
//  滑动切图
//
//  Created by hxl on 16/6/27.
//  Copyright © 2016年 hxl. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
   // UIImageView* myimageview;
    NSMutableArray *imgArray;
    CGPoint FirstPoint;
    CGPoint SecondPoint;
    NSInteger Page;
    BOOL touchMove;
}
@property (retain, nonatomic)  UIImageView* myimageview;
@property (retain, nonatomic)  NSMutableArray *imgArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    imgArray = [[NSMutableArray alloc] initWithObjects:
                [UIImage imageNamed:@"img1.jpg"],
                [UIImage imageNamed:@"img2.jpg"],
                [UIImage imageNamed:@"img3.jpg"],
                nil];
    self.navigationItem.title = [NSString stringWithFormat:@"1/%d",[imgArray count]];
    self.myimageview = [[UIImageView alloc] initWithFrame:CGRectMake(0, 44,768, 1004)];
    self.myimageview.layer.masksToBounds = YES;
    self.myimageview.contentMode = UIViewContentModeScaleAspectFit;
    [self.myimageview setImage:[imgArray objectAtIndex:Page]];
    
    [self.view addSubview:self.myimageview ];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
/*=======================================================
 //触摸事件：点击弹出导航条，左右划动切换经文
 ========================================================*/
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [[event allTouches] anyObject];
    CGPoint point = [touch locationInView:self.view];
    FirstPoint = point;
    touchMove = NO;
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self.view];
    SecondPoint = point;
    touchMove = YES;
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    
    if(touchMove == NO)
    {
    }else
    {
        if (FirstPoint.x > SecondPoint.x)
        {
            if(Page < [imgArray count] - 1)
            {
                Page++;
                CGContextRef context = UIGraphicsGetCurrentContext();
                [UIView beginAnimations:nil context:context];
                [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
                [self.myimageview  setAlpha:0.0];
                [UIView setAnimationDuration:0.05];
                [UIView commitAnimations];
                [self performSelector:@selector(ChangeImage) withObject:nil afterDelay:0.1];
            }else if (Page == [imgArray count] -1) {
                CGContextRef context = UIGraphicsGetCurrentContext();
                [UIView beginAnimations:nil context:context];
                [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
                [self.myimageview  setAlpha:0.0];
                [UIView setAnimationDuration:0.05];
                [UIView commitAnimations];
                Page = 0;
                [self performSelector:@selector(ChangeImage) withObject:nil afterDelay:0.1];
            }
        }else {
            if(Page >= 1)
            {
                Page--;
                CGContextRef context = UIGraphicsGetCurrentContext();
                [UIView beginAnimations:nil context:context];
                [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
                [self.myimageview  setAlpha:0.0];
                [UIView setAnimationDuration:0.05];
                [UIView commitAnimations];
                [self performSelector:@selector(ChangeImage) withObject:nil afterDelay:0.1];
            }
        }
    }
}


/*=======================================================
 更新图片显示
 ========================================================*/
-(void)ChangeImage{
    CGContextRef context = UIGraphicsGetCurrentContext();
    [UIView beginAnimations:nil context:context];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [UIView setAnimationDuration:0.5]; //动画长度，单位为秒
    [self.view setAlpha:1];
    [self.myimageview  setAlpha:1];
    [self.myimageview  setImage:[imgArray objectAtIndex:Page]];
    //[myimageview setAnimationRepeatCount:4]; //设置重复次数
    [UIView commitAnimations];
    self.navigationItem.title = [NSString stringWithFormat:@"%d/%d",Page+1,[imgArray count]];
}


@end
