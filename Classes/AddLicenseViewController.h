//
//  AddLicenseViewController.h
//  NewREDIApp
//
//  Created by Administrator on 5/3/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataController.h"

@interface AddLicenseViewController : UIViewController <UITextFieldDelegate>{
	DataController* dc;
	UILabel* label;
	UITextField* txtField;
	UITableView* licenseTable;
}
@property (nonatomic, retain) DataController* dc;
@property (nonatomic, retain) IBOutlet UILabel* label;
@property (nonatomic, retain) IBOutlet UITextField* txtField;
@property (nonatomic, retain) IBOutlet UITableView* licenseTable;

@end
