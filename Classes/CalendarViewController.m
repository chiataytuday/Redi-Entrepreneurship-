//
//  CalendarViewController.m
//  NewREDIApp
//
//  Created by Administrator on 4/6/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "CalendarViewController.h"


@implementation CalendarViewController

@synthesize dc;
@synthesize loadingView;
@synthesize service;
@synthesize calTable;
@synthesize calCell;
@synthesize detailvc;
@synthesize delegate;
@synthesize label;
@synthesize icon;

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
	static NSString *CellIdentifier = @"CalendarCell";
    NSLog(@"Inside cellForRowAtIndexPath");
    CalendarCell* cell = (CalendarCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        [[NSBundle mainBundle] loadNibNamed:@"CalendarCell" owner:self options:nil];
		cell = calCell;

    }
	

	NSString* key = [self.dc.keys objectAtIndex:indexPath.section];
	NSArray* eventsInMonth = [self.dc.monthToEvents objectForKey:key];
	
	GDataEntryEvent* event = [eventsInMonth objectAtIndex:indexPath.row];
	NSDate* dateAndTime = [[[[event times] objectAtIndex:0] startTime] date];
	NSDateFormatter* dateFormatter  = [[NSDateFormatter alloc] init];
	[dateFormatter setTimeStyle:NSDateFormatterShortStyle];
	cell.eventTime.text = [dateFormatter stringFromDate:dateAndTime ];
	
	
	[dateFormatter setDateFormat:@"EEE"];
	cell.eventDay.text = [dateFormatter stringFromDate:dateAndTime ];
	
	[dateFormatter setDateFormat:@"d"];
	cell.eventDate.text = [dateFormatter stringFromDate:dateAndTime ];
	cell.eventTitle.text= [[event title] stringValue];
	
	return cell;
	
		
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	NSString* key = [self.dc.keys objectAtIndex:indexPath.section];
	self.dc.selectedEvent = [[self.dc.monthToEvents objectForKey:key] objectAtIndex:indexPath.row];
	
	[delegate.navigationController pushViewController:self.detailvc animated:YES];
	[tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
	
	NSLog(@"Section %d title is %@",section,[self.dc.keys objectAtIndex:section]);
	return [self.dc.keys objectAtIndex:section];
}
/*
-(NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView{
		if (self.monthToEvents != nil) {
			NSArray* sectionTitles =[self.monthToEvents allKeys];
			return sectionTitles;
		}
		else {
			return nil;
		}

} */

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
	if (self.dc.monthToEvents != nil) {
		return [self.dc.monthToEvents count];
	}
	else {
		return 0;
	}
	
		
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
	if (self.dc.monthToEvents != nil) {
		NSString* key = [self.dc.keys objectAtIndex:section];
		NSArray* eventsInMonth = [self.dc.monthToEvents objectForKey:key];
		return [eventsInMonth count];
	}
	else {
		return 0;
	}

	
	
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
   
	self.service = [[GDataServiceGoogleCalendar alloc] init];

	
	
	NSURL *feedURL = [NSURL URLWithString:@"https://www.google.com/calendar/feeds/columbiamoredi%40gmail.com/public/full"];
	
	
	GDataQueryCalendar* query = [GDataQueryCalendar calendarQueryWithFeedURL:feedURL];
	[query setShouldQueryAllFutureEvents:YES];
	[query setOrderBy:@"starttime"];
	[query setIsAscendingOrder:YES];
	if (self.dc.step == 0) {
		[query setFullTextQueryString:@"*!*Business Plan*!*"];
	}
	else if (self.dc.step == 1) {
		[query setFullTextQueryString:@"*!*Startup Costs*!*"];
	}
	else if (self.dc.step == 2) {
		[query setFullTextQueryString:@"*!*Location*!*"];
	}
	else if (self.dc.step == 3) {
		[query setFullTextQueryString:@"*!*Marketing*!*"];
	}
	else if (self.dc.step == 4) {
		[query setFullTextQueryString:@"*!*Financing*!*"];
	}
	else if (self.dc.step == 5) {
		[query setFullTextQueryString:@"*!*Licenses*!*"];
	}
	else if (self.dc.step == 6) {
		[query setFullTextQueryString:@"*!*Permits*!*"];
	}
	else if (self.dc.step == 7) {
		[query setFullTextQueryString:@"*!*Legal Structure*!*"];
	}
	else if (self.dc.step == 8) {
		[query setFullTextQueryString:@"*!*Employees*!*"];
	}
	NSLog(@"step = %d" , self.dc.step);
	[service fetchFeedWithQuery:query
					   delegate:self
			  didFinishSelector:@selector(eventsTicket:finishedWithFeed:error:)];
	
	
	CalendarDetailViewController* tempvc = [[CalendarDetailViewController alloc] initWithNibName:@"CalendarDetailViewController" bundle:nil];
	tempvc.dc = self.dc;
	self.detailvc = tempvc;
	
	[tempvc release];
	
	

	[super viewDidLoad];	
}

-(void)eventsTicket:(GDataServiceTicket *)ticket finishedWithFeed:(GDataFeedEvent *)feed error:(NSError *)error {
	if (error == nil) {  
		NSLog(@"Inside finishedWithFeed no error");
		NSArray* eventEntries = [feed entries];
		[eventEntries retain];
		self.dc.keys =[[NSMutableArray alloc] initWithCapacity:1];
		NSLog(@"Setting monthToEvents");
		self.dc.monthToEvents = [[NSMutableDictionary alloc] initWithCapacity:1];
		NSLog(@"Finished Setting monthToEvents");
		
		
		NSDateFormatter* dateFormatter  = [[NSDateFormatter alloc] init];
		[dateFormatter retain];
		[dateFormatter setDateFormat:@"MMMM yyyy"];
		
		for (NSInteger i = 0; i < [eventEntries count]; i++) {
			NSLog(@"for iteration: %d", i+1);
			GDataEntryEvent* event = [eventEntries objectAtIndex:i];
			[event retain];
			if (event == nil) {
				NSLog(@"event is nil");
			}
			
			NSDate* dateAndTime = [[[[event times] objectAtIndex:0] startTime] date];
			[dateAndTime retain];
			if (dateAndTime == nil) {
				NSLog(@"dateAndTime is nil");
			}
			NSString* monthYear= [dateFormatter stringFromDate:dateAndTime ];
			[monthYear retain];
			if (monthYear == nil) {
				NSLog(@"monthYear is nil");
			}
			NSLog(@"monthYear = %@", monthYear);
			
			
			if ([self.dc.keys containsObject:monthYear]) {
				
				[[self.dc.monthToEvents objectForKey:monthYear] addObject:event];
				
			}
			else {
				NSMutableArray* monthEvents = [[NSMutableArray alloc] initWithCapacity:1];
				[monthEvents retain];
				[monthEvents addObject:event];
				[self.dc.keys addObject:monthYear];
				[self.dc.monthToEvents setObject:monthEvents forKey:monthYear];
				[monthEvents release];
				NSLog(@"Finished Else no error");
			}
			
			[event release];
			[dateAndTime release];
			[monthYear release];
		}
		
		[eventEntries release];
		[dateFormatter release]; 
	
		
		[calTable reloadData];
		loadingView.hidden = YES;
		calTable.hidden = NO;
	//	NSLog(@"exiting finished with Feed no error");
	}
	else {
		NSLog(@"fetch error: %@", error);
		self.label.text = @"Could not load Calendar. You may not be connected to the internet.";
		self.icon.hidden = YES;
	}
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
