//
//  EditEmployeeViewController.m
//  NewREDIApp
//
//  Created by Administrator on 5/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "EditEmployeeViewController.h"


@implementation EditEmployeeViewController

@synthesize add;
@synthesize nameField;
@synthesize salary;
@synthesize desc;
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
		Employee* emp = [self.dc.dcArray objectAtIndex:add];
		
		self.nameField.text = emp.name;
		self.salary.text = emp.salary;
		self.desc.text = emp.desc;
		
	}
	
	desc.layer.cornerRadius = 10.0f;
	[self.nameField becomeFirstResponder];
	
	UIBarButtonItem *doneButton = [[UIBarButtonItem alloc ] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(done:)];
	
	self.navigationItem.hidesBackButton = YES;
	self.navigationItem.rightBarButtonItem = doneButton;
}

-(void)done:(id)sender{
	
	
	if (add < [self.dc.dcArray count]) {
		Employee* emp = [self.dc.dcArray objectAtIndex:self.add];
		[self.dc.db updateEmployee:emp.empID name:nameField.text salary:salary.text desc:desc.text];
	}
	else {
		[self.dc.db addEmployeeWithName:nameField.text busID:self.dc.curBusID salary:salary.text desc:desc.text];
	}
	
	self.dc.dcArray = [self.dc.db getEmployeesforBusID:self.dc.curBusID];
	[self.table reloadData];
	[self dismissModalViewControllerAnimated:YES];
	// [self.navigationController popViewControllerAnimated:YES];
}
/*
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
	
	return @"Click Edit to Add Employee";
	
	
} */




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