//
//  ListMenu.h
//  things
//
//  Created by Michael Johann on 01.01.11.
//  Copyright 2011 rails-experts.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ListMenuItem : NSObject {
    NSString *title;
    UIImage  *icon;
    NSString *sectionName;
}
@property (nonatomic, assign) NSString *title;
@property (nonatomic, assign) UIImage  *icon;
@property (nonatomic, assign) NSString *sectionName;

- (id)initWithTitle:(NSString *)title
               icon:(UIImage *)icon
        sectionName:(NSString *)sectionName;
@end

@interface ListMenu : NSObject {
    NSMutableDictionary *sections;
    NSMutableDictionary *sectionOne;
    NSMutableDictionary *sectionTwo;
    NSMutableDictionary *sectionThree;
    NSMutableDictionary *sectionFour;

}

@property (nonatomic, retain) NSMutableDictionary *sections;
@property (nonatomic, retain) NSMutableDictionary *sectionOne;
@property (nonatomic, retain) NSMutableDictionary *sectionTwo;
@property (nonatomic, retain) NSMutableDictionary *sectionThree;
@property (nonatomic, retain) NSMutableDictionary *sectionFour;

@end

