//
//  CalendarCell.m
//  NewREDIApp
//
//  Created by Donnelly, Kevin P. (MU-Student) on 4/7/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "CalendarCell.h"


@implementation CalendarCell
@synthesize eventDate;
@synthesize eventTime;
@synthesize eventDay;
@synthesize eventTitle;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code.
    }
    return self;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state.
}


- (void)dealloc {
    [super dealloc];
}


@end
