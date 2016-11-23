//
//  TableViewCell.m
//  WidgetApp
//
//  Created by hxl on 2016/10/24.
//  Copyright © 2016年 com.hxl.test. All rights reserved.
//

#import "TableViewCell.h"
@interface TableViewCell()
@property (weak, nonatomic) IBOutlet UILabel *testLabel;
@property (weak, nonatomic) IBOutlet UIButton *testBtn;

@end
@implementation TableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(void) setConfig:(NSString *)data
{
    _testLabel.text=data;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
