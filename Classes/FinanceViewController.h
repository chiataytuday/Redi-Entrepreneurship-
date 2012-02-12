//
//  FinanceViewController.h
//  NewREDIApp
//
//  Created by Administrator on 5/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataController.h"
#import "Financing.h"
#import "AddLicenseViewController.h"
#import "StartupCostCell.h"
#import "EditStartupCostViewController.h"

@interface FinanceViewController : UITableViewController {
	DataController* dc;
	UIViewController* del;
	UITableView* table;
	StartupCostCell* tcell;
}

@property (nonatomic, retain) DataController* dc;
@property (nonatomic, retain) UIViewController* del;
@property (nonatomic, retain) IBOutlet UITableView* table;
@property (nonatomic, retain) IBOutlet StartupCostCell* tcell;
@end
