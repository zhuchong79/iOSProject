//
//  AppDelegate.h
//  WidgetApp
//
//  Created by hxl on 2016/10/24.
//  Copyright © 2016年 com.hxl.test. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

