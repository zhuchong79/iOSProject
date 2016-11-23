//
//  main.m
//  NSUserDefaultsTest
//
//  Created by hxl on 16/5/26.
//  Copyright © 2016年 hxl. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        NSUserDefaults *userada=[NSUserDefaults standardUserDefaults];
       // [userada setObject:@"1213" forKey:@"key1"];
        //[userada synchronize];
        NSLog(@"%@",[userada valueForKey:@"key1"]);
    }
    return 0;
}
