//
//  ListMenu.m
//  things
//
//  Created by Michael Johann on 01.01.11.
//  Copyright 2011 rails-experts.com. All rights reserved.
//

#import "ListMenu.h"
#import "Constants.h"

@implementation ListMenuItem
@synthesize title, icon, sectionName;

-(id)initWithTitle:(NSString *)_title icon:(UIImage *)_icon sectionName:(NSString *)_sectionName {
    self = [super init];
    
    title = _title;
    icon  = _icon;
    sectionName = _sectionName;
    
    return self;
}

@end

@implementation ListMenu
@synthesize sections, sectionOne, sectionTwo, sectionThree, sectionFour;

-(id)init {
    self = [super init];
    sectionOne = [[NSMutableDictionary alloc] initWithCapacity:1];
    
    UIImage *imgInbox = [UIImage imageNamed:@"things-touch-source-inbox.png"];
    ListMenuItem *inbox = [[ListMenuItem alloc] initWithTitle:@"Eingang" icon:imgInbox sectionName:kInbox];
    [[self sectionOne] setObject:inbox forKey:kInbox];
    [inbox release];
    
    sectionTwo = [[NSMutableDictionary alloc] initWithCapacity:4];

    UIImage *imgSometime = [UIImage imageNamed:@"things-touch-source-someday.png"];
    ListMenuItem *sometime = [[ListMenuItem alloc] initWithTitle:@"Irgendwann" icon:imgSometime sectionName:kSometime];
    [[self sectionTwo] setObject:sometime forKey:kSometime];
    [sometime release];
    
    UIImage *imgPlanned = [UIImage imageNamed:@"things-touch-source-scheduled.png"];
    ListMenuItem *planned = [[ListMenuItem alloc] initWithTitle:@"Geplant" icon:imgPlanned sectionName:kPlanned];
    [[self sectionTwo] setObject:planned forKey:kPlanned];
    [planned release];
    
    UIImage *imgNext = [UIImage imageNamed:@"things-touch-source-next.png"];
    ListMenuItem *next = [[ListMenuItem alloc] initWithTitle:@"Als Nächstes" icon:imgNext sectionName:kNext];
    [[self sectionTwo] setObject:next forKey:kNext];
    [next release];
        
    UIImage *imgToday = [UIImage imageNamed:@"things-touch-source-today.png"];
    ListMenuItem *today = [[ListMenuItem alloc] initWithTitle:@"Heute" icon:imgToday sectionName:kToday];
    [[self sectionTwo] setObject:today forKey:kToday];
    [today release];
    
    sectionThree = [[NSMutableDictionary alloc] initWithCapacity:1];
    
    UIImage *imgProjects = [UIImage imageNamed:@"things-touch-source-projects.png"];
    ListMenuItem *projects = [[ListMenuItem alloc] initWithTitle:@"Projekte" icon:imgProjects sectionName:kProjects];
    [[self sectionThree] setObject:projects forKey:kProjects];
    [projects release];
    
    sectionFour = [[NSMutableDictionary alloc] initWithCapacity:1];
    
    UIImage *imgLogbook = [UIImage imageNamed:@"things-touch-source-logbook.png"];
    ListMenuItem *logbook = [[ListMenuItem alloc] initWithTitle:@"Logbuch" icon:imgLogbook sectionName:kLog];
    [[self sectionFour] setObject:logbook forKey:kLog];
    [logbook release];

    sections = [[NSMutableDictionary alloc] initWithCapacity:5];
    
    [sections setObject:sectionFour forKey:@"four"];
    [sections setObject:sectionThree forKey:@"three"];
    [sections setObject:sectionTwo forKey:@"two"];
    [sections setObject:sectionOne forKey:@"one"];
    
    [sectionFour release];
    [sectionThree release];
    [sectionTwo release];
    [sectionOne release];
    
    return self;
}

- (void)dealloc {
    [sections release];
    [super dealloc];
}
@end

