//
//  BusinessesWrapper.h
//  NewREDIApp
//
//  Created by Administrator on 4/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DatabaseController.h"
#import "Business.h"

@interface BusinessesWrapper : NSObject {
	DatabaseController* db;
	NSMutableArray* barray;
}

@property (nonatomic, retain) DatabaseController* db;
@property (nonatomic, retain) NSMutableArray* barray;

-(BusinessesWrapper * )initWithDB:(DatabaseController*)tDB;
- (NSUInteger)count;
-(id)objectAtIndex:(NSUInteger)index;
- (void)removeObjectAtIndex:(NSUInteger)index;
- (void)addObject:(id)anObject;
- (NSInteger)busIDatIndex:(NSUInteger)index;

@end
