//
//  Person.h
//  OCLearn
//
//  Created by hxl on 16/4/13.
//  Copyright © 2016年 hxl. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject
@property NSString* name;
@property NSInteger age;

-(id)initWithName:(NSString*)n withAge:(NSInteger)a;
-(void) print;

@end
