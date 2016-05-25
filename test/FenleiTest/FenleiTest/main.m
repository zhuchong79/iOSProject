//
//  main.m
//  FenleiTest
//
//  Created by hxl on 16/5/4.
//  Copyright © 2016年 hxl. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#include "SSS.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        Person *p = [[Person alloc]initWithName:@"hxl" withAge:28];
       // NSLog(@"%@",p);
        [p print];
    }
    return 0;
}
