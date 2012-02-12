//
//  License.m
//  NewREDIApp
//
//  Created by Administrator on 5/3/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "License.h"


@implementation License
@synthesize name;
@synthesize obtained;
@synthesize licID;
-(License *)initWithName:(NSString*)tname obtained:(NSInteger)tobtained licID:(NSInteger)tlicID{
	[super init];
	self.name = tname;
	self.obtained= tobtained;
	self.licID = tlicID;
	
	return self;
}
@end
