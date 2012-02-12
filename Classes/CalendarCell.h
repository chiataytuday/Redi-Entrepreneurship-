//
//  CalendarCell.h
//  NewREDIApp
//
//  Created by Donnelly, Kevin P. (MU-Student) on 4/7/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface CalendarCell : UITableViewCell {
	UILabel* eventDay;
	UILabel* eventDate;
	UILabel* eventTime;
	UILabel* eventTitle;

}
@property (nonatomic, retain) IBOutlet UILabel* eventDay;
@property (nonatomic, retain) IBOutlet UILabel* eventDate;
@property (nonatomic, retain) IBOutlet UILabel* eventTime;
@property (nonatomic, retain) IBOutlet UILabel* eventTitle;

@end
