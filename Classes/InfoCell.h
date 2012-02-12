//
//  InfoCell.h
//  NewREDIApp
//
//  Created by Administrator on 5/11/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface InfoCell : UITableViewCell {
	UILabel* title;
	UILabel* info;
}

@property (nonatomic, retain) IBOutlet UILabel* title;
@property (nonatomic, retain) IBOutlet UILabel* info;

@end
