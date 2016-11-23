//
//  UrlLabel.m
//  UrlLabel
//
//  Created by hxl on 16/8/8.
//  Copyright © 2016年 hxl. All rights reserved.
//

#import "UrlLabel.h"

CGFloat fontSize = 17;

@interface UrlLabel ()
@property (nonatomic, copy) NSMutableArray* urlContent;
@property (nonatomic, copy) NSMutableArray* urlRect;
//@property (nonatomic, copy) NSMutableArray* urlRange;
@end

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
@implementation UrlLabel
-(void)setText:(NSString *)text
{
    
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:text];
    [attributedString addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:fontSize] range:NSMakeRange(0, attributedString.length)];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.minimumLineHeight = 22.5;
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, attributedString.length)];
    
    NSError *error;
    NSString *regulaStr = @"((http[s]{0,1}|ftp)://[a-zA-Z0-9\\.\\-]+\\.([a-zA-Z]{2,4})(:\\d+)?(/[a-zA-Z0-9\\.\\-~!@#$%^&*+?:_/=<>]*)?)|(www.[a-zA-Z0-9\\.\\-]+\\.([a-zA-Z]{2,4})(:\\d+)?(/[a-zA-Z0-9\\.\\-~!@#$%^&*+?:_/=<>]*)?)";
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:regulaStr
                                                                           options:NSRegularExpressionCaseInsensitive
                                                                             error:&error];
    NSArray *arrayOfAllMatches = [regex matchesInString:text options:0 range:NSMakeRange(0, text.length)];
    
    for (NSTextCheckingResult *match in arrayOfAllMatches)
    {
        NSString* substringForMatch = [text substringWithRange:match.range];
        [attributedString addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:match.range];
        [_urlContent addObject:substringForMatch];
        //[_urlRange addObject:match.range];
        NSLog(@"substringForMatch %@",substringForMatch);
    }
    self.attributedText = attributedString;
    self.userInteractionEnabled = YES;
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    NSLog(@"myLabel touch");
    [self.nextResponder touchesBegan:touches withEvent:event];  // 接受到事件后继续向上传递事件
    UITouch *touch = [touches anyObject];
    CGPoint pt = [touch locationInView:self];
    NSLog(@"%@",pt);
}
@end
