//
//  TargetFoldersViewController.h
//  things
//
//  Created by Michael Johann on 05.01.11.
//  Copyright 2011 rails-experts.com. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface TargetFoldersViewController : UITableViewController {
    NSIndexPath *selectedTargetFolder;
}

@property (nonatomic, retain) NSIndexPath *selectedTargetFolder;

@end
