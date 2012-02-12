//
//  StartupCostsViewController.h
//  NewREDIApp
//
//  Created by Administrator on 5/2/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StartupCost.h"
#import "DataController.h"
#import "EditStartupCostViewController.h"
#import "StartupCostCell.h"

@interface StartupCostsViewController : UIViewController <UITableViewDelegate, UITableViewDataSource> {
	UIViewController* del;
	DataController* dc;
	StartupCostCell* startupCell;
	
}

@property (nonatomic, retain) DataController* dc;
@property (nonatomic, retain) UIViewController* del;
@property (nonatomic, retain) IBOutlet 	StartupCostCell* startupCell;

@end
