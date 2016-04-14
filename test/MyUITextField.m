//
//  MyUITextField.m
//  
//
//  Created by hxl on 16/4/12.
//
//

#import "MyUITextField.h"

@implementation MyUITextField

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(id)initWithTextColor:(UIColor*)textcolor withBackgroudColor:(UIColor*)backgrndcolor
{
    //[super initWithCoder:nil];
    self.backgroundColor=backgrndcolor;
    self.textColor = textcolor;
    return self;
}
@end
