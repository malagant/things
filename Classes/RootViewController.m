//
//  RootViewController.m
//  things
//
//  Created by Michael Johann on 01.01.11.
//  Copyright 2011 rails-experts.com. All rights reserved.
//

#import "RootViewController.h"
#import "TaskEditorViewController.h"

@implementation RootViewController

@synthesize mainMenu;

- (void)viewDidLoad {

    [super viewDidLoad];
    mainMenu = [[ListMenu alloc] init];

    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject)];
    self.navigationItem.rightBarButtonItem = addButton;
    [addButton release];
        
    [tableView setContentOffset:CGPointMake(0.0, searchBar.frame.size.height) animated:NO];
}


/*
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}
*/
/*
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}
*/
/*
- (void)viewWillDisappear:(BOOL)animated {
	[super viewWillDisappear:animated];
}
*/
/*
- (void)viewDidDisappear:(BOOL)animated {
	[super viewDidDisappear:animated];
}
*/

/*
 // Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	// Return YES for supported orientations.
	return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
 */

// Customize the number of sections in the table view.
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [mainMenu.sections count];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSInteger rowCount;
    
    switch(section) {
        case 0:
            rowCount = [mainMenu.sectionOne count];
            NSLog(@"rowCount for section 0 == %d", rowCount);
            break;
        case 1:
            rowCount = [mainMenu.sectionTwo count];
            NSLog(@"rowCount for section 1 == %d", rowCount);
            break;
        case 2:
            rowCount = [mainMenu.sectionThree count];
            NSLog(@"rowCount for section 2 == %d", rowCount);
            break;
        case 3:
            rowCount = [mainMenu.sectionFour count];
            NSLog(@"rowCount for section 3 == %d", rowCount);
            break;
        default:
            rowCount = 0;
            NSLog(@"rowCount for section x == %d", rowCount);
            return 0;
            break;
    }
    return rowCount;
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)_tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [_tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
        cell.isAccessibilityElement = YES;
    }
    
    NSLog(@"sections : %d, section : %d, row : %d",  [mainMenu.sections count], indexPath.section, indexPath.row);
    
    NSDictionary *section = nil;
    
    switch(indexPath.section) {
        case 0:
            section = mainMenu.sectionOne;
            break;
        case 1:
            section = mainMenu.sectionTwo;
            break;
        case 2:
            section = mainMenu.sectionThree;
            break;
        case 3:
            section = mainMenu.sectionFour;
            break;
    }
    
    ListMenuItem *item = nil;
    if(indexPath.section == 1) {
        switch(indexPath.row) {
            case 0:
                item = [section objectForKey:@"Today"];
                break;
            case 1:
                item = [section objectForKey:@"Next"];
                break;
            case 2:
                item = [section objectForKey:@"Planned"];
                break;
            case 3:
                item = [section objectForKey:@"Sometime"];
                break;
        }
    } else {
        item = [[section allValues] objectAtIndex:indexPath.row];
    }
    cell.textLabel.text = item.title;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.imageView.image = item.icon;
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // The table view should not be re-orderable.
    return NO;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    /*
    <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
    // ...
    // Pass the selected object to the new view controller.
    [self.navigationController pushViewController:detailViewController animated:YES];
    [detailViewController release];
	*/
}

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Relinquish ownership any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    // Relinquish ownership of anything that can be recreated in viewDidLoad or on demand.
    // For example: self.myOutlet = nil;
}

- (void)dealloc {
    [mainMenu release];
    [tableView release];
    [searchBar release];
    [scrollView release];
    [super dealloc];
}

- (void)insertNewObject {
    TaskEditorViewController *taskEditorViewController = [[TaskEditorViewController alloc] initWithNibName:@"TaskEditorViewController" bundle:nil];
    [self.navigationController pushViewController:taskEditorViewController animated:YES];
    [taskEditorViewController release];
}

@end
