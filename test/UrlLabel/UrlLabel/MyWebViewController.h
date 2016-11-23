//
//  MyWebViewController.h
//  UrlLabel
//
//  Created by hxl on 16/8/11.
//  Copyright © 2016年 hxl. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyWebViewController : UIViewController
@property (nonatomic,copy) NSString*url;
-(instancetype)initWithUrl:(NSString*)url;
@end
