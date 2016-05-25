//
//  main.m
//  RegexTest
//
//  Created by hxl on 16/5/17.
//  Copyright © 2016年 hxl. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        NSString* str=@"abc23424";
        NSError *error = NULL;
        NSString *pattern=@"[^abc]";
        NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:pattern options:NSRegularExpressionCaseInsensitive error:&error];
        NSTextCheckingResult *result = [regex matchesInString:str options:0 range:NSMakeRange(0, str.length)];
        if(result)
        {NSLog(@"YES");}
        else{
            NSLog(@"NO");
        }
        NSString*str23=[[NSString alloc ]initWithString:@"213"];
        str23=@"asdfa";
        NSLog(@"%@",str23);
    }
    return 0;
}
