//
//  VideoViewController.h
//  NewREDIApp
//
//  Created by Administrator on 4/14/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GDataYouTube.h"
#import "DataController.h"
#import "WebViewController.h"

@interface VideoViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>{
	GDataServiceGoogleYouTube* service;
	NSArray* videos;
	DataController* dc;
	UIView* loadingView;
	UITableView* videosTable;

	UILabel* label;
	UIView* icon;
}

@property (nonatomic, retain) GDataServiceGoogleYouTube* service;
@property (nonatomic, retain) NSArray* videos;
@property (nonatomic, retain) DataController* dc;
@property (nonatomic, retain) IBOutlet UIView* loadingView;
@property (nonatomic, retain) IBOutlet UITableView* videosTable;

@property (nonatomic, retain) IBOutlet UILabel* label;
@property (nonatomic, retain) IBOutlet UIView* icon;

@end
