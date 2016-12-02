//
//  AppDelegate.m
//  Hav4i
//
//  Created by Avaz on 20.10.16.
//  Copyright © 2016 Avaz Abdrasulov. All rights reserved.
//

#import "AppDelegate.h"
#import <Fabric/Fabric.h>
#import <DigitsKit/DigitsKit.h>
#import <Quickblox/Quickblox.h>

const NSUInteger kApplicationID = 48638;
NSString *const kAuthKey        = @"YhhyqYNzTj-GHqB";
NSString *const kAuthSecret     = @"Rpgwdx5DAte8Tt5";
NSString *const kAccountKey     = @"JBqEzLTu9j4UEpXFpes2";

static NSString* const keyUserProfil = @"profilUserDefaults";

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [[UIApplication sharedApplication] registerUserNotificationSettings:[UIUserNotificationSettings settingsForTypes:(UIUserNotificationTypeSound | UIUserNotificationTypeAlert | UIUserNotificationTypeBadge) categories:nil]];
    
    [[UIApplication sharedApplication] registerForRemoteNotifications];
    [Fabric with:@[[Digits class]]];
    [QBSettings setApplicationID:kApplicationID];
    [QBSettings setAuthKey:kAuthKey];
    [QBSettings setAuthSecret:kAuthSecret];
    [QBSettings setAccountKey:kAccountKey];
    
    if ([[QBSession currentSession] currentUser]) {
        NSData* eventData = [[NSUserDefaults standardUserDefaults] objectForKey:keyUserProfil];
        self.window = [[UIWindow alloc] initWithFrame:UIScreen.mainScreen.bounds];
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        UIViewController *viewController;
        if (eventData) {
            viewController = [storyboard instantiateViewControllerWithIdentifier:@"tabBarViewController"];
            
        } else {
            
            viewController =
            [storyboard instantiateViewControllerWithIdentifier:@"SignInViewController"];
            
        }
        self.window.rootViewController = viewController;
        [self.window makeKeyAndVisible];
    } else {
        [[Digits sharedInstance] logOut];
    }
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
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
