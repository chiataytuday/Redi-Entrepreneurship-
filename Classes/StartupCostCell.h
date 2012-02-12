//
//  StartupCostCell.h
//  NewREDIApp
//
//  Created by Administrator on 5/3/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface StartupCostCell : UITableViewCell {
	UILabel* textLabel;
	UILabel* needed;
	UILabel* purchased;
	UILabel* greenLabel;
	UILabel* redLabel;
}

@property (nonatomic, retain) IBOutlet UILabel* textLabel;
@property (nonatomic, retain) IBOutlet UILabel* needed;
@property (nonatomic, retain) IBOutlet UILabel* purchased;
@property (nonatomic, retain) IBOutlet UILabel* greenLabel;
@property (nonatomic, retain) IBOutlet UILabel* redLabel;
@end
