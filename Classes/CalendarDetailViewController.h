//
//  CalendarDetailViewController.h
//  NewREDIApp
//
//  Created by Donnelly, Kevin P. (MU-Student) on 4/12/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataController.h"
#import "CalDetailCell.h"
@interface CalendarDetailViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>{
	DataController* dc;
	UITableView* table;
	CalDetailCell* detailCell;
}

@property (nonatomic, retain) DataController* dc;
@property (nonatomic, retain) IBOutlet UITableView* table;
@property (nonatomic, retain) IBOutlet CalDetailCell* detailCell;
@end
