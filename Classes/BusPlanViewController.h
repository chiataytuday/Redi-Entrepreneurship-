//
//  BusPlanViewController.h
//  NewREDIApp
//
//  Created by Administrator on 4/27/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "InputViewController.h"
#import "DataController.h"
#import "InfoCell.h"

@interface BusPlanViewController : UITableViewController {

	DataController* dc;
    UIViewController* del;
	InfoCell* infoCell;
}


@property (nonatomic, retain) UIViewController* del;
@property (nonatomic, retain) DataController* dc;
@property (nonatomic, retain) IBOutlet InfoCell* infoCell;
@end
