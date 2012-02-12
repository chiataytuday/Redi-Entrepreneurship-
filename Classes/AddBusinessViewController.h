//
//  AddBusinessViewController.h
//  NewREDIApp
//
//  Created by Administrator on 4/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataController.h"

@interface AddBusinessViewController : UIViewController <UITextFieldDelegate> {
	UITextField* textf;
	DataController* dc;
}
@property (nonatomic,retain) IBOutlet UITextField* textf;
@property (nonatomic, retain) DataController* dc;

@end
