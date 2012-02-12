//
//  EmployeesViewController.h
//  NewREDIApp
//
//  Created by Administrator on 5/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Employee.h"
#import "DataController.h"
#import "EditEmployeeViewController.h"

@interface EmployeesViewController : UITableViewController {
	DataController* dc;
	UIViewController* del;
	UITableView* table;
}

@property (nonatomic, retain) DataController* dc;
@property (nonatomic, retain) UIViewController* del;
@property (nonatomic, retain) IBOutlet UITableView* table;

@end
