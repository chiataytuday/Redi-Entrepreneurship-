//
//  WebViewController.h
//  NewREDIApp
//
//  Created by Administrator on 4/17/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataController.h"

@interface WebViewController : UIViewController {
	UIWebView* webView;
	DataController* dc;
}
@property (nonatomic, retain) IBOutlet UIWebView* webView;
@property (nonatomic, retain) DataController* dc;

@end
