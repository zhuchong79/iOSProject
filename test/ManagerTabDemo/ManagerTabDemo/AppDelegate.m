//
//  AppDelegate.m
//  ManagerTabDemo
//
//  Created by hxl on 16/6/3.
//  Copyright © 2016年 hxl. All rights reserved.
//

#import "AppDelegate.h"

#import "UIViewController1.h"
#import "UIViewController2.h"
#import "ViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    

    UITabBarController *tabCtrl= [[UITabBarController alloc]init];
    
    
    UIViewController1*viewctrl1=[[UIViewController1 alloc]init];
    //viewctrl1.view.backgroundColor=[UIColor yellowColor];
    viewctrl1.navigationItem.title=@"da1";
    UINavigationController *navCtrl1=[[UINavigationController alloc]initWithRootViewController:viewctrl1];
    navCtrl1.tabBarItem=[[UITabBarItem alloc]initWithTitle:@"图1" image:[UIImage imageNamed:@"liveTV_icon_selected"] tag:0];

    UIViewController2*viewctrl2=[[UIViewController2 alloc]init];
    viewctrl2.view.backgroundColor=[UIColor redColor];
    viewctrl2.navigationItem.title=@"da2";
    UINavigationController *navCtrl2=[[UINavigationController alloc]initWithRootViewController:viewctrl2];
    //navCtrl2.title=@"title2";
    navCtrl2.tabBarItem=[[UITabBarItem alloc]initWithTitle:@"图2" image:[UIImage imageNamed:@"liveTV_icon_selected"] tag:1];
    
    ViewController*viewctrl3= [[ViewController alloc]init];
    viewctrl3.navigationItem.title=@"da3";
    UINavigationController *navCtrl3=[[UIStoryboard storyboardWithName:@"Main" bundle:nil]instantiateInitialViewController];
    
    navCtrl3.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"图3" image:[UIImage imageNamed:@"liveTV_icon_selected"] tag:1];
    
/*
    CGRect bounds = [[UIScreen mainScreen]applicationFrame];
    UIWebView* webView = [[UIWebView alloc]initWithFrame:bounds];
   // UIWebView *webView = [[UIWebView alloc]initWithFrame:];
    UIViewController *viewctrl= [[UIViewController alloc] init];
    [viewctrl.view addSubview:webView];
    webView.scalesPageToFit = YES;
    NSURLRequest *url= [[NSURLRequest alloc]initWithURL:[[NSURL alloc]initWithString:@"https://www.baidu.com"]];
    [webView loadRequest:url];
    
    UINavigationController *navCtrl4=[[UINavigationController alloc]initWithRootViewController:viewctrl];
    navCtrl4.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"图4" image:[UIImage imageNamed:@"liveTV_icon_selected"] tag:1];
  */
    tabCtrl.viewControllers=@[navCtrl1,navCtrl2,navCtrl3];
    self.window.rootViewController = tabCtrl;
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    // Saves changes in the application's managed object context before the application terminates.
    [self saveContext];
}

#pragma mark - Core Data stack

@synthesize managedObjectContext = _managedObjectContext;
@synthesize managedObjectModel = _managedObjectModel;
@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;

- (NSURL *)applicationDocumentsDirectory {
    // The directory the application uses to store the Core Data store file. This code uses a directory named "hxl.ManagerTabDemo" in the application's documents directory.
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

- (NSManagedObjectModel *)managedObjectModel {
    // The managed object model for the application. It is a fatal error for the application not to be able to find and load its model.
    if (_managedObjectModel != nil) {
        return _managedObjectModel;
    }
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"ManagerTabDemo" withExtension:@"momd"];
    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return _managedObjectModel;
}

- (NSPersistentStoreCoordinator *)persistentStoreCoordinator {
    // The persistent store coordinator for the application. This implementation creates and returns a coordinator, having added the store for the application to it.
    if (_persistentStoreCoordinator != nil) {
        return _persistentStoreCoordinator;
    }
    
    // Create the coordinator and store
    
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"ManagerTabDemo.sqlite"];
    NSError *error = nil;
    NSString *failureReason = @"There was an error creating or loading the application's saved data.";
    if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
        // Report any error we got.
        NSMutableDictionary *dict = [NSMutableDictionary dictionary];
        dict[NSLocalizedDescriptionKey] = @"Failed to initialize the application's saved data";
        dict[NSLocalizedFailureReasonErrorKey] = failureReason;
        dict[NSUnderlyingErrorKey] = error;
        error = [NSError errorWithDomain:@"YOUR_ERROR_DOMAIN" code:9999 userInfo:dict];
        // Replace this with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
    
    return _persistentStoreCoordinator;
}


- (NSManagedObjectContext *)managedObjectContext {
    // Returns the managed object context for the application (which is already bound to the persistent store coordinator for the application.)
    if (_managedObjectContext != nil) {
        return _managedObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (!coordinator) {
        return nil;
    }
    _managedObjectContext = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];
    [_managedObjectContext setPersistentStoreCoordinator:coordinator];
    return _managedObjectContext;
}

#pragma mark - Core Data Saving support

- (void)saveContext {
    NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
    if (managedObjectContext != nil) {
        NSError *error = nil;
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error]) {
            // Replace this implementation with code to handle the error appropriately.
            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }
    }
}

@end
