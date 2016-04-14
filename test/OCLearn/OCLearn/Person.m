//
//  Person.m
//  OCLearn
//
//  Created by hxl on 16/4/13.
//  Copyright © 2016年 hxl. All rights reserved.
//

#import "Person.h"

@implementation Person

@synthesize name;
@synthesize age;

-(id)initWithName:(NSString*)n withAge:(NSInteger)a
{
    self=[super init];
    if (self!=nil) {
        name=n;
        age=a;
    }
    return self;
}
-(void)print
{
    NSLog(@"sdf");
}

#pragma mark - 覆盖description方法使得NSLog输出类成员内容
-(NSString*)description
{
    return [NSString stringWithFormat:@"name=%@,age=%d",name,(int)age];
}
@end
