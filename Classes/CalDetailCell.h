//
//  CalDetailCell.h
//  NewREDIApp
//
//  Created by Administrator on 7/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface CalDetailCell : UITableViewCell {
	UITextView* textView;
}

@property (nonatomic, retain) IBOutlet UITextView* textView;

@end
