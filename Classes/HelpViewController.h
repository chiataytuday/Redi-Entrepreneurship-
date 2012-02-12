//
//  HelpViewController.h
//  NewREDIApp
//
//  Created by Administrator on 5/3/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataController.h"

@interface HelpViewController : UIViewController {
	UIWebView* wView;
    DataController* dc;
}

@property (nonatomic, retain) IBOutlet UIWebView* wView;
@property (nonatomic, retain) DataController* dc;
@end
