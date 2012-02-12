//
//  EditStartupCostViewController.h
//  NewREDIApp
//
//  Created by Administrator on 5/2/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataController.h"
#import "Financing.h"
@interface EditStartupCostViewController : UIViewController {
	DataController* dc;
	UITextField* neededtext;
	UITextField* purchasedtext;
	UITableView* table;
	UILabel* label1;
	UILabel* label2;
}

@property (nonatomic, retain) DataController* dc;
@property (nonatomic, retain) IBOutlet UITextField* neededtext;
@property (nonatomic, retain) IBOutlet UITextField* purchasedtext;
@property (nonatomic, retain) UITableView* table;
@property (nonatomic, retain) IBOutlet UILabel* label1;
@property (nonatomic, retain) IBOutlet UILabel* label2;
@end
