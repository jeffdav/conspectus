//
//  CTAppDelegate.m
//  ConspectusTest
//
//  Created by Jeffrey Davis on 6/28/14.
//  Copyright (c) 2014 Jeff Davis. All rights reserved.
//

#import "CTAppDelegate.h"

#import "CTViewController.h"

@implementation CTAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    CTViewController *viewController = [[CTViewController alloc] init];
    viewController.title = @"Conspectus Test";

    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:viewController];
    self.navigationController = navController;

    UIWindow *window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    window.rootViewController = navController;
    [window makeKeyAndVisible];
    self.window = window;

    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application {
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
}

- (void)applicationWillTerminate:(UIApplication *)application {
}

@end
