//
//  ListMenu.m
//  things
//
//  Created by Michael Johann on 01.01.11.
//  Copyright 2011 rails-experts.com. All rights reserved.
//

#import "ListMenu.h"

NSString * const kInbox    = @"Inbox";
NSString * const kToday    = @"Today";
NSString * const kNext     = @"Next";
NSString * const kPlanned  = @"Planned";
NSString * const kSometime = @"Sometime";
NSString * const kProjects = @"Projects";
NSString * const kLog      = @"Log";


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
    
    ListMenuItem *inbox = [[ListMenuItem alloc] initWithTitle:@"Eingang" icon:nil sectionName:kInbox];
    [[self sectionOne] setObject:inbox forKey:kInbox];
    [inbox release];
    
    sectionTwo = [[NSMutableDictionary alloc] initWithCapacity:4];

    ListMenuItem *sometime = [[ListMenuItem alloc] initWithTitle:@"Irgendwann" icon:nil sectionName:kSometime];
    [[self sectionTwo] setObject:sometime forKey:kSometime];
    [sometime release];
    
    ListMenuItem *planned = [[ListMenuItem alloc] initWithTitle:@"Geplant" icon:nil sectionName:kPlanned];
    [[self sectionTwo] setObject:planned forKey:kPlanned];
    [planned release];
    
    ListMenuItem *next = [[ListMenuItem alloc] initWithTitle:@"Als Nächstes" icon:nil sectionName:kNext];
    [[self sectionTwo] setObject:next forKey:kNext];
    [next release];
        
    ListMenuItem *today = [[ListMenuItem alloc] initWithTitle:@"Heute" icon:nil sectionName:kToday];
    [[self sectionTwo] setObject:today forKey:kToday];
    [today release];
    
    sectionThree = [[NSMutableDictionary alloc] initWithCapacity:1];
    
    ListMenuItem *projects = [[ListMenuItem alloc] initWithTitle:@"Projekte" icon:nil sectionName:kProjects];
    [[self sectionThree] setObject:projects forKey:kProjects];
    [projects release];
    
    sectionFour = [[NSMutableDictionary alloc] initWithCapacity:1];
    
    ListMenuItem *logbook = [[ListMenuItem alloc] initWithTitle:@"Logbuch" icon:nil sectionName:kLog];
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

