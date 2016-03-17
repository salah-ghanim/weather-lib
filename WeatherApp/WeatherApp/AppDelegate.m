//
//  AppDelegate.m
//  WeatherApp
//
//  Created by SalahAldin Ghanim on 3/16/16.
//  Copyright © 2016 Salah. All rights reserved.
//

#import "AppDelegate.h"
#import <WeatherLib/WeatherLib.h>

@interface AppDelegate () <UISplitViewControllerDelegate>
- (void) connectivityChanged:(BOOL) connected;
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.

    [[SAWeather sharedInstance] initWithKey:@"5c99918d76690c903162ac52d570be05"];
    

    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    [[SAWeather sharedInstance] removeObserver:self forKeyPath:@"serviceAvailable"];

}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    [[SAWeather sharedInstance] addObserver:self forKeyPath:@"serviceAvailable" options:NSKeyValueObservingOptionNew context:nil];
    [self connectivityChanged:[[SAWeather sharedInstance] serviceAvailable]];

}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    [[SAWeather sharedInstance] removeObserver:self forKeyPath:@"serviceAvailable"];

}
- (void) connectivityChanged:(BOOL) connected
{
    if (connected){
        NSLog(@"CONNECTED");
    } else {
        NSLog(@"DISCONNECTED");
    }
}


- (void) observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context
{
    NSNumber * value = [change valueForKey:NSKeyValueChangeNewKey];
    [self connectivityChanged:[value boolValue]];
}

@end
