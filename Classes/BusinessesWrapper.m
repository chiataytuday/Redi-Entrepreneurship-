//
//  BusinessesWrapper.m
//  NewREDIApp
//
//  Created by Administrator on 4/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "BusinessesWrapper.h"


@implementation BusinessesWrapper
@synthesize db;
@synthesize barray;

-(BusinessesWrapper * )initWithDB:(DatabaseController*)tDB{
	self.db =tDB;
	NSMutableArray* businesses = [self.db getBusinesses];
	self.barray = businesses;
	[businesses release];
	return self;
}

- (NSUInteger)count{
	return [self.barray count];
}

- (void)addObject:(id)anObject{
	NSLog(@"Trying to Add");
	[self.db addBusinessWithName:anObject];
	NSLog(@"possibly added?");
	NSMutableArray* businesses = [self.db getBusinesses];
	self.barray = businesses;
	[businesses release];
	
}

- (void)removeObjectAtIndex:(NSUInteger)index{
	Business* bus = [self.barray objectAtIndex:index];
	[self.db deleteBusinessWithID:bus.busID];
	
	
	[self.barray removeObjectAtIndex:index];
	
}


-(id)objectAtIndex:(NSUInteger)index{
	Business* bus = [self.barray objectAtIndex:index];
	return bus.name;
}

- (NSInteger)busIDatIndex:(NSUInteger)index{
	Business* bus = [self.barray objectAtIndex:index];
	return bus.busID;
}


@end
