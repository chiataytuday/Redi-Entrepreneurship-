//
//  CheckmarkCell.h
//  NewREDIApp
//
//  Created by Administrator on 5/11/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface CheckmarkCell : UITableViewCell {
	UIButton* checkmark;
	UILabel* textLabel;
}

@property (nonatomic, retain) IBOutlet UIButton* checkmark;
@property (nonatomic, retain) IBOutlet UILabel* textLabel;

@end
