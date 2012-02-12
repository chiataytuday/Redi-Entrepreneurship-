//
//  DataController.m
//  NewREDIApp
//
//  Created by Administrator on 4/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "DataController.h"


@implementation DataController
@synthesize businesses;
@synthesize rootTable;
@synthesize db;
@synthesize monthToEvents;
@synthesize keys;
@synthesize selectedEvent;
@synthesize curBusID;
@synthesize partsOfPlan;
@synthesize fieldName;
@synthesize step;
@synthesize startupCosts;
@synthesize curStartupCost;
@synthesize licenses;
@synthesize dcArray;
@synthesize finID;
@synthesize vURL;
-(DataController * )init{
	[super init];
	DatabaseController* tDB = [[DatabaseController alloc] init];
	self.db = tDB;
	[tDB release];
	
	self.businesses = [[BusinessesWrapper alloc] initWithDB:self.db];
	self.step = -1;
	return self;
}
@end
