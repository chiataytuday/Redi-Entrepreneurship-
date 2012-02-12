//
//  InputViewController.m
//  NewREDIApp
//
//  Created by Donnelly, Kevin P. (MU-Student) on 4/28/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "InputViewController.h"


@implementation InputViewController
@synthesize textView;
@synthesize dc;
@synthesize label;
@synthesize table;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)dealloc
{
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    textView.layer.cornerRadius = 10.0f;
	textView.text = [self.dc.db getDataForFieldName:self.dc.fieldName andBusID:self.dc.curBusID];
		[self.textView becomeFirstResponder];
	
	UIBarButtonItem *doneButton = [[UIBarButtonItem alloc ] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(done:)];
	
	self.navigationItem.hidesBackButton = YES;
	self.navigationItem.rightBarButtonItem = doneButton;
	
	if (self.dc.step == 3) {
		self.label.text = self.dc.fieldName;
	}
    // Do any additional setup after loading the view from its nib.
}
	 
	 -(void)done:(id)sender{
		 [textView resignFirstResponder];
		 if (textView.text != nil) {
			 [self.dc.db updateData:textView.text ForFieldName:self.dc.fieldName andBusID:self.dc.curBusID];
		 }
		 else {
			 [self.dc.db updateData:@"" ForFieldName:self.dc.fieldName andBusID:self.dc.curBusID];
		 }
		 
		 [table reloadData];
		 [self dismissModalViewControllerAnimated:YES];
		// [self.navigationController popViewControllerAnimated:YES];
	 }


- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
