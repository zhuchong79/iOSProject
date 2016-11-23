//
//  KCStatusTableViewCell.h
//  TableViewTest
//
//  Created by hxl on 16/6/29.
//  Copyright © 2016年 hxl. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KCStatus.h"
@interface KCStatusTableViewCell : UITableViewCell
#pragma mark 微博对象
@property (nonatomic,strong) KCStatus *status;

#pragma mark 单元格高度
@property (assign,nonatomic) CGFloat height;
@end
