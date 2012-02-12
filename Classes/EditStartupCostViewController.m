//
//  EditStartupCostViewController.m
//  NewREDIApp
//
//  Created by Administrator on 5/2/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "EditStartupCostViewController.h"


@implementation EditStartupCostViewController
@synthesize dc;
@synthesize neededtext;
@synthesize purchasedtext;
@synthesize table;
@synthesize label1;
@synthesize label2;
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
	
	if (self.dc.step == 4) {
		self.label1.text = @"Given Amount: $";
		self.label2.text = @"Need to Pay: $";
		Financing* fin = [self.dc.dcArray objectAtIndex:dc.finID];
		self.title = fin.title;
		
		self.neededtext.text = [NSString stringWithFormat:@"%d", fin.given];
		self.purchasedtext.text =[NSString stringWithFormat:@"%d", fin.payneeded];
	}
	else{
		self.neededtext.text = [NSString stringWithFormat:@"%d", self.dc.curStartupCost.needed];
		self.purchasedtext.text =[NSString stringWithFormat:@"%d", self.dc.curStartupCost.purchased];
	}
	[self.neededtext becomeFirstResponder];
	
	UIBarButtonItem *doneButton = [[UIBarButtonItem alloc ] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(done:)];
	
	self.navigationItem.hidesBackButton = YES;
	self.navigationItem.rightBarButtonItem = doneButton;
}

-(void)done:(id)sender{
	if (self.dc.step == 4) {
		NSInteger given;
		NSInteger payneeded;
		if (neededtext.text == nil) {
			given = 0;
		}
		else {
			given = [neededtext.text intValue];
		}
		if (purchasedtext.text == nil) {
			payneeded = 0;
		}
		else {
			payneeded = [purchasedtext.text intValue];
		}
		Financing* fin = [self.dc.dcArray objectAtIndex:dc.finID];
		[self.dc.db updateFinancing:fin.finID given:given payneeded:payneeded];
		self.dc.dcArray = [self.dc.db getFinancingforBusID:self.dc.curBusID];
	}
	else{
	if (neededtext.text != nil) {
		[self.dc.db updateNeeded:[neededtext.text intValue] ForStartupName:self.dc.curStartupCost.name andBusID:self.dc.curBusID];
	}
	else {
		[self.dc.db updateNeeded:0 ForStartupName:self.dc.curStartupCost.name andBusID:self.dc.curBusID];
	}
	if (purchasedtext.text != nil) {
		[self.dc.db updatePurchased:[purchasedtext.text intValue] ForStartupName:self.dc.curStartupCost.name andBusID:self.dc.curBusID];
	}
	else {
		[self.dc.db updatePurchased:0 ForStartupName:self.dc.curStartupCost.name andBusID:self.dc.curBusID];
	}
		self.dc.startupCosts = [self.dc.db getStartupCostsForBusID:self.dc.curBusID];
	}
	[self.table reloadData];
	[self dismissModalViewControllerAnimated:YES];
	// [self.navigationController popViewControllerAnimated:YES];
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
	self.dc.curStartupCost = nil;
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}


@end
