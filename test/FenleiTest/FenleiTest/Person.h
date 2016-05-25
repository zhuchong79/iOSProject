//
//  Person.h
//  FenleiTest
//
//  Created by hxl on 16/5/4.
//  Copyright © 2016年 hxl. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject
{
    NSString *name;
    NSInteger age;
}
//@property (nonatomic)NSString *name;
//@property (nonatomic)NSInteger age;
-(id) initWithName:(NSString*)n withAge:(NSInteger)a;
-(NSString *)description;
@end
@interface Person (SSS)

@end