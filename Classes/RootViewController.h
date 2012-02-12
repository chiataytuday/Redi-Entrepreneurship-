//
//  RootViewController.h
//  NewREDIApp
//
//  Created by Administrator on 4/6/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TabViewController.h"
#import "AddBusinessViewController.h"
#import "DataController.h"
#import "StepsViewController.h"
#import "VideoViewController.h"
#import "CalendarCell.h"
#import "CalendarDetailViewController.h"

@interface RootViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>{
	DataController* dc;
	BOOL showMore;
	UITableView* table;
	UITableView* table2;
	CalendarCell* calCell;
	GDataEntryEvent* event;
	UITableView* calTable;
	GDataServiceGoogleCalendar* calservice;
	UITableView* videoTable;
	GDataServiceGoogleYouTube* videoservice;

	GDataEntryYouTubeVideo* video;
}

@property (nonatomic, retain) DataController* dc;
@property (nonatomic, retain) IBOutlet UITableView* table;
@property (nonatomic, retain) IBOutlet UITableView* table2;
@property (nonatomic, retain) IBOutlet CalendarCell* calCell;
@property (nonatomic, retain) GDataEntryEvent* event;
@property (nonatomic, retain) IBOutlet UITableView* calTable;
@property (nonatomic, retain) GDataServiceGoogleCalendar* calservice;
@property (nonatomic, retain) IBOutlet UITableView* videoTable;
@property (nonatomic, retain) 	GDataServiceGoogleYouTube* videoservice;

@property (nonatomic, retain) GDataEntryYouTubeVideo* video;
@property BOOL showMore;

-(void)editButtonClicked:(id)sender;
-(void)showAllBusinesses;

@end
