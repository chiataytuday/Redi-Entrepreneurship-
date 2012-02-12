//
//  Employee.m
//  NewREDIApp
//
//  Created by Administrator on 5/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Employee.h"


@implementation Employee
@synthesize empID;
@synthesize name;
@synthesize salary;
@synthesize desc;

-(Employee *)initWithName:(NSString*)tname salary:(NSString*)tsalary desc:(NSString*)tdesc empID:(NSInteger)tempID {
	[super init];
	self.empID = tempID;
	self.name = tname;
	self.salary =tsalary;
	self.desc = tdesc;
	
	return self;
}
@end
