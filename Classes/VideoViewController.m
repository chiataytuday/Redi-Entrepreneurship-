//
//  VideoViewController.m
//  NewREDIApp
//
//  Created by Administrator on 4/14/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "VideoViewController.h"


@implementation VideoViewController

@synthesize service;
@synthesize videos;
@synthesize dc;
@synthesize loadingView;
@synthesize videosTable;

@synthesize label;
@synthesize icon;

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"VideoCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier] autorelease];
	}
	
	GDataEntryYouTubeVideo* video = [self.videos objectAtIndex:indexPath.row];
	


	
	NSData* imgdata = [NSData dataWithContentsOfURL:[NSURL URLWithString: [[[[video mediaGroup] mediaThumbnails] objectAtIndex:1] URLString]]];
	UIImage* img = [UIImage imageWithData:imgdata];
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

	cell.imageView.image = img;
	cell.textLabel.text = [[video title] stringValue];
	cell.detailTextLabel.text = videolength;

	cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
	return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
	return 64;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
	return [videos count];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	GDataEntryYouTubeVideo* video = [self.videos objectAtIndex:indexPath.row];
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

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	
	self.service = [[GDataServiceGoogleYouTube alloc] init];
	
	NSURL *feedURL = [NSURL URLWithString:@"http://gdata.youtube.com/feeds/api/users/ColumbiaMOREDI/uploads"];

	GDataQueryYouTube* query = [GDataQueryYouTube queryWithFeedURL:feedURL];
	
	if (self.dc.step == 0) {
		GDataCategoryFilter* filter = [GDataCategoryFilter categoryFilter];
		GDataCategory* category = [GDataCategory categoryWithScheme:@"http://gdata.youtube.com/schemas/2007/keywords.cat" term:@"Business Plan"];
		
		[filter addCategory:category];
		[query addCategoryFilter:filter];	}
	else if (self.dc.step == 1) {
		GDataCategoryFilter* filter = [GDataCategoryFilter categoryFilter];
		GDataCategory* category = [GDataCategory categoryWithScheme:@"http://gdata.youtube.com/schemas/2007/keywords.cat" term:@"Startup Costs"];
		
		[filter addCategory:category];
		[query addCategoryFilter:filter];
	}
	else if (self.dc.step == 2) {
		GDataCategoryFilter* filter = [GDataCategoryFilter categoryFilter];
		GDataCategory* category = [GDataCategory categoryWithScheme:@"http://gdata.youtube.com/schemas/2007/keywords.cat" term:@"Location"];
		
		[filter addCategory:category];
		[query addCategoryFilter:filter];
	}
	else if (self.dc.step == 3) {
		GDataCategoryFilter* filter = [GDataCategoryFilter categoryFilter];
		GDataCategory* category = [GDataCategory categoryWithScheme:@"http://gdata.youtube.com/schemas/2007/keywords.cat" term:@"Marketing"];
		
		[filter addCategory:category];
		[query addCategoryFilter:filter];
	}
	else if (self.dc.step == 4) {
		GDataCategoryFilter* filter = [GDataCategoryFilter categoryFilter];
		GDataCategory* category = [GDataCategory categoryWithScheme:@"http://gdata.youtube.com/schemas/2007/keywords.cat" term:@"Financing"];
		
		[filter addCategory:category];
		[query addCategoryFilter:filter];
	}
	else if (self.dc.step == 5) {
		GDataCategoryFilter* filter = [GDataCategoryFilter categoryFilter];
		GDataCategory* category = [GDataCategory categoryWithScheme:@"http://gdata.youtube.com/schemas/2007/keywords.cat" term:@"Licenses"];
		
		[filter addCategory:category];
		[query addCategoryFilter:filter];
	}
	else if (self.dc.step == 6) {
		GDataCategoryFilter* filter = [GDataCategoryFilter categoryFilter];
		GDataCategory* category = [GDataCategory categoryWithScheme:@"http://gdata.youtube.com/schemas/2007/keywords.cat" term:@"Permits"];
		
		[filter addCategory:category];
		[query addCategoryFilter:filter];
	}
	else if (self.dc.step == 7) {
		GDataCategoryFilter* filter = [GDataCategoryFilter categoryFilter];
		GDataCategory* category = [GDataCategory categoryWithScheme:@"http://gdata.youtube.com/schemas/2007/keywords.cat" term:@"Legal Structure"];
		
		[filter addCategory:category];
		[query addCategoryFilter:filter];
	}
	else if (self.dc.step == 8) {
		GDataCategoryFilter* filter = [GDataCategoryFilter categoryFilter];
		GDataCategory* category = [GDataCategory categoryWithScheme:@"http://gdata.youtube.com/schemas/2007/keywords.cat" term:@"Employees"];
		
		[filter addCategory:category];
		[query addCategoryFilter:filter];
	}

	[service fetchFeedWithQuery:query
					   delegate:self 
			  didFinishSelector:@selector(serviceTicket:finishedWithFeed:error:)];
	

	
	
}

- (void)serviceTicket:(GDataServiceTicket *)ticket finishedWithFeed:(GDataFeedBase *)feed error:(NSError *)error{
	if (error == nil) {
		self.videos = [feed entries];
		self.videosTable.hidden = NO;
		self.loadingView.hidden = YES;
		[self.videosTable reloadData];
	}
	else {
		NSLog(@"fetch error: %@", error);
		self.label.text = @"Could not load Videos. You may not be connected to the internet.";
		self.icon.hidden = YES;
	}

	
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
