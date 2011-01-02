//
//  thingsAppDelegate.h
//  things
//
//  Created by Michael Johann on 01.01.11.
//  Copyright 2011 rails-experts.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface thingsAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    UINavigationController *navigationController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UINavigationController *navigationController;

@end
