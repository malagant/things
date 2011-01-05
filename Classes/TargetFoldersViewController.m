//
//  TargetFoldersViewController.m
//  things
//
//  Created by Michael Johann on 05.01.11.
//  Copyright 2011 rails-experts.com. All rights reserved.
//

#import "TargetFoldersViewController.h"


@implementation TargetFoldersViewController
@synthesize selectedTargetFolder;

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
    self.navigationItem.title = @"Erstellen in";
    [super viewDidLoad];
}


/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

-(UITableViewCell *)tableView:(UITableView *)_tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [_tableView dequeueReusableCellWithIdentifier:CellIdentifier];

    if(self.selectedTargetFolder == nil) {
        self.selectedTargetFolder = indexPath;
    }
    
    if(cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    if(indexPath.section == 0) {
        cell.textLabel.text = @"Eingang";

        if(self.selectedTargetFolder == indexPath) {
            cell.accessoryType = UITableViewCellAccessoryCheckmark;
        }
        cell.imageView.image = [UIImage imageNamed:@"things-touch-source-inbox.png"];
    } else {
        if(indexPath.row == 0) {
            cell.textLabel.text = @"Heute";
            if(self.selectedTargetFolder == indexPath) {
                cell.accessoryType = UITableViewCellAccessoryCheckmark;
            }
            cell.imageView.image = [UIImage imageNamed:@"things-touch-source-today.png"];
        } 
        else 
        if(indexPath.row == 1) {
            cell.textLabel.text = @"Als Nächstes";
            if(self.selectedTargetFolder == indexPath) {
                cell.accessoryType = UITableViewCellAccessoryCheckmark;
            }
            cell.imageView.image = [UIImage imageNamed:@"things-touch-source-next.png"];
        }
        else 
        if(indexPath.row == 2) {
            cell.textLabel.text = @"Geplant";
            if(self.selectedTargetFolder == indexPath) {
                cell.accessoryType = UITableViewCellAccessoryCheckmark;
            }
            cell.imageView.image = [UIImage imageNamed:@"things-touch-source-scheduled.png"];
        }
        else 
        if(indexPath.row == 3) {
            cell.textLabel.text = @"Irgendwann";
            if(self.selectedTargetFolder == indexPath) {
                cell.accessoryType = UITableViewCellAccessoryCheckmark;
            }
            cell.imageView.image = [UIImage imageNamed:@"things-touch-source-someday.png"];
        }
    }
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:selectedTargetFolder];
    cell.accessoryType = UITableViewCellAccessoryNone;
    self.selectedTargetFolder = indexPath;
    
    [self.tableView reloadData];
    [self.navigationController popViewControllerAnimated:YES];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if(section == 0) {
        return 1;  
    }
    else { 
        return 3;
    }
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


- (void)dealloc {
    [super dealloc];
}


@end
