//
//  main.m
//  FileOp
//
//  Created by hxl on 16/4/19.
//  Copyright © 2016年 hxl. All rights reserved.
//

#import <Foundation/Foundation.h>
void write2File(NSString*filepath,NSString*strdata,BOOL bappend);
NSString* readFile(NSString *filepath);
NSString* readFile1(NSString *filepath,NSString*strdata);
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        
        NSFileManager *fileManager = [NSFileManager defaultManager];
        //fileManager
        NSArray *filePaths = NSSearchPathForDirectoriesInDomains(NSDocumentationDirectory, NSUserDomainMask, YES);
        NSString *docPath = [filePaths objectAtIndex:0];
        NSLog(@"%@",filePaths);
        NSLog(@"%@",docPath);
        NSString *myfilepath= [docPath stringByAppendingPathComponent:@"1.txt"];
        
       // write2File(myfilepath, @"Hello World", true);
        NSLog(@"%@",readFile(myfilepath));
    }
    return 0;
}
NSString* readFile(NSString *filepath)
{
    
    NSData *readData = [NSData dataWithContentsOfFile:filepath];
    NSString* strdata = [[NSString alloc]initWithData:readData encoding:NSUTF8StringEncoding];
    return strdata;
}
NSString* readFile1(NSString *filepath,NSString*strdata)
{
    NSData *readData = [NSData dataWithContentsOfFile:filepath];
    strdata = [[NSString alloc]initWithData:readData encoding:NSUTF8StringEncoding];
    return strdata;
}
void write2File(NSString*filepath,NSString*strdata,BOOL bappend)
{
    NSData * data = [strdata dataUsingEncoding:NSUTF8StringEncoding]; //NSString转换成NSData类型
    [data writeToFile:filepath atomically:YES];
}
