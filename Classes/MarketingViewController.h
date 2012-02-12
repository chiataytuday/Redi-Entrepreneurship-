//
//  MarketingViewController.h
//  NewREDIApp
//
//  Created by Administrator on 5/2/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataController.h"
#import "InputViewController.h"

@interface MarketingViewController : UITableViewController {
	DataController* dc;
	UIViewController* del;
}

@property (nonatomic, retain) DataController* dc;
@property (nonatomic, retain) UIViewController* del;

@end
