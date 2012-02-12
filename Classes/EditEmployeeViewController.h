//
//  EditEmployeeViewController.h
//  NewREDIApp
//
//  Created by Administrator on 5/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "DataController.h"
#import "Employee.h"


@interface EditEmployeeViewController : UIViewController {
	NSInteger add;
	UITextField* nameField;
	UITextField* salary;
	UITextView* desc;
	UITableView* table;
	DataController* dc;
}

@property NSInteger add;
@property (nonatomic, retain) IBOutlet UITextField* nameField;
@property (nonatomic, retain) IBOutlet UITextField* salary;
@property (nonatomic, retain) IBOutlet UITextView* desc;
@property (nonatomic, retain) UITableView* table;
@property (nonatomic, retain) DataController* dc;

@end
