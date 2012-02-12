//
//  AddLicenseViewController.m
//  NewREDIApp
//
//  Created by Administrator on 5/3/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "AddLicenseViewController.h"


@implementation AddLicenseViewController
@synthesize dc;
@synthesize label;
@synthesize txtField;
@synthesize licenseTable;

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
	[textField resignFirstResponder];
	if (self.dc.step == 4) {
		self.label.text = @"Financing Item";
	}
	
	
	if (textField.text != nil) {
		if (self.dc.step == 4) {
			[self.dc.db addFinancingWithTitle:textField.text busID:self.dc.curBusID];
			self.dc.dcArray = [self.dc.db getFinancingforBusID:self.dc.curBusID];		}
		else{
			[self.dc.db addLicenseWithName:textField.text busID:self.dc.curBusID section:self.dc.step];
			self.dc.licenses = [self.dc.db getlicensesforBusID:self.dc.curBusID section:self.dc.step];
		}
		 [self.licenseTable reloadData];
	}
	[self dismissModalViewControllerAnimated:YES];
	return NO;
}
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
	if (self.dc.step == 5) {
		self.label.text = @"Type of License";
	}
	else if (self.dc.step == 4) {
		self.label.text = @"Financing Item";
	}
	else if (self.dc.step == 6) {
		self.label.text = @"Type of Permit";
	}
	else if (self.dc.step == 7){
		self.label.text = @"Type of Legal Structure";

	}
	[self.txtField becomeFirstResponder];

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
