//
//  LocationViewController.h
//  NewREDIApp
//
//  Created by Administrator on 5/3/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataController.h"
#import "Location.h"
#import "EditLocationViewController.h"
@interface LocationViewController : UITableViewController {
	DataController* dc;
	UIViewController* del;
	UITableView* table;
}

@property (nonatomic, retain) DataController* dc;
@property (nonatomic, retain) UIViewController* del;
@property (nonatomic, retain) IBOutlet UITableView* table;

-(void)editButtonClicked:(id)sender;
@end
