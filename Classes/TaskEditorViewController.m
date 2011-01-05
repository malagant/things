//
//  TaskEditorViewController.m
//  things
//
//  Created by Michael Johann on 03.01.11.
//  Copyright 2011 rails-experts.com. All rights reserved.
//

#import "TaskEditorViewController.h"
#import "UICheckBoxTextEditTableViewCell.h"
#import "TargetFoldersViewController.h"

@implementation TaskEditorViewController
@synthesize detailsActive;
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
    detailsActive = NO;
    cbTaskField = [[UICheckBoxTextEditTableViewCell alloc] init];
    [super viewDidLoad];
}


/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    switch(section) {
            case 0:
            return 2;
            case 1:
            return 1;
    }
    return 0;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if(indexPath.section == 0) {
        if(indexPath.row == 0) {
            // TODO Something with the title editor???
        } else {
            [self showDetailsCells];
        }
    } else {
        [self showTargetFolders];
    }
}

-(void)showDetailsCells {
    self.detailsActive = YES;
    [self.tableView reloadData];
}

-(void)showTargetFolders {
    TargetFoldersViewController *con = [[TargetFoldersViewController alloc] initWithNibName:@"TargetFoldersViewController" bundle:nil];
    [self.navigationController pushViewController:con animated:YES];
    [con release];
}

-(UITableViewCell *)tableView:(UITableView *)_tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifierTaskTitle = @"TaskTitleCell";
    static NSString *CellIdentifierTargetFolder = @"TargetFolderCell";
    static NSString *CellIdentifierDetails = @"DetailsCell";
    
    UITableViewCell *cell = nil;
    
    if(indexPath.section == 0) {
        if(indexPath.row == 0) {
            cell = [_tableView dequeueReusableCellWithIdentifier:CellIdentifierTaskTitle];
        } else {
            cell = [_tableView dequeueReusableCellWithIdentifier:CellIdentifierDetails];
        }
    }
    else {
        cell = [_tableView dequeueReusableCellWithIdentifier:CellIdentifierTargetFolder];
    }
    
    if (cell == nil && indexPath.section == 1) {
    //
    // Cell for target folder selection
    //
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifierTargetFolder] autorelease];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.textLabel.text = @"Erstellen in";
        cell.accessibilityLabel = @"Eingang";
        cell.isAccessibilityElement = YES;
    }
     else 
     if(cell == nil) {
         //
         // Cell for entering the tasks title
         //
         if(indexPath.row == 0) {
             cell = [[[UICheckBoxTextEditTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifierTaskTitle] autorelease];
             [((UICheckBoxTextEditTableViewCell*)cell).textField becomeFirstResponder];
             cell.isAccessibilityElement = YES;
         } else {
        //
        // Cell for opening the details menu
        //
             cell = [[[UICheckBoxTextEditTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifierDetails] autorelease];
             cell.textLabel.textAlignment = UITextAlignmentCenter;
             cell.textLabel.text = @"Details einblenden";
             cell.textLabel.textColor = [UIColor darkGrayColor];
             cell.isAccessibilityElement = YES;
         }
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
    [cbTaskField release];
    [super dealloc];
}


@end
