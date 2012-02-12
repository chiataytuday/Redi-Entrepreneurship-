//
//  TabViewController.h
//  NewREDIApp
//
//  Created by Administrator on 4/6/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CalendarViewController.h"
#import "DataController.h"
#import "BusPlanViewController.h"
#import "StartupCostsViewController.h"
#import "MarketingViewController.h"
#import "LicensesViewController.h"
#import "HelpViewController.h"
#import "VideoViewController.h"
#import "LocationViewController.h"
#import "FinanceViewController.h"
#import "EmployeesViewController.h"

@interface TabViewController : UIViewController <UITabBarDelegate> {
	UITabBar* tabBar;
	UITabBarItem* howToTab;
	UITabBarItem* doTab;
	UITabBarItem* calendarTab;
	UITabBarItem* videosTab;
	UIViewController* currentViewController;
	CalendarViewController* calView;
	//BusPlanViewController* busView;
	UIViewController* doView;
	DataController* dc;
}

@property (nonatomic, retain) IBOutlet UITabBar* tabBar;
@property (nonatomic, retain) IBOutlet UITabBarItem* howToTab;
@property (nonatomic, retain) IBOutlet UITabBarItem* doTab;
@property (nonatomic, retain) IBOutlet UITabBarItem* calendarTab;
@property (nonatomic, retain) IBOutlet UITabBarItem* videosTab;
@property (nonatomic, retain) UIViewController* currentViewController;
@property (nonatomic, retain) CalendarViewController* calView;
//@property (nonatomic, retain) BusPlanViewController* busView;
@property (nonatomic, retain) UIViewController* doView;
@property (nonatomic, retain) DataController* dc;

@end
