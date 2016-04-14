//
//  main.m
//  OCLearn
//
//  Created by hxl on 16/4/13.
//  Copyright © 2016年 hxl. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        Person *p = [[Person alloc]initWithName:@"xhl" withAge:28];
        [p performSelector:@selector(print)];
        [p performSelector:NSSelectorFromString(@"print")];
        
        NSLog(@"%@",p);
        
        {
            int outA=8;
            int (^myPtr)(int)=^(int a){return outA+a;};
        
            outA=5;
        int result= myPtr(3);
        NSLog(@"%d",result);
            NSLog(@"%@",NSUserName());
        }
    }
    return 0;
}
