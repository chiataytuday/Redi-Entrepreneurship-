//
//  TabViewController.m
//  NewREDIApp
//
//  Created by Administrator on 4/6/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "TabViewController.h"


@implementation TabViewController

@synthesize dc;
@synthesize tabBar;
@synthesize howToTab;
@synthesize doTab;
@synthesize calendarTab;
@synthesize videosTab;
@synthesize currentViewController;
@synthesize calView;
//@synthesize busView;
@synthesize doView;

// The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
/*
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization.
    }
    return self;
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	
	if (self.dc.step == 0) {
		if (self.doView == nil) {
			BusPlanViewController* tempvc = [[BusPlanViewController alloc] initWithNibName:@"BusPlanViewController" bundle:nil];
			tempvc.dc = self.dc;
			tempvc.del = self;
			self.doView = tempvc;
			
			[tempvc release];
			
		}
		
		//[self.currentViewController.view removeFromSuperview];
		[self.view addSubview:self.doView.view];
		[self.view sendSubviewToBack:self.doView.view];
		self.currentViewController = self.doView;
		self.tabBar.selectedItem = doTab;
	}
	else if(self.dc.step == 1){
		if (self.doView == nil) {
			StartupCostsViewController* tempvc = [[StartupCostsViewController alloc] initWithNibName:@"StartupCostsViewController" bundle:nil];
			tempvc.dc = self.dc;
			tempvc.del = self;
			self.doView = tempvc;
			
			[tempvc release];
			
		}
		
		//[self.currentViewController.view removeFromSuperview];
		[self.view addSubview:self.doView.view];
		[self.view sendSubviewToBack:self.doView.view];
		self.currentViewController = self.doView;
		self.tabBar.selectedItem = doTab;
	}
	
	else if(self.dc.step == 2){
		if (self.doView == nil) {
			LocationViewController* tempvc = [[LocationViewController alloc] initWithNibName:@"LocationViewController" bundle:nil];
			tempvc.dc = self.dc;
			tempvc.del = self;
			self.doView = tempvc;
			
			[tempvc release];
			
		}
		
		[self.currentViewController.view removeFromSuperview];
		[self.view addSubview:self.doView.view];
		[self.view sendSubviewToBack:self.doView.view];
		self.currentViewController = self.doView;
		self.tabBar.selectedItem = doTab;
	}
	
	else if(self.dc.step == 3){
		if (self.doView == nil) {
			MarketingViewController* tempvc = [[MarketingViewController alloc] initWithNibName:@"MarketingViewController" bundle:nil];
			tempvc.dc = self.dc;
			tempvc.del = self;
			self.doView = tempvc;
			
			[tempvc release];
			
		}
		
		//[self.currentViewController.view removeFromSuperview];
		[self.view addSubview:self.doView.view];
		[self.view sendSubviewToBack:self.doView.view];
		self.currentViewController = self.doView;
		self.tabBar.selectedItem = doTab;
	}
	else if(self.dc.step == 4){
		if (self.doView == nil) {
			FinanceViewController* tempvc = [[FinanceViewController alloc] initWithNibName:@"FinanceViewController" bundle:nil];
			tempvc.dc = self.dc;
			tempvc.del = self;
			self.doView = tempvc;
			
			[tempvc release];
			
		}
		
	//	[self.currentViewController.view removeFromSuperview];
		[self.view addSubview:self.doView.view];
		[self.view sendSubviewToBack:self.doView.view];
		self.currentViewController = self.doView;
		self.tabBar.selectedItem = doTab;
	}
	else if(self.dc.step == 5){
		if (self.doView == nil) {
			LicensesViewController* tempvc = [[LicensesViewController alloc] initWithNibName:@"LicensesViewController" bundle:nil];
			tempvc.dc = self.dc;
			tempvc.del = self;
			self.doView = tempvc;
			
			[tempvc release];
			
		}
		
		//[self.currentViewController.view removeFromSuperview];
		[self.view addSubview:self.doView.view];
		[self.view sendSubviewToBack:self.doView.view];
		self.currentViewController = self.doView;
		self.tabBar.selectedItem = doTab;
	}
	else if(self.dc.step == 6){
		if (self.doView == nil) {
			LicensesViewController* tempvc = [[LicensesViewController alloc] initWithNibName:@"LicensesViewController" bundle:nil];
			tempvc.dc = self.dc;
			tempvc.del = self;
			self.doView = tempvc;
			
			[tempvc release];
			
		}
		
		//[self.currentViewController.view removeFromSuperview];
		[self.view addSubview:self.doView.view];
		[self.view sendSubviewToBack:self.doView.view];
		self.currentViewController = self.doView;
		self.tabBar.selectedItem = doTab;
	}
	else if(self.dc.step == 7){
		if (self.doView == nil) {
			LicensesViewController* tempvc = [[LicensesViewController alloc] initWithNibName:@"LicensesViewController" bundle:nil];
			tempvc.dc = self.dc;
			tempvc.del = self;
			self.doView = tempvc;
			
			[tempvc release];
			
		}
		
		//[self.currentViewController.view removeFromSuperview];
		[self.view addSubview:self.doView.view];
		[self.view sendSubviewToBack:self.doView.view];
		self.currentViewController = self.doView;
		self.tabBar.selectedItem = doTab;
	}
	else if(self.dc.step == 8){
		if (self.doView == nil) {
			EmployeesViewController* tempvc = [[EmployeesViewController alloc] initWithNibName:@"EmployeesViewController" bundle:nil];
			tempvc.dc = self.dc;
			tempvc.del = self;
			self.doView = tempvc;
			
			[tempvc release];
			
		}
		
		//[self.currentViewController.view removeFromSuperview];
		[self.view addSubview:self.doView.view];
		[self.view sendSubviewToBack:self.doView.view];
		self.currentViewController = self.doView;
		self.tabBar.selectedItem = doTab;
	}
	
}

- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item{
	NSLog(@"TabBarSelected");
	
	if (item == self.doTab) {
		if (self.dc.step == 0) {
			if (self.doView == nil) {
				BusPlanViewController* tempvc = [[BusPlanViewController alloc] initWithNibName:@"BusPlanViewController" bundle:nil];
				tempvc.dc = self.dc;
				tempvc.del = self;
				self.doView = tempvc;
				
				[tempvc release];
				
			}
			
			[self.currentViewController.view removeFromSuperview];
			[self.view addSubview:self.doView.view];
			[self.view sendSubviewToBack:self.doView.view];
			self.currentViewController = self.doView;
			self.tabBar.selectedItem = doTab;
		}
		else if(self.dc.step == 1){
			if (self.doView == nil) {
				StartupCostsViewController* tempvc = [[StartupCostsViewController alloc] initWithNibName:@"StartupCostsViewController" bundle:nil];
				tempvc.dc = self.dc;
				tempvc.del = self;
				self.doView = tempvc;
				
				[tempvc release];
				
			}
			
			[self.currentViewController.view removeFromSuperview];
			[self.view addSubview:self.doView.view];
			[self.view sendSubviewToBack:self.doView.view];
			self.currentViewController = self.doView;
			self.tabBar.selectedItem = doTab;
		}
		
		else if(self.dc.step == 2){
			if (self.doView == nil) {
				LocationViewController* tempvc = [[LocationViewController alloc] initWithNibName:@"LocationViewController" bundle:nil];
				tempvc.dc = self.dc;
				tempvc.del = self;
				self.doView = tempvc;
				
				[tempvc release];
				
			}
			
			[self.currentViewController.view removeFromSuperview];
			[self.view addSubview:self.doView.view];
			[self.view sendSubviewToBack:self.doView.view];
			self.currentViewController = self.doView;
			self.tabBar.selectedItem = doTab;
		}
		
		else if(self.dc.step == 3){
			if (self.doView == nil) {
				MarketingViewController* tempvc = [[MarketingViewController alloc] initWithNibName:@"MarketingViewController" bundle:nil];
				tempvc.dc = self.dc;
				tempvc.del = self;
				self.doView = tempvc;
				
				[tempvc release];
				
			}
			
			[self.currentViewController.view removeFromSuperview];
			[self.view addSubview:self.doView.view];
			[self.view sendSubviewToBack:self.doView.view];
			self.currentViewController = self.doView;
			self.tabBar.selectedItem = doTab;
		}
		
		else if(self.dc.step == 4){
			if (self.doView == nil) {
				FinanceViewController* tempvc = [[FinanceViewController alloc] initWithNibName:@"FinanceViewController" bundle:nil];
				tempvc.dc = self.dc;
				tempvc.del = self;
				self.doView = tempvc;
				
				[tempvc release];
				
			}
			
			[self.currentViewController.view removeFromSuperview];
			[self.view addSubview:self.doView.view];
			[self.view sendSubviewToBack:self.doView.view];
			self.currentViewController = self.doView;
			self.tabBar.selectedItem = doTab;
		}
		

		else if(self.dc.step == 5){
			if (self.doView == nil) {
				LicensesViewController* tempvc = [[LicensesViewController alloc] initWithNibName:@"LicensesViewController" bundle:nil];
				tempvc.dc = self.dc;
				tempvc.del = self;
				self.doView = tempvc;
				
				[tempvc release];
				
			}
			
			[self.currentViewController.view removeFromSuperview];
			[self.view addSubview:self.doView.view];
			[self.view sendSubviewToBack:self.doView.view];
			self.currentViewController = self.doView;
			self.tabBar.selectedItem = doTab;
		}
		else if(self.dc.step == 6){
			if (self.doView == nil) {
				LicensesViewController* tempvc = [[LicensesViewController alloc] initWithNibName:@"LicensesViewController" bundle:nil];
				tempvc.dc = self.dc;
				tempvc.del = self;
				self.doView = tempvc;
				
				[tempvc release];
				
			}
			
			[self.currentViewController.view removeFromSuperview];
			[self.view addSubview:self.doView.view];
			[self.view sendSubviewToBack:self.doView.view];
			self.currentViewController = self.doView;
			self.tabBar.selectedItem = doTab;
		}
		else if(self.dc.step == 7){
			if (self.doView == nil) {
				LicensesViewController* tempvc = [[LicensesViewController alloc] initWithNibName:@"LicensesViewController" bundle:nil];
				tempvc.dc = self.dc;
				tempvc.del = self;
				self.doView = tempvc;
				
				[tempvc release];
				
			}
			
			[self.currentViewController.view removeFromSuperview];
			[self.view addSubview:self.doView.view];
			[self.view sendSubviewToBack:self.doView.view];
			self.currentViewController = self.doView;
			self.tabBar.selectedItem = doTab;
		}
		else if(self.dc.step == 8){
			if (self.doView == nil) {
				EmployeesViewController* tempvc = [[EmployeesViewController alloc] initWithNibName:@"EmployeesViewController" bundle:nil];
				tempvc.dc = self.dc;
				tempvc.del = self;
				self.doView = tempvc;
				
				[tempvc release];
				
			}
			
			[self.currentViewController.view removeFromSuperview];
			[self.view addSubview:self.doView.view];
			[self.view sendSubviewToBack:self.doView.view];
			self.currentViewController = self.doView;
			self.tabBar.selectedItem = doTab;
		}
		
		

		
	}
	
	if (item == self.calendarTab) {
		if (self.calView == nil) {
			CalendarViewController* tempvc = [[CalendarViewController alloc] initWithNibName:@"CalendarViewController" bundle:nil];
			tempvc.dc = self.dc;
			tempvc.delegate = self;
			self.calView = tempvc;
			
			[tempvc release];
			
		}
		
		[self.currentViewController.view removeFromSuperview];
		[self.view addSubview:self.calView.view];
		[self.view sendSubviewToBack:self.calView.view];
		self.currentViewController = self.calView;
		self.tabBar.selectedItem = calendarTab;
		
	}
	
	if (item == self.howToTab) {
		
			HelpViewController* tempvc = [[HelpViewController alloc] initWithNibName:@"HelpViewController" bundle:nil];
			tempvc.dc = self.dc;
		//	tempvc.delegate = self;
		//	self.calView = tempvc;
			
			
			
		
		
		[self.currentViewController.view removeFromSuperview];
		[self.view addSubview:tempvc.view];
		[self.view sendSubviewToBack:tempvc.view];
		self.currentViewController = tempvc;
		self.tabBar.selectedItem = howToTab;
		[tempvc release];
	}
	
	if (item == self.videosTab) {
		
			VideoViewController* tempvc = [[VideoViewController alloc] initWithNibName:@"VideoViewController" bundle:nil];
			//tempvc.dc = self.dc;
			//tempvc.delegate = self;
			//self.calView = tempvc;
			
		[self.currentViewController.view removeFromSuperview];
		[self.view addSubview:tempvc.view];
		[self.view sendSubviewToBack:tempvc.view];
		self.currentViewController = tempvc;
		self.tabBar.selectedItem = videosTab;
		[tempvc release];
	}
	
}



/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations.
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
	
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillDisappear:(BOOL)animated{
	
	[super viewWillDisappear:animated];
}


- (void)dealloc {
    [super dealloc];
}


@end
