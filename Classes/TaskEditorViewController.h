//
//  TaskEditorViewController.h
//  things
//
//  Created by Michael Johann on 03.01.11.
//  Copyright 2011 rails-experts.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TaskEditorViewController : UITableViewController {
    UIButton *checkBox;
    UITextField *textEntry; 
}

@property (nonatomic, retain, readonly) UIButton *checkBox;
@property (nonatomic, retain, readonly) UITextField *textEntry;

- (IBAction)changeSelected:(id)sender;
@end
