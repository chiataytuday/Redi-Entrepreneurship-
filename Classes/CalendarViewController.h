//
//  CalendarViewController.h
//  NewREDIApp
//
//  Created by Administrator on 4/6/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GDataCalendar.h"
#import "CalendarCell.h"
#import "DataController.h"
#import "CalendarDetailViewController.h"

@interface CalendarViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>{
	DataController* dc;
	UILabel* label;
	UIView* loading;
	GDataServiceGoogleCalendar* service;

	UITableView* calTable;
	CalendarCell* calCell;
	CalendarDetailViewController* detailvc;
	UIViewController* delegate;
	UIView* icon;
}

@property (nonatomic, retain) DataController* dc;
@property (nonatomic, retain) IBOutlet UIView* loadingView;
@property (nonatomic, retain) GDataServiceGoogleCalendar* service;
@property (nonatomic, retain) IBOutlet UITableView* calTable;
@property (nonatomic, retain) IBOutlet CalendarCell* calCell;
@property (nonatomic, retain) CalendarDetailViewController* detailvc;
@property (nonatomic, retain) UIViewController* delegate;
@property (nonatomic, retain) IBOutlet UILabel* label;
@property (nonatomic, retain) IBOutlet UIView* icon;
@end
