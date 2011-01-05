//
//  UICheckBoxTextEditTableViewCell.h
//  things
//
//  Created by Michael Johann on 05.01.11.
//  Copyright 2011 rails-experts.com. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface UICheckBoxTextEditTableViewCell : UITableViewCell {
    UITextField *textField;
    UIButton *checkBox;
}

@property (nonatomic, retain, readonly) UIButton *checkBox;
@property (nonatomic, retain, readonly) UITextField *textField;

-(IBAction)changeSelected:(id)sender;

@end
