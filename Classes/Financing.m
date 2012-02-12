//
//  Financing.m
//  NewREDIApp
//
//  Created by Administrator on 5/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Financing.h"


@implementation Financing
@synthesize finID;
@synthesize title;
@synthesize given;
@synthesize payneeded;

-(Financing *)initWithTitle:(NSString*)ttitle given:(NSInteger)tgiven payneeded:(NSInteger)tpayneeded finID:(NSInteger)tfinID{
	[super init];
	self.finID = tfinID;
	self.title = ttitle;
	self.given = tgiven;
	self.payneeded = tpayneeded;
	
	return self;
}
@end
