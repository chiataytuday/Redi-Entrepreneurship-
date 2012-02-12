//
//  InputViewController.h
//  NewREDIApp
//
//  Created by Donnelly, Kevin P. (MU-Student) on 4/28/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "DataController.h"

@interface InputViewController : UIViewController{
    UITextView* textView;
	DataController* dc;
	UILabel* label;
	UITableView* table;
}

@property (nonatomic, retain) IBOutlet UILabel* label;
@property (nonatomic, retain) DataController* dc;
@property (nonatomic, retain) IBOutlet UITextView* textView;
@property (nonatomic, retain) UITableView* table;
-(void)done:(id)sender;

@end
