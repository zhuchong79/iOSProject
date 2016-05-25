//
//  Person.m
//  FenleiTest
//
//  Created by hxl on 16/5/4.
//  Copyright © 2016年 hxl. All rights reserved.
//

#import "Person.h"

@implementation Person

-(id) initWithName:(NSString*)n withAge:(NSInteger)a
{
    self = [super init];
    if (self != nil) {
        name=n;
        age=a;
    }
    return  self;
}
-(NSString *) description
{
    NSString *str=[[NSString alloc]initWithFormat:@"name:%@,age:%d",name,(int)age ];
    return str;
}
@end
