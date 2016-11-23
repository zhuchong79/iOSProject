//
//  MyTextView.m
//  UrlLabel
//
//  Created by hxl on 16/8/11.
//  Copyright © 2016年 hxl. All rights reserved.
//

#import "EFSTextView.h"

@implementation EFSTextView
-(BOOL)canPerformAction:(SEL)action withSender:(id)sender
{
    
    if(action ==@selector(copy:) ||
       
       action ==@selector(selectAll:)||
       
       //action ==@selector(cut:)||
       
       action ==@selector(select:)
       
       //action ==@selector(paste:)
       )
    {
        
        return YES;//return[super canPerformAction:action withSender:sender];//
        
    }
    
    return NO;
    
}

@end
