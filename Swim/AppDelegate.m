//
//  AppDelegate.m
//  Swim
//
//  Created by Madept on 21/11/12.
//  Copyright (c) 2012 Madept. All rights reserved.
//

#import "AppDelegate.h"

#import "ViewController.h"

@implementation AppDelegate
//@synthesize _session;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        
        CGSize result = [[UIScreen mainScreen] bounds].size;
        if(result.height == 480)
        {
            self.viewController = [[ViewController alloc] initWithNibName:@"ViewController_iPhone" bundle:nil];
        }
        if(result.height == 568)
        {
           self.viewController = [[ViewController alloc] initWithNibName:@"ViewController_iPhone5" bundle:nil];
        }
        
    } else {
        self.viewController = [[ViewController alloc] initWithNibName:@"ViewController_iPad" bundle:nil];
    }
    
     NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    if (![defaults objectForKey:@"appLounchDate"]) {
        
        [defaults setObject:@"appStartedbefore" forKey:@"appLounchDate"];
       NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"dd.MM.yyyy"];
        
        NSString *currentDate = [formatter stringFromDate:[NSDate date]];
        [defaults setObject:currentDate forKey:@"applicationLounchDate"];
        [defaults setObject:@"TT" forKey:@"traing1complete"];
        [defaults setObject:@"TT" forKey:@"traing2complete"];
        [defaults setObject:@"TT" forKey:@"traing3complete"];
        [defaults setObject:@"TT" forKey:@"traing4complete"];
        [defaults setObject:@"TT" forKey:@"traing5complete"];
        [defaults setObject:@"TT" forKey:@"traing6complete"];
        [defaults setObject:@"TT" forKey:@"traing7complete"];
        [defaults setObject:@"TT" forKey:@"traing8complete"];
        [defaults setObject:@"TT" forKey:@"traing9complete"];
        [defaults setObject:@"TT" forKey:@"traing10complete"];
        [defaults setObject:@"TT" forKey:@"traing11complete"];
        [defaults setObject:@"TT" forKey:@"traing12complete"];
        [defaults setObject:@"TT" forKey:@"traing13complete"];
        [defaults setObject:@"TT" forKey:@"traing14complete"];
        [defaults setObject:@"TT" forKey:@"traing15complete"];
        [defaults setObject:@"TT" forKey:@"traing16complete"];
        [defaults setObject:@"TT" forKey:@"traing17complete"];
        [defaults setObject:@"TT" forKey:@"traing18complete"];
        [defaults synchronize];
        NSLog(@"%@", [defaults objectForKey:@"applicationLounchDate"]);
    }
    // NSLog(@"%@", [defaults objectForKey:@"appLounchDate"]);
    self.window.rootViewController = self.viewController;
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
