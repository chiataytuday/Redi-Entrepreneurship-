//
//  RootViewController.m
//  NewREDIApp
//
//  Created by Administrator on 4/6/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "RootViewController.h"


@implementation RootViewController

@synthesize dc;
@synthesize showMore;
@synthesize table;
@synthesize table2;
@synthesize calCell;
@synthesize event;
@synthesize calTable;
@synthesize calservice;
@synthesize videoTable;
@synthesize videoservice;

@synthesize video;
#pragma mark -
#pragma mark View lifecycle


- (void)viewDidLoad {
    [super viewDidLoad];

	
	DataController* data = [[DataController alloc] init];
	self.dc = data;
	[data release];
	self.table.allowsSelectionDuringEditing = YES;
	self.dc.rootTable = self.table;
	[self.table2 setSeparatorColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:1]];
	self.title = @"Entrep";
	
	self.calservice = [[GDataServiceGoogleCalendar alloc] init];
	
	
	
	NSURL *feedURL = [NSURL URLWithString:@"https://www.google.com/calendar/feeds/columbiamoredi%40gmail.com/public/full"];
	
	
	GDataQueryCalendar* query = [GDataQueryCalendar calendarQueryWithFeedURL:feedURL];
	[query setShouldQueryAllFutureEvents:YES];
	[query setOrderBy:@"starttime"];
	[query setIsAscendingOrder:YES];

	[calservice fetchFeedWithQuery:query
					   delegate:self
			  didFinishSelector:@selector(eventsTicket:finishedWithFeed:error:)];
	
	if ([self.dc.businesses count] < 5) {
		showMore = YES;
	}
	else {
		showMore = NO;
	}
	
	self.videoservice = [[GDataServiceGoogleYouTube alloc] init];
	
	NSURL *feedURL2 = [NSURL URLWithString:@"http://gdata.youtube.com/feeds/api/users/ColumbiaMOREDI/uploads"];
	
	GDataQueryYouTube* query2 = [GDataQueryYouTube queryWithFeedURL:feedURL2];

	[videoservice fetchFeedWithQuery:query2
					   delegate:self 
			  didFinishSelector:@selector(serviceTicket:finishedWithFeed:error:)];
	

	

	
	
	
	
	UIBarButtonItem *anotherButton = [[UIBarButtonItem alloc] initWithTitle:@"Edit" style:UIBarButtonItemStylePlain target:self action:@selector(editButtonClicked:)];          
	self.navigationItem.rightBarButtonItem = anotherButton;
	[anotherButton release];
	
	UIImageView* logo = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Entreptitle.png"]];
	self.navigationItem.titleView = logo;
	[logo release];
	
	UIBarButtonItem* backbutton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"Entrepbtn.png"] style:UIBarButtonItemStylePlain target:nil	action:nil];
	self.navigationItem.backBarButtonItem = backbutton;
	[backbutton release];
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)viewWillAppear:(BOOL)animated{

	self.navigationController.navigationBar.tintColor = [UIColor colorWithRed:0.2 green:0.2 blue:0.2 alpha:1];
	
	[super viewWillAppear:animated];
}
-(void)editButtonClicked:(id)sender{
	UIBarButtonItem* button = (UIBarButtonItem*)sender;
	if (showMore == NO) {
		[self showAllBusinesses];
	}
	
	if (button.title == @"Edit") {
		[self.table setEditing:YES animated:YES];
		NSUInteger arr[] = {0, [self.dc.businesses count]};
		NSIndexPath* path = [NSIndexPath indexPathWithIndexes:arr length:2];
		NSArray* array = [NSArray arrayWithObject:path];
		[self.table beginUpdates];
		[self.table insertRowsAtIndexPaths:array withRowAnimation:UITableViewRowAnimationTop];
		[self.table endUpdates];
		button.style = UIBarButtonItemStyleDone;
		button.title = @"Done";
	}
	else {
		[self.table setEditing:NO animated:YES];
		NSUInteger arr[] = {0, [self.dc.businesses count]};
		NSIndexPath* path = [NSIndexPath indexPathWithIndexes:arr length:2];
		NSArray* array = [NSArray arrayWithObject:path];
		[self.table beginUpdates];
		[self.table deleteRowsAtIndexPaths:array withRowAnimation:UITableViewRowAnimationTop];
		[self.table endUpdates];
		if ([self.dc.businesses count] == 0) {
			[self.table reloadData];
		}
		button.style = UIBarButtonItemStylePlain;
		button.title = @"Edit";
	}

}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
		if (indexPath.section == 0) {
			return tableView.editing;
		}
		else {
			return NO;
		}

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

-(void)eventsTicket:(GDataServiceTicket *)ticket finishedWithFeed:(GDataFeedEvent *)feed error:(NSError *)error {
	if (error == nil) {  
		NSLog(@"Finishedwithfeed");
		NSArray* eventEntries = [feed entries];
		[eventEntries retain];
		self.event = [eventEntries objectAtIndex:0];
		[calTable reloadData];
	}
	else {
		NSLog(@"fetch error: %@", error);

	}
}

- (void)serviceTicket:(GDataServiceTicket *)ticket finishedWithFeed:(GDataFeedBase *)feed error:(NSError *)error{
	if (error == nil) {
		self.video = [[feed entries] objectAtIndex:0];

		[self.videoTable reloadData];
	}
	else {
		NSLog(@"fetch error: %@", error);

	}
	
	
}

#pragma mark -
#pragma mark Table view data source

// Customize the number of sections in the table view.
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	
	return 1;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
	if(tableView == self.table){
		if ([self.dc.businesses count] == 0) {
			return @"My Businesses (Tap Edit to Add)";
		}
		return @"My Businesses";
	}
	else if (tableView == self.calTable){
		return @"Next Event";
	}
	else if (tableView == self.videoTable){
		return @"Newest Video";
	}
	else {
		return nil;
	}


}
/*
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
	return 38;
} */


// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSLog(@"innumrows");
	if (tableView == self.table) {

		if( [self.dc.businesses count] < 4 || showMore == YES) {
			if (self.table.editing) {
				return [self.dc.businesses count] + 1;
			}
			return [self.dc.businesses count];
		}
		else {
			return 4;
		}
	}
	if (tableView == self.table2) {
		return 3;
	}
	if (tableView == self.calTable){
		if(self.event != nil){
			return 1;
		
		}
		else{
			
			return 0;
			
		}
	}
	if (tableView == self.videoTable){
		if(self.video != nil){
			
			return 1;
			
		}
		else{
			
			return 0;
			
		}
	}

		
	
	return 0;
}



- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
	
	if (editingStyle == UITableViewCellEditingStyleDelete) {
		
		NSLog(@"Class: %@", NSStringFromClass( [self.dc.businesses class] ));
		[self.dc.businesses removeObjectAtIndex:indexPath.row];
		
			NSArray* array = [NSArray arrayWithObject:indexPath];
			[tableView beginUpdates];
			[tableView deleteRowsAtIndexPaths:array withRowAnimation:NO];
			[tableView endUpdates];
		
	}
	if (editingStyle == UITableViewCellEditingStyleInsert) {
		AddBusinessViewController* temp = [[AddBusinessViewController alloc] initWithNibName:@"AddBusinessViewController" bundle:nil];
		temp.dc = self.dc;
		[self.navigationController pushViewController:temp animated:YES];
		[temp release];
	}

	
}




// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    

	if(tableView == self.calTable){
		static NSString *CellIdentifier = @"CalendarCell2";
		
		CalendarCell* cell = (CalendarCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
		if (cell == nil) {
			[[NSBundle mainBundle] loadNibNamed:@"CalendarCell2" owner:self options:nil];
			cell = calCell;
			
		}
		if (event == nil) {
			return cell;
		}
		NSDate* dateAndTime = [[[[event times] objectAtIndex:0] startTime] date];
		NSDateFormatter* dateFormatter  = [[NSDateFormatter alloc] init];

		
		
		[dateFormatter setDateFormat:@"MMM"];
		cell.eventDay.text = [dateFormatter stringFromDate:dateAndTime ];
		
		[dateFormatter setDateFormat:@"d"];
		cell.eventDate.text = [dateFormatter stringFromDate:dateAndTime ];
		cell.eventTitle.text= [[event title] stringValue];
		
		return cell;
	}
	
	if (tableView == self.videoTable) {
		static NSString *CellIdentifier = @"VideoCell";
		
		UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
		if (cell == nil) {
			cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier] autorelease];
		}
		
		if (self.video == nil) {
			return cell;
		}

		NSInteger seconds = [[[video mediaGroup] duration] intValue];
		NSInteger hours = 0;
		NSInteger minutes = 0;
		NSString* videolength;
		if (seconds >= 3600) {
			hours = seconds / 3600;
			seconds -= hours*3600;
		}
		minutes = seconds / 60;
		seconds -= minutes * 60;
		if (hours > 0) {
			videolength = [NSString stringWithFormat:@"Duration: %d:%.2d:%.2d",hours,minutes,seconds];
		}
		else {
			videolength = [NSString stringWithFormat:@"Duration: %d:%.2d",minutes,seconds];
		}
		
		//cell.imageView.image = img;
		cell.textLabel.text = [[video title] stringValue];
		cell.detailTextLabel.text = videolength;
		
		cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
		return cell;
		
	}
	
	static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
	// Configure the cell.
	if (tableView == self.table) {
		if (indexPath.row == 3 && showMore == NO && [self.dc.businesses count] != 4) {
			cell.textLabel.text = @"Show All Businesses";
			return cell;
		}
		else if (indexPath.row == [self.dc.businesses count]) {
			cell.textLabel.text = @"Add New Business";
			return cell;
		}
		else {
			cell.textLabel.text = [self.dc.businesses objectAtIndex:indexPath.row];

		}
	
	}
	if (tableView == self.table2) {
		switch (indexPath.row) {
			case 0:
				cell.textLabel.text = @"All Events";
				break;
			case 1:
				cell.textLabel.text = @"All Videos";
				break;
			case 2:
				cell.textLabel.text = @"About the App";
				break;
			default:
				cell.textLabel.text = @"Should Not See";
				break;
		}
		cell.backgroundColor = [UIColor colorWithRed:.6 green:.6 blue:1 alpha:1];
		cell.contentView.backgroundColor = [UIColor clearColor];
	}
	
	cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;


    return cell;
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
	if (tableView == self.table) {
		if (indexPath.row == [self.dc.businesses count]) {
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
    
//	[self.tabViewController setTitle:[self.pages objectAtIndex:indexPath.row]];
//	 [self.navigationController pushViewController:self.tabViewController animated:YES];
	
	if (tableView == self.table  && indexPath.row == 3 && showMore == NO && [self.dc.businesses count] != 4 && tableView.editing == NO) {
		[self showAllBusinesses];
	}
	else if (tableView == self.table && indexPath.row == [self.dc.businesses count] && tableView.editing == YES){
		[self tableView:tableView commitEditingStyle:UITableViewCellEditingStyleInsert forRowAtIndexPath:indexPath];
	}
	else if (tableView == self.table && tableView.editing == NO){
		self.dc.curBusID = [self.dc.businesses busIDatIndex:indexPath.row];
		StepsViewController* stepsvc = [[StepsViewController alloc] initWithNibName:@"StepsViewController" bundle:nil];
		stepsvc.dc = self.dc;
		NSString* busName = [self.dc.businesses objectAtIndex:indexPath.row];
		NSLog(@"busName = %@", busName);
		[stepsvc setTitle:busName];
		[self.navigationController pushViewController:stepsvc animated:YES];
		
		[stepsvc release];
	}
	
	if(tableView == self.table2 && indexPath.row == 0){
	CalendarViewController* calendarvc = [[CalendarViewController alloc] initWithNibName:@"CalendarViewController" bundle:nil];
		calendarvc.dc = self.dc;
		calendarvc.delegate = calendarvc;
		[self.navigationController pushViewController:calendarvc animated:YES];
		[calendarvc release];
	}
	if(tableView == self.table2 && indexPath.row == 1){
		VideoViewController* videovc = [[VideoViewController alloc] initWithNibName:@"VideoViewController" bundle:nil];
		videovc.dc = self.dc;
		[self.navigationController pushViewController:videovc animated:YES];
		[videovc release];
	}
	if(tableView ==self.calTable){
		CalendarDetailViewController *detailViewController = [[CalendarDetailViewController alloc] initWithNibName:@"CalendarDetailViewController" bundle:nil];
		self.dc.selectedEvent = self.event;
		detailViewController.dc = self.dc;

		[self.navigationController pushViewController:detailViewController animated:YES];
		[detailViewController release];
	}
	
	if(tableView == self.videoTable){
		GDataYouTubeMediaGroup *mediaGroup = [video mediaGroup]; 
		NSArray *mediaContents = [mediaGroup mediaContents]; 
		NSNumber *flashFormatNum = [NSNumber numberWithInt:5]; 
		GDataMediaContent *flashContent; 
		flashContent = [GDataUtilities firstObjectFromArray:mediaContents 
												  withValue:flashFormatNum 
												 forKeyPath:@ 
						"youTubeFormatNumber"]; 
		NSString* videoURL;
		if (flashContent != nil) { 
			videoURL= [flashContent URLString]; 
		} 
		else {
			NSLog(@"Error getting video URL");
		}
		
		
		NSString *htmlString = [NSString stringWithFormat:@"<html><head><meta name = \"viewport\" content = \"initial-scale = 1.0, user-scalable = no, width = 212\"/></head><body style=\"background:#FFF;margin-top:0px;margin-left:0px\"><div><object width=\"212\" height=\"172\"><param name=\"movie\" value=\"%@\"></param><param name=\"wmode\" value=\"transparent\"></param><embed src=\"%@\" type=\"application/x-shockwave-flash\" wmode=\"transparent\" width=\"212\" height=\"172\"></embed></object></div></body></html>", videoURL,videoURL];
		NSLog(@"%@", htmlString);
		
		WebViewController* tempwebvc = [[[WebViewController alloc] initWithNibName:@"WebViewController" bundle:nil] autorelease];
		tempwebvc.dc = self.dc;
		self.dc.vURL = htmlString;
		//[self.webvc.webView loadHTMLString:htmlString baseURL:[NSURL URLWithString:@"http://www.google.com"]];
		[self.navigationController pushViewController:tempwebvc animated:YES];
		
	}
	
	[tableView deselectRowAtIndexPath:indexPath animated:YES];
	 
	 
}

-(void)showAllBusinesses{
	showMore = YES;
	//[tableView reloadData];
	NSMutableArray* array = [NSMutableArray arrayWithCapacity:1];
	[array retain];
	NSUInteger arr[] = {0, 3};
	NSIndexPath* path = [NSIndexPath indexPathWithIndexes:arr length:2];
	[array addObject:path];
	[self.table beginUpdates];
	[self.table deleteRowsAtIndexPaths:array withRowAnimation:NO];
	
	for (NSInteger i = 4; i < [self.dc.businesses count]; i++) {
		NSUInteger arr[] = {0, i};
		NSIndexPath* path = [NSIndexPath indexPathWithIndexes:arr length:2];
		[array addObject:path];
	}
	
	
	[self.table insertRowsAtIndexPaths:array withRowAnimation:UITableViewRowAnimationTop];
	[self.table endUpdates];
	//[tableView reloadData];
	[array release];	
}


#pragma mark -
#pragma mark Memory management

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Relinquish ownership any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    // Relinquish ownership of anything that can be recreated in viewDidLoad or on demand.
    // For example: self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}


@end

