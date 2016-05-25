//
//  AppDelegate.h
//  frdf
//
//  Created by hxl on 16/4/19.
//  Copyright © 2016年 hxl. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
@class ViewController;
@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

@property (strong,nonatomic) ViewController *viewController;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;


@end

