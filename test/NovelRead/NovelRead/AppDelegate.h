//
//  AppDelegate.h
//  NovelRead
//
//  Created by hxl on 2016/11/2.
//  Copyright © 2016年 com.hxl.novelread. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

