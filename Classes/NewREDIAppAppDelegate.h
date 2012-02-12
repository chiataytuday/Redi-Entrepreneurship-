//
//  NewREDIAppAppDelegate.h
//  NewREDIApp
//
//  Created by Administrator on 4/6/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataController.h"
#import "RootViewController.h"
#import "TabViewController.h"
#import "CalendarViewController.h"
#import "CalendarCell.h"
#import "StepsViewController.h"
#import "AddBusinessViewController.h"
#import "BusinessesWrapper.h"
#import "DatabaseController.h"
#import "Business.h"
#import "CalendarDetailViewController.h"
#import "VideoViewController.h"
#import "WebViewController.h" 
#import "BusPlanViewController.h"
#import "InputViewController.h"

@interface NewREDIAppAppDelegate : NSObject <UIApplicationDelegate> {

    UIWindow *window;
    UINavigationController *navigationController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UINavigationController *navigationController;

@end

