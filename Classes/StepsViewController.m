//
//  StepsViewController.m
//  NewREDIApp
//
//  Created by Administrator on 4/9/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "StepsViewController.h"


@implementation StepsViewController
@synthesize pages;
@synthesize tabViewController;
@synthesize dc;
@synthesize chkcell;
@synthesize table;

// Customize the number of sections in the table view.
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.pages count];
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
   	static NSString *CellIdentifier = @"CheckmarkCell";
    CheckmarkCell* cell = (CheckmarkCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        [[NSBundle mainBundle] loadNibNamed:@"CheckmarkCell" owner:self options:nil];
		cell = chkcell;
		
    }
    
	// Configure the cell.
	cell.textLabel.text = [self.pages objectAtIndex:indexPath.row];
	cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
	if ([self.dc.db getCheckedForFieldName:[self.pages objectAtIndex:indexPath.row] andBusID:self.dc.curBusID] == 1) {
		cell.checkmark.selected = YES;

	}
	else {
		cell.checkmark.selected = NO;
	}

	
	
    return cell;
}

-(IBAction)buttonClicked:(UIButton *)sender{
	
	NSIndexPath* indexPath = [self.table indexPathForCell:(UITableViewCell*)[[sender superview]superview]];
	
	if (sender.selected == YES) {
		NSLog(@"uncheck!");
		[self.dc.db updateChecked:0 ForFieldName:[self.pages objectAtIndex:indexPath.row] andBusID:self.dc.curBusID];
		sender.selected = NO;
	}
	else {
		[self.dc.db updateChecked:1 ForFieldName:[self.pages objectAtIndex:indexPath.row] andBusID:self.dc.curBusID];
		sender.selected = YES;

	}
	
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
	self.dc.step = indexPath.row;
	TabViewController* temptab = [[TabViewController alloc] initWithNibName:@"TabViewController" bundle:nil];
	temptab.dc = self.dc;
	[temptab setTitle:[self.pages objectAtIndex:indexPath.row]];
	[self.navigationController pushViewController:temptab animated:YES];
	[temptab release];
	[tableView deselectRowAtIndexPath:indexPath animated:YES];

	
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
	/* TabViewController* temptab = [[TabViewController alloc] initWithNibName:@"TabViewController" bundle:nil];
	temptab.dc = self.dc;
	self.tabViewController = temptab;
	[temptab release]; */
	
	//UIBarButtonItem* btn = [[UIBarButtonItem alloc] initWithTitle:@"Test" style:UIBarButtonItemStylePlain target:nil action:nil];
	//UIBarButtonItem* backbutton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"Entrepbtn.png"] style:UIBarButtonItemStylePlain target:self.navigationController	action:@selector(popViewControllerAnimated:)];
	//self.navigationItem.leftBarButtonItem = backbutton;
	//[backbutton release];
	
	self.navigationItem.backBarButtonItem.title = @"Back";
	
	NSArray* array = [self.dc.db getStepsforBusID:self.dc.curBusID];
	self.pages = array;
	[array release];
	
    [super viewDidLoad];
}



/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations.
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/
- (void)viewWillAppear:(BOOL)animated{
	self.dc.step = -1;
	self.navigationController.navigationBar.tintColor = [UIColor colorWithRed:.1333 green:.2784 blue:.5176 alpha:1];

	[super viewWillAppear:animated];
}


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
