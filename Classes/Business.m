//
//  Business.m
//  NewREDIApp
//
//  Created by Administrator on 4/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Business.h"


@implementation Business

@synthesize busID;
@synthesize name;

-(Business*)initWithID:(NSInteger)tID Name:(NSString*)tName{
	[super init];
	self.busID = tID;
	self.name = tName;
	return self;
}

@end
