//
//  Location.m
//  NewREDIApp
//
//  Created by Administrator on 5/3/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Location.h"


@implementation Location
@synthesize locID;
@synthesize title;
@synthesize address;
@synthesize notes; 
-(Location *)initWithTitle:(NSString*)ttitle address:(NSString*)taddress notes:(NSString*)tnotes locID:(NSInteger)tlocID{
	[super init];
	self.locID = tlocID;
	self.title = ttitle;
	self.address = taddress;
	self.notes = tnotes;
	
	return self;
}



@end
