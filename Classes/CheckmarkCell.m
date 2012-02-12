//
//  CheckmarkCell.m
//  NewREDIApp
//
//  Created by Administrator on 5/11/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "CheckmarkCell.h"


@implementation CheckmarkCell

@synthesize checkmark;
@synthesize textLabel;

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
