//
//  HelpViewController.m
//  NewREDIApp
//
//  Created by Administrator on 5/3/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "HelpViewController.h"


@implementation HelpViewController


@synthesize dc;
@synthesize wView;
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
		//[wView loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"businessplan" ofType:@"html"]isDirectory:NO]]]
	}
	else if (self.dc.step == 1) {
		//[wView loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"startupcosts" ofType:@"html"]isDirectory:NO]]];
	}
	else if (self.dc.step == 2) {
		[wView loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"location" ofType:@"html"]isDirectory:NO]]];

	}
	else if (self.dc.step == 3) {
		[wView loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"marketing" ofType:@"html"]isDirectory:NO]]];
	}
	else if (self.dc.step == 4) {
		[wView loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"financing" ofType:@"html"]isDirectory:NO]]];
	}
	else if (self.dc.step == 5) {
		[wView loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"buslicensing" ofType:@"html"]isDirectory:NO]]];
	}
	else if (self.dc.step == 6) {
		[wView loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"permits" ofType:@"html"]isDirectory:NO]]];
	}
	else if (self.dc.step == 7) {
		[wView loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"legalstructure" ofType:@"html"]isDirectory:NO]]];
	}
	else if (self.dc.step == 8) {
		[wView loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"employees" ofType:@"html"]isDirectory:NO]]];
	}
	//[wView loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"buslicensing" ofType:@"html"]isDirectory:NO]]];

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


- (void)dealloc {
    [super dealloc];
}


@end
