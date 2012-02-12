//
//  CalendarDetailViewController.m
//  NewREDIApp
//
//  Created by Donnelly, Kevin P. (MU-Student) on 4/12/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "CalendarDetailViewController.h"


@implementation CalendarDetailViewController
@synthesize dc;
@synthesize table;
@synthesize detailCell;

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
	return 4;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
	return 1;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
	switch (section) {
		case 0:
			return @"What";
			break;
		case 1:
			return @"When";
			break;
		case 2:
			return @"Where";
			break;
		case 3:
			return @"Description";
			break;
		default:
			break;
	}
	return @"";
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
	if (indexPath.section == 3) {
		return 100;
	}
	else {
		return 44;
	}

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"CalDetailCell";
	
	if (indexPath.section == 3) {
		CalDetailCell* cell = (CalDetailCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
		if (cell == nil) {
			[[NSBundle mainBundle] loadNibNamed:@"calDetailCell" owner:self options:nil];
			cell = detailCell;
		
		}
		
		NSString* temp = [[self.dc.selectedEvent content] stringValue];
		NSArray* tempa = [temp componentsSeparatedByString:@"*!*"];
		
		
		cell.textView.text=[tempa objectAtIndex:0];
		return cell;
	}
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
	
	if (indexPath.section == 0) {
		cell.textLabel.text=[[self.dc.selectedEvent title] stringValue];
	}
	if (indexPath.section == 1) {
		NSDate* dateAndTime = [[[[self.dc.selectedEvent times] objectAtIndex:0] startTime] date];
		NSDateFormatter* dateFormatter  = [[NSDateFormatter alloc] init];
		[dateFormatter setTimeStyle:NSDateFormatterShortStyle];
		[dateFormatter setDateStyle:NSDateFormatterLongStyle];
		cell.textLabel.text = [dateFormatter stringFromDate:dateAndTime ];
	}
	if (indexPath.section ==2) {
		cell.textLabel.text = [[[self.dc.selectedEvent locations]objectAtIndex:0] stringValue];
	}
	if (indexPath.section == 3) {
		NSString* temp = [[self.dc.selectedEvent content] stringValue];
		NSArray* tempa = [temp componentsSeparatedByString:@"*!*"];
		
		
		cell.textLabel.text=[tempa objectAtIndex:0];
		
	}
	return cell;

	
}

- (void)viewWillAppear:(BOOL)animated{
	[self.table reloadData];
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

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}
*/

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
