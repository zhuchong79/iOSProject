//
//  MyTableViewCell.m
//  TableViewTest
//
//  Created by hxl on 16/6/29.
//  Copyright © 2016年 hxl. All rights reserved.
//

#import "MyTableViewCell.h"
#import "AdView.h"
@interface MyTableViewCell ()
{
    UIImageView *img1;
    UIImageView * img2;
    UIImageView * img3;
    AdView      *adview;
}
@end

@implementation MyTableViewCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self initSubView];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)initSubView
{
    NSLog(@"%f,%f",[UIScreen mainScreen].bounds.size.width , [UIScreen mainScreen].bounds.size.height);
    adview = [[AdView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 100)];
    [self.contentView addSubview:adview];
    
    img1 = [[UIImageView alloc]initWithFrame:CGRectMake(0,[UIScreen mainScreen].bounds.size.width/3,[UIScreen mainScreen].bounds.size.width/3,[UIScreen mainScreen].bounds.size.width/3)];
    img1.image = [UIImage imageNamed:@"img1"];
    [self.contentView addSubview:img1];
    
    
    img2 = [[UIImageView alloc]initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width/3,[UIScreen mainScreen].bounds.size.width/3,[UIScreen mainScreen].bounds.size.width/3,[UIScreen mainScreen].bounds.size.width/3)];
    img2.image = [UIImage imageNamed:@"img2"];
    [self.contentView addSubview:img2];
    
    img3 = [[UIImageView alloc]initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width*2/3,[UIScreen mainScreen].bounds.size.width/3,[UIScreen mainScreen].bounds.size.width/3,[UIScreen mainScreen].bounds.size.width/3)];
    img3.image = [UIImage imageNamed:@"timg"];
    [self.contentView addSubview:img3];

}
//可以设置框架内容
- (void)setFrame:(CGRect)frame {
   // frame.origin.x += 25;
   // frame.size.width -=2 * 25;
    [super setFrame:frame];
}
@end
