//
//  EditLocationViewController.h
//  NewREDIApp
//
//  Created by Administrator on 5/3/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "DataController.h"
#import "Location.h"

@interface EditLocationViewController : UIViewController {
	NSInteger add;
	UITextField* titleField;
	UITextView* address;
	UITextView* notes;
	UITableView* table;
	DataController* dc;
}

@property NSInteger add;
@property (nonatomic, retain) IBOutlet UITextField* titleField;
@property (nonatomic, retain) IBOutlet UITextView* address;
@property (nonatomic, retain) IBOutlet UITextView* notes;
@property (nonatomic, retain) UITableView* table;
@property (nonatomic, retain) DataController* dc;

@end
