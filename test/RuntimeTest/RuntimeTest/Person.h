//
//  Person.h
//  RuntimeTest
//
//  Created by hxl on 16/6/24.
//  Copyright © 2016年 hxl. All rights reserved.
//

#import "Biology.h"

@interface Person : Biology
{
    NSString * father;
}
@property (nonatomic,copy)NSString * name;
@property (nonatomic,assign)NSInteger age;

@end
