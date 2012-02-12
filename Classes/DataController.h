//
//  DataController.h
//  NewREDIApp
//
//  Created by Administrator on 4/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BusinessesWrapper.h"
#import "DatabaseController.h"
#import "GDataCalendar.h"
#import "StartupCost.h"

@interface DataController : NSObject {
	BusinessesWrapper* businesses;
	UITableView* rootTable;
	DatabaseController* db;
	NSMutableDictionary* monthToEvents;
	NSMutableArray* keys;
	GDataEntryEvent* selectedEvent;
	NSInteger curBusID;
	NSInteger step;
	NSMutableArray* partsOfPlan;
	NSString* fieldName;
	NSMutableArray* startupCosts;
	NSMutableArray* licenses;
	StartupCost* curStartupCost;
	NSMutableArray* dcArray;
	NSInteger finID;
	NSString* vURL;
}

@property (nonatomic, retain) BusinessesWrapper* businesses;
@property (nonatomic, retain) UITableView* rootTable;
@property (nonatomic, retain) DatabaseController* db;
@property (nonatomic, retain) NSMutableDictionary* monthToEvents;
@property (nonatomic, retain) NSMutableArray* keys;
@property (nonatomic, retain) GDataEntryEvent* selectedEvent;
@property (nonatomic, retain) NSMutableArray* partsOfPlan;
@property (nonatomic, retain) NSString* fieldName;
@property NSInteger curBusID;
@property NSInteger step;
@property (nonatomic, retain) NSMutableArray* startupCosts;
@property (nonatomic, retain) NSMutableArray* licenses;
@property (nonatomic, retain) NSMutableArray* dcArray;
@property (nonatomic, retain) StartupCost* curStartupCost;
@property (nonatomic, retain) 	NSString* vURL;
@property NSInteger finID;
@end
