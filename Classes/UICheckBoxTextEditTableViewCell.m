//
//  UICheckBoxTextEditTableViewCell.m
//  things
//
//  Created by Michael Johann on 05.01.11.
//  Copyright 2011 rails-experts.com. All rights reserved.
//

#import "UICheckBoxTextEditTableViewCell.h"


@implementation UICheckBoxTextEditTableViewCell
@synthesize textField, checkBox;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if ((self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])) {
        CGFloat cellHeight = self.contentView.frame.size.height;
        CGFloat cellWidth  = self.contentView.frame.size.width;
        textField = [[UITextField alloc] initWithFrame:self.contentView.frame];
        textField.placeholder = @"Title";
        textField.frame = CGRectMake(cellHeight, self.frame.origin.y + 10, cellWidth - cellHeight, cellHeight);
        checkBox = [UIButton buttonWithType:UIButtonTypeCustom];
        [checkBox addTarget:self action:@selector(changeSelected:) forControlEvents:UIControlEventTouchUpInside];
        
        CGRect buttonRect = CGRectMake(12, 12, 16, 17);
        checkBox.frame = buttonRect;
        [checkBox setBackgroundImage:[UIImage imageNamed:@"checked.png"] forState:UIControlStateSelected];
        [checkBox setBackgroundImage:[UIImage imageNamed:@"unchecked.png"] forState:UIControlStateNormal];
        [self.contentView addSubview:checkBox];
        [self.contentView addSubview:textField];
    }
    return self;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {

    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)changeSelected:(id)sender {
    checkBox.selected = !checkBox.selected;
}

- (void)dealloc {
    [super dealloc];
}


@end
