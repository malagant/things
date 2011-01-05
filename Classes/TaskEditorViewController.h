//
//  TaskEditorViewController.h
//  things
//
//  Created by Michael Johann on 03.01.11.
//  Copyright 2011 rails-experts.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UICheckBoxTextEditTableViewCell.h"

@interface TaskEditorViewController : UITableViewController {
    UICheckBoxTextEditTableViewCell *cbTaskField;
    BOOL detailsActive;
}

-(void)showTargetFolders;
-(void)showDetailsCells;

@property (nonatomic, assign) BOOL detailsActive;

@end
