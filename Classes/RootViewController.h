//
//  RootViewController.h
//  things
//
//  Created by Michael Johann on 01.01.11.
//  Copyright 2011 rails-experts.com. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <CoreData/CoreData.h>

#import "ListMenu.h"

@interface RootViewController : UITableViewController {
    ListMenu *mainMenu;
}


@property (nonatomic, retain) ListMenu *mainMenu;

@end
