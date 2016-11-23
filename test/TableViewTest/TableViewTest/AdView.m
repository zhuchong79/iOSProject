//
//  AdView.m
//  TableViewTest
//
//  Created by hxl on 16/6/30.
//  Copyright © 2016年 hxl. All rights reserved.
//

#import "AdView.h"
@interface AdView ()
{
    UIImageView *imgView;
    UILabel     *titleLabel;
    UILabel     *contentLabel;
}
@end

@implementation AdView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    UIImage *image = [UIImage imageNamed:@"img1"];
    [image drawAtPoint:CGPointMake(0 , 0)];

}


@end
