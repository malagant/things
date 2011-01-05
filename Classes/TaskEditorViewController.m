//
//  TaskEditorViewController.m
//  things
//
//  Created by Michael Johann on 03.01.11.
//  Copyright 2011 rails-experts.com. All rights reserved.
//

#import "TaskEditorViewController.h"


@implementation TaskEditorViewController

@synthesize textEntry, checkBox;
/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
    }
    return self;
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {   
    checkBox = [UIButton buttonWithType:UIButtonTypeCustom];
    [checkBox setBackgroundImage:[UIImage imageNamed:@"unchecked.png"] forState:UIControlStateNormal];
    [checkBox setBackgroundImage:[UIImage imageNamed:@"checked.png"] forState:UIControlStateSelected];
    [super viewDidLoad];
}


/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    switch(section) {
            case 0:
            return 1;
            case 1:
            return 2;
            case 3:
            return 1;
    }
    return 0;
}

-(UITableViewCell *)tableView:(UITableView *)_tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifierTaskTitle = @"TaskTitleCell";
    static NSString *CellIdentifierTargetFolder = @"TargetFolderCell";
    static NSString *CellIdentifierDetails = @"DetailsCell";
    
    UITableViewCell *cell = nil;
    
    if(indexPath.section == 1) {
        cell = [_tableView dequeueReusableCellWithIdentifier:CellIdentifierDetails];
    }
    if(indexPath.section == 2) {
        cell = [_tableView dequeueReusableCellWithIdentifier:CellIdentifierTargetFolder];
    }
    else {
        cell = [_tableView dequeueReusableCellWithIdentifier:CellIdentifierTaskTitle];
    }
    
    if (cell == nil && indexPath.section == 1) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifierDetails] autorelease];
        cell.isAccessibilityElement = YES;
    } if (cell == nil && indexPath.section == 2) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifierTargetFolder] autorelease];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.isAccessibilityElement = YES;
    } else {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifierTaskTitle] autorelease];
        CGRect rect = cell.contentView.frame;
        rect.origin.x = rect.origin.x + 50;
        textEntry = [[UITextField alloc] initWithFrame:rect];
        textEntry.leftView = checkBox;
        [cell.contentView addSubview:textEntry];
        cell.isAccessibilityElement = YES;
    }
    
    return cell;
}

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

-(void)viewWillAppear:(BOOL)animated {
    self.navigationItem.title = @"Neue Aufgabe";
}

-(void)changeSelected:(id)sender {
    
}

- (void)dealloc {
    [textEntry release];
    [super dealloc];
}


@end
