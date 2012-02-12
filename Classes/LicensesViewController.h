//
//  LicensesViewController.h
//  NewREDIApp
//
//  Created by Administrator on 5/2/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataController.h"
#import "License.h"
#import "AddLicenseViewController.h"

@interface LicensesViewController : UITableViewController {
	DataController* dc;
	UITableView* table;
	UIViewController* del;
}
@property (nonatomic, retain) DataController* dc;
@property (nonatomic, retain) IBOutlet UITableView* table;
@property (nonatomic, retain) UIViewController* del;
-(void)editButtonClicked:(id)sender;
@end
