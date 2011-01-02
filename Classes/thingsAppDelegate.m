//
//  thingsAppDelegate.m
//  things
//
//  Created by Michael Johann on 01.01.11.
//  Copyright 2011 rails-experts.com. All rights reserved.
//

#import "thingsAppDelegate.h"

#import "RootViewController.h"

@implementation thingsAppDelegate


@synthesize window;

@synthesize navigationController;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    // Override point for customization after application launch.
    // Add the navigation controller's view to the window and display.
    [window addSubview:navigationController.view];
    [window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillTerminate:(UIApplication *)application {


}

- (void)dealloc {

    [window release];
    [navigationController release];
    [super dealloc];
}
@end
