//
//  StartupCost.m
//  NewREDIApp
//
//  Created by Administrator on 5/2/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "StartupCost.h"


@implementation StartupCost
@synthesize name;
@synthesize purchased;
@synthesize needed;

-(StartupCost *)initWithName:(NSString*)tname Purchased:(NSInteger)tpurchased Needed:(NSInteger)tneeded{
	[super init];
	self.name = tname;
	self.purchased = tpurchased;
	self.needed = tneeded;
	
	return self;
}
@end
