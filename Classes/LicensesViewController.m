//
//  LicensesViewController.m
//  NewREDIApp
//
//  Created by Administrator on 5/2/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "LicensesViewController.h"


@implementation LicensesViewController
@synthesize dc;
@synthesize table;
@synthesize del;

#pragma mark -
#pragma mark View lifecycle


- (void)viewDidLoad {
    [super viewDidLoad];
	self.dc.licenses = [self.dc.db getlicensesforBusID:self.dc.curBusID section:self.dc.step];
	self.table.allowsSelectionDuringEditing = YES;
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    UIBarButtonItem *anotherButton = [[UIBarButtonItem alloc] initWithTitle:@"Edit" style:UIBarButtonItemStylePlain target:self action:@selector(editButtonClicked:)];          
	self.del.navigationItem.rightBarButtonItem = anotherButton;
	[anotherButton release];
}

-(void)editButtonClicked:(id)sender{
	UIBarButtonItem* button = (UIBarButtonItem*)sender;
		if (button.title == @"Edit") {
		[self setEditing:YES animated:YES];
		NSUInteger arr[] = {0, [self.dc.licenses count]};
		NSIndexPath* path = [NSIndexPath indexPathWithIndexes:arr length:2];
		NSArray* array = [NSArray arrayWithObject:path];
		[self.table beginUpdates];
		[self.table insertRowsAtIndexPaths:array withRowAnimation:UITableViewRowAnimationTop];
		[self.table endUpdates];
		button.style = UIBarButtonItemStyleDone;
		button.title = @"Done";
	}
	else {
		[self setEditing:NO animated:YES];
		NSUInteger arr[] = {0, [self.dc.licenses count]};
		NSIndexPath* path = [NSIndexPath indexPathWithIndexes:arr length:2];
		NSArray* array = [NSArray arrayWithObject:path];
		[self.table beginUpdates];
		[self.table deleteRowsAtIndexPaths:array withRowAnimation:UITableViewRowAnimationTop];
		[self.table endUpdates];
		if ([self.dc.licenses count] == 0) {
			[self.table reloadData];
		}
		button.style = UIBarButtonItemStylePlain;
		button.title = @"Edit";
	}
	
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
	if (indexPath.section == 0) {
		if (indexPath.row == [self.dc.licenses count]) {
			return UITableViewCellEditingStyleInsert;
		}
		else {
			return UITableViewCellEditingStyleDelete;
		}
		
	}
	else {
		return UITableViewCellEditingStyleNone;
	}
	
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {

		return @"Click Edit to Add";
	
	
}


/*
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}
*/
/*
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}
*/
/*
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
}
*/
/*
- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
}
*/
/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations.
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/


#pragma mark -
#pragma mark Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    if (self.table.editing) {
		return [self.dc.licenses count] + 1;
	}
	return [self.dc.licenses count];
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
	if (indexPath.row == [self.dc.licenses count]) {
		cell.textLabel.text = @"Add New Item";
	}
	else {
		License* lic = [self.dc.licenses objectAtIndex:indexPath.row];
		cell.textLabel.text = lic.name;
		if (lic.obtained) {
			cell.accessoryType = UITableViewCellAccessoryCheckmark;
		}
		[lic release];
	}

    // Configure the cell...
    
    return cell;
}


- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
	return tableView.editing;
	
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
	
	if (editingStyle == UITableViewCellEditingStyleDelete) {
		
		
		License* lic = [self.dc.licenses objectAtIndex:indexPath.row];
		[self.dc.db deleteLicense:lic.licID];
		
		[self.dc.licenses removeObjectAtIndex:indexPath.row];
		
		NSArray* array = [NSArray arrayWithObject:indexPath];
		[tableView beginUpdates];
		[tableView deleteRowsAtIndexPaths:array withRowAnimation:NO];
		[tableView endUpdates];
		
	}
	if (editingStyle == UITableViewCellEditingStyleInsert) {
		AddLicenseViewController* temp = [[AddLicenseViewController alloc] initWithNibName:@"AddLicenseViewController" bundle:nil];
		temp.dc = self.dc;
		temp.licenseTable = self.table;
		[self.del.navigationController presentModalViewController:temp animated:YES];
		[temp release];
	}
	
	
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/


/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source.
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }   
}
*/


/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/


/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark -
#pragma mark Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	if ((indexPath.row == [self.dc.licenses count]) && tableView.editing == YES){
		[self tableView:tableView commitEditingStyle:UITableViewCellEditingStyleInsert forRowAtIndexPath:indexPath];
	}
	else if( tableView.editing == NO){
	
	License* lic = [self.dc.licenses objectAtIndex:indexPath.row];
	
	if (lic.obtained) {
		[self.dc.db updateLicense:lic.licID obtained:0];
		UITableViewCell* cell = [tableView cellForRowAtIndexPath:indexPath];
		lic.obtained = 0;
		cell.accessoryType = UITableViewCellAccessoryNone;
		
	}
	else {
		[self.dc.db updateLicense:lic.licID obtained:1];
		UITableViewCell* cell = [tableView cellForRowAtIndexPath:indexPath];
		lic.obtained = 1;
		cell.accessoryType = UITableViewCellAccessoryCheckmark;
	}
	
	
	}
	
	[tableView deselectRowAtIndexPath:indexPath animated:YES];
}


#pragma mark -
#pragma mark Memory management

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Relinquish ownership any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload {
    // Relinquish ownership of anything that can be recreated in viewDidLoad or on demand.
    // For example: self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}


@end

