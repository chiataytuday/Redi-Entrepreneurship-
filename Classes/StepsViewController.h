//
//  StepsViewController.h
//  NewREDIApp
//
//  Created by Administrator on 4/9/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TabViewController.h"
#import "DataController.h"
#import "CheckmarkCell.h"


@interface StepsViewController : UIViewController <UITableViewDelegate, UITableViewDataSource> {
	NSArray* pages;
	TabViewController* tabViewController;
	DataController* dc;
	CheckmarkCell* chkcell;
	UITableView* table;
}

@property (nonatomic, retain) NSArray* pages;
@property (nonatomic,retain) TabViewController* tabViewController;
@property (nonatomic, retain) DataController* dc;
@property (nonatomic, retain) IBOutlet CheckmarkCell* chkcell;
@property (nonatomic, retain) IBOutlet UITableView* table;

-(IBAction)buttonClicked:(UIButton *)sender;

@end
