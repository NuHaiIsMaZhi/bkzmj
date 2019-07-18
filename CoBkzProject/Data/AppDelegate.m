//
//  AppDelegate.m
//  CoBkzProject
//
//  Created by leo on 2018/6/19.
//  Copyright © 2018年 leo. All rights reserved.
//

#import "AppDelegate.h"
#import "BaseTabBarViewController.h"
#import "ViewController.h"
#import "loginViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

//    BOOL islogin = NO;
//    if (!islogin) {
//
//        UINavigationController *nav = [[UINavigationController alloc]init];
//        loginViewController *loginvc = [[loginViewController alloc]init];
//        [nav presentViewController:loginvc animated:YES completion:nil];
//        self.window.rootViewController = loginvc;
//
//    }else{
//
//        [self changeMainVC];
//    }

    [self changeMainVC];

    // Override point for customization after application launch.
    return YES;
}

- (void)changeMainVC{
    
    BaseTabBarViewController *VC = [[BaseTabBarViewController alloc] init];
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:VC];
    self.window.rootViewController = nav;
    
    [nav pushViewController:[[loginViewController alloc]init] animated:NO];
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}
                                                                
- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    //
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
