//
//  ExtendNSLogFunctionality.h
//  PrefixSetTest
//
//  Created by hxl on 16/4/12.
//  Copyright © 2016年 hxl. All rights reserved.
//

#ifndef ExtendNSLogFunctionality_h
#define ExtendNSLogFunctionality_h

#ifdef DEBUG
#define NSLog(args...)  ExtendNSLog(__FILE__,__LINE__,__PRETTY_FUNCTION__,args);
#else
#define NSLog(x...)
#endif

void   ExtendNSLog(const char *file, int lineNumber, const char *functionName, NSString *format, ...);

#endif /* ExtendNSLogFunctionality_h */
