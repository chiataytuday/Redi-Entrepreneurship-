//
//  EditLocationViewController.m
//  NewREDIApp
//
//  Created by Administrator on 5/3/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "EditLocationViewController.h"


@implementation EditLocationViewController
@synthesize add;
@synthesize titleField;
@synthesize address;
@synthesize notes;
@synthesize table;
@synthesize dc;

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


// Iplement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	if (add < [self.dc.dcArray count]) {
		Location* loc = [self.dc.dcArray objectAtIndex:add];
		
		self.titleField.text = loc.title;
		self.address.text = loc.address;
		self.notes.text = loc.notes;
		
	}
	
	address.layer.cornerRadius = 10.0f;
	notes.layer.cornerRadius = 10.0f;
	[self.titleField becomeFirstResponder];
	
	UIBarButtonItem *doneButton = [[UIBarButtonItem alloc ] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(done:)];
	
	self.navigationItem.hidesBackButton = YES;
	self.navigationItem.rightBarButtonItem = doneButton;
}

-(void)done:(id)sender{
	
	
	if (add < [self.dc.dcArray count]) {
		Location* loc = [self.dc.dcArray objectAtIndex:add];
		[self.dc.db updateLocation:loc.locID title:titleField.text address:address.text notes:notes.text];
	}
	else {
		[self.dc.db addLocationWithTitle:titleField.text busID:self.dc.curBusID address:address.text notes:notes.text];
	}

	self.dc.dcArray = [self.dc.db getLocationsforBusID:self.dc.curBusID];
	[self.table reloadData];
	[self dismissModalViewControllerAnimated:YES];
	// [self.navigationController popViewControllerAnimated:YES];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
	
	return @"Click Edit to Add";
	
	
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
