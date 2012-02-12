//
//  DatabaseController.m
//  NewREDIApp
//
//  Created by Administrator on 4/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "DatabaseController.h"


@implementation DatabaseController
@synthesize databaseName;
@synthesize databasePath;
@synthesize database;

-(DatabaseController *)init{
	[super init];
	
	// Setup some globals
	databaseName = @"REDIDatabase.sql";
	
	// Get the path to the documents directory and append the databaseName
	NSArray *documentPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	NSString *documentsDir = [documentPaths objectAtIndex:0];
	databasePath = [documentsDir stringByAppendingPathComponent:databaseName];
	
	[self checkAndCreateDatabase];
	
	if(sqlite3_open([databasePath UTF8String], &database) == SQLITE_OK){
		NSLog(@"***OPENED DATABASE***");
	}
	
	return self;
	
}

-(void) checkAndCreateDatabase{
	// Check if the SQL database has already been saved to the users phone, if not then copy it over
	BOOL success;
	
	// Create a FileManager object, we will use this to check the status
	// of the database and to copy it over if required
	NSFileManager *fileManager = [NSFileManager defaultManager];
	
	// Check if the database has already been created in the users filesystem
	success = [fileManager fileExistsAtPath:databasePath];
	
	// If the database already exists then return without doing anything
	if(success) return;
	
	// If not then proceed to copy the database from the application to the users filesystem
	
	// Get the path to the database in the application package
	NSString *databasePathFromApp = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:databaseName];
	
	// Copy the database from the package to the users filesystem
	[fileManager copyItemAtPath:databasePathFromApp toPath:databasePath error:nil];
	
	[fileManager release];
}

-(void)deleteBusinessWithID:(NSInteger)busID{
	
	sqlite3_stmt *delStmt = nil;
	const char *sql = "delete from businesses where id = ?";
	if(sqlite3_prepare_v2(database, sql, -1, &delStmt, NULL) != SQLITE_OK)
		NSLog( @"Error while creating delete statement. '%s'", sqlite3_errmsg(database));
	
	
	sqlite3_bind_int(delStmt, 1, busID);
	
	
	if(SQLITE_DONE != sqlite3_step(delStmt))
		NSLog( @"Error while deleting data. '%s'", sqlite3_errmsg(database));
	else{
		
	}
	
	
	//Reset the add statement.
	sqlite3_reset(delStmt);

}

-(void)addBusinessWithName:(NSString*)name{
	


	
		sqlite3_stmt *addStmt = nil;
		const char *sql = "insert into businesses(name) Values(?)";
		if(sqlite3_prepare_v2(database, sql, -1, &addStmt, NULL) != SQLITE_OK)
			NSLog( @"Error while creating add statement. '%s'", sqlite3_errmsg(database));
	
	
	sqlite3_bind_text(addStmt, 1, [name UTF8String], -1, SQLITE_TRANSIENT);

	
	if(SQLITE_DONE != sqlite3_step(addStmt))
		NSLog( @"Error while inserting data. '%s'", sqlite3_errmsg(database));
	else{
		NSInteger tID;
		const char *sqlStatement = "select id from businesses order by id desc limit 1";
		sqlite3_stmt *compiledStatement;
		if(sqlite3_prepare_v2(database, sqlStatement, -1, &compiledStatement, NULL) == SQLITE_OK) {
			
			
			// Loop through the results and add them to the feeds array
			while(sqlite3_step(compiledStatement) == SQLITE_ROW) {
				
				// Read the data from the result row
				tID = sqlite3_column_int(compiledStatement, 0);
				NSLog(@"tID in add business = %d", tID);
			}
			sqlite3_finalize(compiledStatement);
	
			sqlite3_reset(addStmt);
			NSArray* steps= [NSArray arrayWithObjects:@"Business Plan",@"Startup Costs",@"Location",@"Marketing",@"Financing",@"Licenses",@"Permits",@"Legal Structure",@"Employees",nil];
			NSInteger i = 0;
			for (i; i < [steps count]; i++) {
				NSString* fieldName = [steps objectAtIndex:i];
				sqlite3_stmt *addStmt = nil;
				const char *sql = "insert into Steps(stepName,busID, checked) Values(?,?, 0 )";
				if(sqlite3_prepare_v2(database, sql, -1, &addStmt, NULL) != SQLITE_OK)
					NSLog( @"Error while creating add statement. '%s'", sqlite3_errmsg(database));
				
				
				sqlite3_bind_text(addStmt, 1, [fieldName UTF8String], -1, SQLITE_TRANSIENT);
				sqlite3_bind_int(addStmt, 2, tID);
				if(SQLITE_DONE != sqlite3_step(addStmt))
					NSLog( @"Error while inserting data. '%s'", sqlite3_errmsg(database));
				else{
				}
				sqlite3_reset(addStmt);
			}
				
			
	sqlite3_reset(addStmt);
	NSArray* partsofPlan= [[NSArray arrayWithObjects:@"Business Type",@"Office Needed",@"Personnel Needed",@"Professional Services",@"Future Plans",@"Customers",@"Industry Trends",@"Competition",@"Advantages",@"Disadvantages",nil] retain];
		 i = 0;
		for (i; i < [partsofPlan count]; i++) {
			NSString* fieldName = [partsofPlan objectAtIndex:i];
			sqlite3_stmt *addStmt = nil;
			const char *sql = "insert into inputFields(fieldName,busID, section) Values(?,?, 0 )";
			if(sqlite3_prepare_v2(database, sql, -1, &addStmt, NULL) != SQLITE_OK)
				NSLog( @"Error while creating add statement. '%s'", sqlite3_errmsg(database));
			
			
			sqlite3_bind_text(addStmt, 1, [fieldName UTF8String], -1, SQLITE_TRANSIENT);
			sqlite3_bind_int(addStmt, 2, tID);
			if(SQLITE_DONE != sqlite3_step(addStmt))
				NSLog( @"Error while inserting data. '%s'", sqlite3_errmsg(database));
			else{
			}
			sqlite3_reset(addStmt);
		}
		[partsofPlan release];
			
			NSArray* startupCosts= [[NSArray arrayWithObjects:@"Legal",@"Accounting",@"Transportation",@"Tools",@"Furniture",@"Machines",@"Buildings",@"Building Upgrades",@"Starting Inventory",@"Working Capital",@"Living Expenses",@"Other",nil] retain];
			i = 0;
			for (i = 0; i < [startupCosts count]; i++) {
				NSString* fieldName = [startupCosts objectAtIndex:i];
				sqlite3_stmt *addStmt = nil;
				const char *sql = "insert into startupCosts(Name,busID,Needed,Purchased) Values(?,?,0,0)";
				if(sqlite3_prepare_v2(database, sql, -1, &addStmt, NULL) != SQLITE_OK)
					NSLog( @"Error while creating add statement. '%s'", sqlite3_errmsg(database));
				
				
				sqlite3_bind_text(addStmt, 1, [fieldName UTF8String], -1, SQLITE_TRANSIENT);
				sqlite3_bind_int(addStmt, 2, tID);
				if(SQLITE_DONE != sqlite3_step(addStmt))
					NSLog( @"Error while inserting data. '%s'", sqlite3_errmsg(database));
				else{
				}
				sqlite3_reset(addStmt);
			}
			[startupCosts release];
	
		
		NSArray* marketingQs = [[NSArray arrayWithObjects:@"Who are your customers?",@"What specific market will you target?",@"How are your customers/markets segmented?",@"Are your markets growing?",@"Is your market share growing?",@"How will you obtain your market share?",@"How will you promote your business?",@"What pricing strategy have you devised?",nil] retain];
		i = 0;
		for (i; i < [marketingQs count]; i++) {
			NSString* fieldName = [marketingQs objectAtIndex:i];
			sqlite3_stmt *addStmt = nil;
			const char *sql = "insert into inputFields(fieldName,busID, section) Values(?,?, 3)";
			if(sqlite3_prepare_v2(database, sql, -1, &addStmt, NULL) != SQLITE_OK)
				NSLog( @"Error while creating add statement. '%s'", sqlite3_errmsg(database));
			
			
			sqlite3_bind_text(addStmt, 1, [fieldName UTF8String], -1, SQLITE_TRANSIENT);
			sqlite3_bind_int(addStmt, 2, tID);
			if(SQLITE_DONE != sqlite3_step(addStmt))
				NSLog( @"Error while inserting data. '%s'", sqlite3_errmsg(database));
			else{
			}
			sqlite3_reset(addStmt);
		}
		[marketingQs release];

	
	//Reset the add statement.
	sqlite3_reset(addStmt);
	

		}
		}
}

-(NSMutableArray *)getBusinesses {
	// Setup the database object
	
	
	// Init the Array
	NSMutableArray* businesses = [[NSMutableArray alloc] init];
	
	// Open the database from the users filessytem
	
		
		// Setup the SQL Statement and compile it for faster access
		const char *sqlStatement = "select * from businesses";
		sqlite3_stmt *compiledStatement;
		if(sqlite3_prepare_v2(database, sqlStatement, -1, &compiledStatement, NULL) == SQLITE_OK) {
			
			
			// Loop through the results and add them to the feeds array
			while(sqlite3_step(compiledStatement) == SQLITE_ROW) {
				
				// Read the data from the result row
				NSInteger tID = sqlite3_column_int(compiledStatement, 0);
				NSLog(@"tID = %d", tID);
				char *cName = (char *)sqlite3_column_text(compiledStatement, 1);
				NSString *tName;
				if (cName == nil) {
					
					tName = @"cName was null";
				}
				else {
					
					tName = [NSString stringWithUTF8String:cName];
				}

				
				
				
				// Create a new animal object with the data from the database
				Business* business = [[Business alloc] initWithID:tID Name:tName];
				
				// Add the animal object to the animals Array
				[businesses addObject:business];
				
				[business release];
			}
		}
		// Release the compiled statement from memory
		sqlite3_finalize(compiledStatement);
		
	

	
	return businesses;
	
}

-(NSMutableArray *)getInputFieldsForSection:(NSInteger)section BusinessID:(NSInteger)busID {
	// Setup the database object
	
	
	// Init the Array
	NSMutableArray* inputFields = [[NSMutableArray alloc] init];
	
	// Open the database from the users filessytem
	
	
	// Setup the SQL Statement and compile it for faster access
	const char *sqlStatement = "select FieldName from inputFields WHERE section = ? AND busID = ?";
	sqlite3_stmt *compiledStatement;
	if(sqlite3_prepare_v2(database, sqlStatement, -1, &compiledStatement, NULL) == SQLITE_OK) {
		
			sqlite3_bind_int(compiledStatement, 1, section);
		sqlite3_bind_int(compiledStatement, 2, busID);
		// Loop through the results and add them to the feeds array
		while(sqlite3_step(compiledStatement) == SQLITE_ROW) {
			
			// Read the data from the result row
			
			char *cName = (char *)sqlite3_column_text(compiledStatement, 0);
			NSString *tName;
			
			
			tName = [NSString stringWithUTF8String:cName];
			
			
			// Add the animal object to the animals Array
			[inputFields addObject:tName];
			
		//	[tName release];
		}
	}
	// Release the compiled statement from memory
	sqlite3_finalize(compiledStatement);
	
	
	
	
	return inputFields;
	
}

-(NSString*)getDataForFieldName:(NSString*)fieldName andBusID:(NSInteger)busID{
	// Open the database from the users filessytem
	NSString *tName;
	
	// Setup the SQL Statement and compile it for faster access
	const char *sqlStatement = "select Data from inputFields WHERE fieldName = ? AND busID = ?";
	sqlite3_stmt *compiledStatement;
	if(sqlite3_prepare_v2(database, sqlStatement, -1, &compiledStatement, NULL) == SQLITE_OK) {
		
	sqlite3_bind_text(compiledStatement, 1, [fieldName UTF8String], -1, SQLITE_TRANSIENT);
		sqlite3_bind_int(compiledStatement, 2, busID);
		// Loop through the results and add them to the feeds array
		while(sqlite3_step(compiledStatement) == SQLITE_ROW) {
			
			// Read the data from the result row
			
			char *cName = (char *)sqlite3_column_text(compiledStatement, 0);
			
			
			if (cName != nil) {
				tName = [NSString stringWithUTF8String:cName];
				
			}
			else {
				tName = @"";
			}

			
			// Add the animal object to the animals Array
			
			
			//	[tName release];
		}
	}
	// Release the compiled statement from memory
	sqlite3_finalize(compiledStatement);
	
	
	
	
	return tName;
}

-(NSInteger)getCheckedForFieldName:(NSString*)fieldName andBusID:(NSInteger)busID{
	// Open the database from the users filessytem
	NSInteger checked;
	NSLog(@"fieldname = %@", fieldName);
	NSLog(@"busID = %d", busID);


	
	// Setup the SQL Statement and compile it for faster access
	const char *sqlStatement = "select checked from Steps WHERE stepName = ? AND busID = ?";
	sqlite3_stmt *compiledStatement;
	if(sqlite3_prepare_v2(database, sqlStatement, -1, &compiledStatement, NULL) == SQLITE_OK) {
		
		sqlite3_bind_text(compiledStatement, 1, [fieldName UTF8String], -1, SQLITE_TRANSIENT);
		sqlite3_bind_int(compiledStatement, 2, busID);
		// Loop through the results and add them to the feeds array
		while(sqlite3_step(compiledStatement) == SQLITE_ROW) {
			
			checked = sqlite3_column_int(compiledStatement, 0);
			
			// Add the animal object to the animals Array
			
			
			//	[tName release];
		}
	}
	// Release the compiled statement from memory
	sqlite3_finalize(compiledStatement);
	
	

	NSLog(@"checked = %d", checked);

	return checked;
}

-(void)updateData:(NSString*)data ForFieldName:(NSString*)fieldName andBusID:(NSInteger)busID{
	
	
	// Setup the SQL Statement and compile it for faster access
	const char *sqlStatement = "UPDATE inputFields SET Data = ? WHERE fieldName = ? AND busID = ?";
	sqlite3_stmt *compiledStatement;
	if(sqlite3_prepare_v2(database, sqlStatement, -1, &compiledStatement, NULL) == SQLITE_OK) {
		
		sqlite3_bind_text(compiledStatement, 1, [data UTF8String], -1, SQLITE_TRANSIENT);
		sqlite3_bind_text(compiledStatement, 2, [fieldName UTF8String], -1, SQLITE_TRANSIENT);
		sqlite3_bind_int(compiledStatement, 3, busID);
		// Loop through the results and add them to the feeds array
	
		if(SQLITE_DONE != sqlite3_step(compiledStatement)){
			// Read the data from the result row
			
			NSLog(@"ERROR UPDATING");
				
			}
			else {
				
			}
			
			
			// Add the animal object to the animals Array
			
			
			//	[tName release];
		}
		sqlite3_finalize(compiledStatement);
}

-(void)updateChecked:(NSInteger)checked ForFieldName:(NSString*)fieldName andBusID:(NSInteger)busID{
	// Setup the SQL Statement and compile it for faster access
	const char *sqlStatement = "UPDATE Steps SET checked = ? WHERE stepName = ? AND busID = ?";
	sqlite3_stmt *compiledStatement;
	if(sqlite3_prepare_v2(database, sqlStatement, -1, &compiledStatement, NULL) == SQLITE_OK) {
		
		sqlite3_bind_int(compiledStatement, 1, checked);
		sqlite3_bind_text(compiledStatement, 2, [fieldName UTF8String], -1, SQLITE_TRANSIENT);
		sqlite3_bind_int(compiledStatement, 3, busID);
		// Loop through the results and add them to the feeds array
		
		if(SQLITE_DONE != sqlite3_step(compiledStatement)){
			// Read the data from the result row
			
			NSLog(@"ERROR UPDATING");
			
		}
		else {
			
		}
		
		
		// Add the animal object to the animals Array
		
		
		//	[tName release];
	}
	sqlite3_finalize(compiledStatement);
}

-(NSMutableArray*)getStepsforBusID:(NSInteger)busID{
	// Open the database from the users filessytem
	NSMutableArray* array = [[NSMutableArray alloc] init];
	
	// Setup the SQL Statement and compile it for faster access
	const char *sqlStatement = "select stepName from Steps WHERE busID = ?";
	sqlite3_stmt *compiledStatement;
	if(sqlite3_prepare_v2(database, sqlStatement, -1, &compiledStatement, NULL) == SQLITE_OK) {
		
		
		sqlite3_bind_int(compiledStatement, 1, busID);
		// Loop through the results and add them to the feeds array
		while(sqlite3_step(compiledStatement) == SQLITE_ROW) {
			
			// Read the data from the result row
			NSString* tName;
			char *cName = (char *)sqlite3_column_text(compiledStatement, 0);
			
			
			if (cName != nil) {
				tName = [NSString stringWithUTF8String:cName];
				
			}
			else {
				tName = @"";
			}
			[array addObject:tName];
		}
	}
	// Release the compiled statement from memory
	sqlite3_finalize(compiledStatement);
	
	
	
	
	return array;
}	

-(NSMutableArray*)getStartupCostsForBusID:(NSInteger)busID{
	// Open the database from the users filessytem
	NSMutableArray* array = [[[NSMutableArray alloc] init]retain];
	
	// Setup the SQL Statement and compile it for faster access
	const char *sqlStatement = "select Name, Purchased, Needed from startupCosts WHERE busID = ?";
	sqlite3_stmt *compiledStatement;
	if(sqlite3_prepare_v2(database, sqlStatement, -1, &compiledStatement, NULL) == SQLITE_OK) {
		
		
		sqlite3_bind_int(compiledStatement, 1, busID);
		// Loop through the results and add them to the feeds array
		while(sqlite3_step(compiledStatement) == SQLITE_ROW) {
			
			// Read the data from the result row
			NSString* tName;
			char *cName = (char *)sqlite3_column_text(compiledStatement, 0);
			
			
			if (cName != nil) {
				tName = [NSString stringWithUTF8String:cName];
				
			}
			else {
				tName = @"";
			}
			
			NSInteger purchased = sqlite3_column_int(compiledStatement, 1);
			NSInteger needed = sqlite3_column_int(compiledStatement, 2);
			
			StartupCost* sc = [[StartupCost alloc] initWithName:tName Purchased:purchased Needed:needed];
			[array addObject:sc];
			//[sc release];
			//[tName release];
			
			
			// Add the animal object to the animals Array
			
			
			//	[tName release];
		}
	}
	// Release the compiled statement from memory
	sqlite3_finalize(compiledStatement);
	
	
	
	
	return array;
}	

-(void)updateNeeded:(NSInteger)value ForStartupName:(NSString*)name andBusID:(NSInteger)busID{
	
	// Setup the SQL Statement and compile it for faster access
	const char *sqlStatement = "UPDATE startupCosts SET Needed = ? WHERE Name = ? AND busID = ?";
	sqlite3_stmt *compiledStatement;
	if(sqlite3_prepare_v2(database, sqlStatement, -1, &compiledStatement, NULL) == SQLITE_OK) {
		
		sqlite3_bind_int(compiledStatement, 1, value);
		sqlite3_bind_text(compiledStatement, 2, [name UTF8String], -1, SQLITE_TRANSIENT);
		sqlite3_bind_int(compiledStatement, 3, busID);
		// Loop through the results and add them to the feeds array
		
		if(SQLITE_DONE != sqlite3_step(compiledStatement)){
			// Read the data from the result row
			
			NSLog(@"ERROR UPDATING");
			
		}
		else {
			
		}
		
		
		// Add the animal object to the animals Array
		
		
		//	[tName release];
	}
	sqlite3_finalize(compiledStatement);
}
	

-(void)updatePurchased:(NSInteger)value ForStartupName:(NSString*)name andBusID:(NSInteger)busID{
	
	// Setup the SQL Statement and compile it for faster access
	const char *sqlStatement = "UPDATE startupCosts SET Purchased = ? WHERE Name = ? AND busID = ?";
	sqlite3_stmt *compiledStatement;
	if(sqlite3_prepare_v2(database, sqlStatement, -1, &compiledStatement, NULL) == SQLITE_OK) {
		
		sqlite3_bind_int(compiledStatement, 1, value);
		sqlite3_bind_text(compiledStatement, 2, [name UTF8String], -1, SQLITE_TRANSIENT);
		sqlite3_bind_int(compiledStatement, 3, busID);
		// Loop through the results and add them to the feeds array
		
		if(SQLITE_DONE != sqlite3_step(compiledStatement)){
			// Read the data from the result row
			
			NSLog(@"ERROR UPDATING");
			
		}
		else {
			
		}
		
		
		// Add the animal object to the animals Array
		
		
		//	[tName release];
	}
	sqlite3_finalize(compiledStatement);
}
	
-(NSMutableArray*)getlicensesforBusID:(NSInteger)busID section:(NSInteger)section{
	
		// Setup the database object
		
		
		// Init the Array
		NSMutableArray* licenses = [[NSMutableArray alloc] init];
		
		// Open the database from the users filessytem
		
		
		// Setup the SQL Statement and compile it for faster access
		const char *sqlStatement = "select Name, Obtained, LicenseID from Licenses WHERE busID = ? AND section = ?";
		sqlite3_stmt *compiledStatement;
		if(sqlite3_prepare_v2(database, sqlStatement, -1, &compiledStatement, NULL) == SQLITE_OK) {
			
			sqlite3_bind_int(compiledStatement, 1, busID);
			sqlite3_bind_int(compiledStatement, 2, section);
			// Loop through the results and add them to the feeds array
			while(sqlite3_step(compiledStatement) == SQLITE_ROW) {
				
				// Read the data from the result row
				
				char *cName = (char *)sqlite3_column_text(compiledStatement, 0);
				NSString *tName;
				
				
				tName = [NSString stringWithUTF8String:cName];
				NSInteger obtained = sqlite3_column_int(compiledStatement, 1);
				NSInteger licID = sqlite3_column_int(compiledStatement, 2);
				License* lic = [[License alloc] initWithName:tName obtained:obtained licID:licID];
				// Add the animal object to the animals Array
				[licenses addObject:lic];
				
				//	[tName release];
			}
		}
		// Release the compiled statement from memory
		sqlite3_finalize(compiledStatement);
		
		
		
		
		return licenses;
		
	}

-(void)addLicenseWithName:(NSString*)name busID:(NSInteger)busID section:(NSInteger)section{
	sqlite3_stmt *addStmt = nil;
	const char *sql = "insert into Licenses(Name,BusID,section) Values(?, ?, ?)";
	if(sqlite3_prepare_v2(database, sql, -1, &addStmt, NULL) != SQLITE_OK)
		NSLog( @"Error while creating add statement. '%s'", sqlite3_errmsg(database));
	
	
	sqlite3_bind_text(addStmt, 1, [name UTF8String], -1, SQLITE_TRANSIENT);
	sqlite3_bind_int(addStmt, 2, busID);
	sqlite3_bind_int(addStmt, 3, section);
	
	
	if(SQLITE_DONE != sqlite3_step(addStmt))
		NSLog( @"Error while inserting data. '%s'", sqlite3_errmsg(database));
	
	sqlite3_finalize(addStmt);
	
}

-(void)updateLicense:(NSInteger)licID obtained:(NSInteger)obtained{
	// Setup the SQL Statement and compile it for faster access
	const char *sqlStatement = "UPDATE Licenses SET Obtained = ? WHERE LicenseID = ?";
	sqlite3_stmt *compiledStatement;
	if(sqlite3_prepare_v2(database, sqlStatement, -1, &compiledStatement, NULL) == SQLITE_OK) {
		
		sqlite3_bind_int(compiledStatement, 1, obtained);
		
		sqlite3_bind_int(compiledStatement, 2, licID);
	
		
		
		// Loop through the results and add them to the feeds array
		
		if(SQLITE_DONE != sqlite3_step(compiledStatement)){
			// Read the data from the result row
			
			NSLog(@"ERROR UPDATING");
			
		}
		else {
			
		}
		
		
		// Add the animal object to the animals Array
		
		
		//	[tName release];
	}
	sqlite3_finalize(compiledStatement);	
}

-(void)deleteLicense:(NSInteger)licID{
	// Setup the SQL Statement and compile it for faster access
	const char *sqlStatement = "DELETE FROM Licenses WHERE LicenseID = ?";
	sqlite3_stmt *compiledStatement;
	if(sqlite3_prepare_v2(database, sqlStatement, -1, &compiledStatement, NULL) == SQLITE_OK) {
		
		
		sqlite3_bind_int(compiledStatement, 1, licID);
		
		
		
		// Loop through the results and add them to the feeds array
		
		if(SQLITE_DONE != sqlite3_step(compiledStatement)){
			// Read the data from the result row
			
			NSLog(@"ERROR UPDATING");
			
		}
		else {
			
		}
		
	}
	sqlite3_finalize(compiledStatement);	
}

-(void)addLocationWithTitle:(NSString*)title busID:(NSInteger)busID address:(NSString*)address notes:(NSString*)notes{
	sqlite3_stmt *addStmt = nil;
	const char *sql = "insert into Location(Title,BusID,Address,Notes) Values(?, ?, ?, ?)";
	if(sqlite3_prepare_v2(database, sql, -1, &addStmt, NULL) != SQLITE_OK)
		NSLog( @"Error while creating add statement. '%s'", sqlite3_errmsg(database));
	
	
	sqlite3_bind_text(addStmt, 1, [title UTF8String], -1, SQLITE_TRANSIENT);
	sqlite3_bind_int(addStmt, 2, busID);
	sqlite3_bind_text(addStmt, 3, [address UTF8String], -1, SQLITE_TRANSIENT);
	sqlite3_bind_text(addStmt, 4, [notes UTF8String], -1, SQLITE_TRANSIENT);
	
	
	if(SQLITE_DONE != sqlite3_step(addStmt))
		NSLog( @"Error while inserting data. '%s'", sqlite3_errmsg(database));
	
	sqlite3_finalize(addStmt);
	
}
-(NSMutableArray*)getLocationsforBusID:(NSInteger)busID{
	// Setup the database object
	
	
	// Init the Array
	NSMutableArray* locations = [[NSMutableArray alloc] init];
	
	// Open the database from the users filessytem
	
	
	// Setup the SQL Statement and compile it for faster access
	const char *sqlStatement = "select Title, Address, Notes, LocationID from Location WHERE busID = ?";
	sqlite3_stmt *compiledStatement;
	if(sqlite3_prepare_v2(database, sqlStatement, -1, &compiledStatement, NULL) == SQLITE_OK) {
		
		sqlite3_bind_int(compiledStatement, 1, busID);		// Loop through the results and add them to the feeds array
		while(sqlite3_step(compiledStatement) == SQLITE_ROW) {
			
			// Read the data from the result row
			
			char *cTitle = (char *)sqlite3_column_text(compiledStatement, 0);
			NSString *tTitle;
			tTitle = [NSString stringWithUTF8String:cTitle];
			
			char *cAdd = (char *)sqlite3_column_text(compiledStatement, 1);
			NSString *tAdd;
			tAdd = [NSString stringWithUTF8String:cAdd];
			
			char *cNotes = (char *)sqlite3_column_text(compiledStatement, 2);
			NSString *tNotes;
			tNotes = [NSString stringWithUTF8String:cNotes];
			
			
			NSInteger locID = sqlite3_column_int(compiledStatement, 3);
			Location* loc = [[Location alloc] initWithTitle:tTitle address:tAdd notes:tNotes locID:locID];
			// Add the animal object to the animals Array
			[locations addObject:loc];
			
			//	[tName release];
		}
	}
	// Release the compiled statement from memory
	sqlite3_finalize(compiledStatement);
	
	
	
	
	return locations;
	
}




-(void)updateLocation:(NSInteger)locID title:(NSString*)title address:(NSString*)address notes:(NSString*)notes{
	const char *sqlStatement = "UPDATE Location SET Title = ?, Address = ? , Notes = ? WHERE LocationID = ?";
	sqlite3_stmt *compiledStatement;
	if(sqlite3_prepare_v2(database, sqlStatement, -1, &compiledStatement, NULL) == SQLITE_OK) {
		
		sqlite3_bind_text(compiledStatement, 1, [title UTF8String], -1, SQLITE_TRANSIENT);
		sqlite3_bind_text(compiledStatement, 2, [address UTF8String], -1, SQLITE_TRANSIENT);
		sqlite3_bind_text(compiledStatement, 3, [notes UTF8String], -1, SQLITE_TRANSIENT);
		sqlite3_bind_int(compiledStatement, 4, locID);
		
		
		// Loop through the results and add them to the feeds array
		
		if(SQLITE_DONE != sqlite3_step(compiledStatement)){
			// Read the data from the result row
			
			NSLog(@"ERROR UPDATING");
			
		}
		else {
			
		}
		
		
		// Add the animal object to the animals Array
		
		
		//	[tName release];
	}
	sqlite3_finalize(compiledStatement);
}

-(void)deleteLocation:(NSInteger)locID{
	const char *sqlStatement = "DELETE FROM Location WHERE LocationID = ?";
	sqlite3_stmt *compiledStatement;
	if(sqlite3_prepare_v2(database, sqlStatement, -1, &compiledStatement, NULL) == SQLITE_OK) {
		
		
		sqlite3_bind_int(compiledStatement, 1, locID);
		
		
		
		// Loop through the results and add them to the feeds array
		
		if(SQLITE_DONE != sqlite3_step(compiledStatement)){
			// Read the data from the result row
			
			NSLog(@"ERROR UPDATING");
			
		}
		else {
			
		}
		
	}
	sqlite3_finalize(compiledStatement);	
}

-(void)addFinancingWithTitle:(NSString*)title busID:(NSInteger)busID{
	sqlite3_stmt *addStmt = nil;
	const char *sql = "insert into financing(name,BusID) Values(?, ?)";
	if(sqlite3_prepare_v2(database, sql, -1, &addStmt, NULL) != SQLITE_OK)
		NSLog( @"Error while creating add statement. '%s'", sqlite3_errmsg(database));
	
	
	sqlite3_bind_text(addStmt, 1, [title UTF8String], -1, SQLITE_TRANSIENT);
	sqlite3_bind_int(addStmt, 2, busID);

	
	if(SQLITE_DONE != sqlite3_step(addStmt))
		NSLog( @"Error while inserting data. '%s'", sqlite3_errmsg(database));
	
	sqlite3_finalize(addStmt);
	
	
}

-(NSMutableArray*)getFinancingforBusID:(NSInteger)busID{
	// Setup the database object
	
	
	// Init the Array
	NSMutableArray* finances = [[NSMutableArray alloc] init];
	
	// Open the database from the users filessytem
	
	
	// Setup the SQL Statement and compile it for faster access
	const char *sqlStatement = "select name, given, payneeded, finID from financing WHERE busID = ?";
	sqlite3_stmt *compiledStatement;
	if(sqlite3_prepare_v2(database, sqlStatement, -1, &compiledStatement, NULL) == SQLITE_OK) {
		
		sqlite3_bind_int(compiledStatement, 1, busID);		// Loop through the results and add them to the feeds array
		while(sqlite3_step(compiledStatement) == SQLITE_ROW) {
			
			// Read the data from the result row
			
			char *cTitle = (char *)sqlite3_column_text(compiledStatement, 0);
			NSString *tTitle;
			tTitle = [NSString stringWithUTF8String:cTitle];
			
			NSInteger given = sqlite3_column_int(compiledStatement, 1);
			NSInteger payneeded = sqlite3_column_int(compiledStatement, 2);
			
			NSInteger finID = sqlite3_column_int(compiledStatement, 3);
			Financing* fin = [[Financing alloc] initWithTitle:tTitle given:given payneeded:payneeded finID:finID];
			// Add the animal object to the animals Array
			[finances addObject:fin];
			
			//	[tName release];
		}
	}
	// Release the compiled statement from memory
	sqlite3_finalize(compiledStatement);
	
	
	
	
	return finances;
	
	
}

-(void)updateFinancing:(NSInteger)finID given:(NSInteger)given payneeded:(NSInteger)payneeded{
	//NSLog(@"Updatefinancing finID: %d given: %d payneeded: %d",finID,given,payneeded);
	const char *sqlStatement = "UPDATE financing SET given = ?, payneeded = ? WHERE finID = ?";
	sqlite3_stmt *compiledStatement;
	if(sqlite3_prepare_v2(database, sqlStatement, -1, &compiledStatement, NULL) == SQLITE_OK) {
		
		sqlite3_bind_int(compiledStatement, 1, given);
		sqlite3_bind_int(compiledStatement, 2, payneeded);
		sqlite3_bind_int(compiledStatement, 3, finID);
		
		
		// Loop through the results and add them to the feeds array
		
		if(SQLITE_DONE != sqlite3_step(compiledStatement)){
			// Read the data from the result row
			
			NSLog(@"ERROR UPDATING");
			
		}
		else {
			
		}
		
		
		// Add the animal object to the animals Array
		
		
		//	[tName release];
	}
	sqlite3_finalize(compiledStatement);
}

-(void)deleteFinancing:(NSInteger)finID{
	const char *sqlStatement = "DELETE FROM financing WHERE finID = ?";
	sqlite3_stmt *compiledStatement;
	if(sqlite3_prepare_v2(database, sqlStatement, -1, &compiledStatement, NULL) == SQLITE_OK) {
		
		
		sqlite3_bind_int(compiledStatement, 1, finID);
		
		
		
		// Loop through the results and add them to the feeds array
		
		if(SQLITE_DONE != sqlite3_step(compiledStatement)){
			// Read the data from the result row
			
			NSLog(@"ERROR UPDATING");
			
		}
		else {
			
		}
		
	}
	sqlite3_finalize(compiledStatement);	
}

-(void)addEmployeeWithName:(NSString*)name busID:(NSInteger)busID salary:(NSString*)salary desc:(NSString*)desc{
	sqlite3_stmt *addStmt = nil;
	const char *sql = "insert into Employees(Name,BusID,Salary,Description) Values(?, ?, ?, ?)";
	if(sqlite3_prepare_v2(database, sql, -1, &addStmt, NULL) != SQLITE_OK)
		NSLog( @"Error while creating add statement. '%s'", sqlite3_errmsg(database));
	
	
	sqlite3_bind_text(addStmt, 1, [name UTF8String], -1, SQLITE_TRANSIENT);
	sqlite3_bind_int(addStmt, 2, busID);
	sqlite3_bind_text(addStmt, 3, [salary UTF8String], -1, SQLITE_TRANSIENT);
	sqlite3_bind_text(addStmt, 4, [desc UTF8String], -1, SQLITE_TRANSIENT);
	
	
	if(SQLITE_DONE != sqlite3_step(addStmt))
		NSLog( @"Error while inserting data. '%s'", sqlite3_errmsg(database));
	
	sqlite3_finalize(addStmt);
}

-(NSMutableArray*)getEmployeesforBusID:(NSInteger)busID{
	// Init the Array
	NSMutableArray* employees = [[NSMutableArray alloc] init];
	
	// Open the database from the users filessytem
	
	
	// Setup the SQL Statement and compile it for faster access
	const char *sqlStatement = "select Name, Salary, Description, EmpID from Employees WHERE busID = ?";
	sqlite3_stmt *compiledStatement;
	if(sqlite3_prepare_v2(database, sqlStatement, -1, &compiledStatement, NULL) == SQLITE_OK) {
		
		sqlite3_bind_int(compiledStatement, 1, busID);		// Loop through the results and add them to the feeds array
		while(sqlite3_step(compiledStatement) == SQLITE_ROW) {
			
			// Read the data from the result row
			
			char *cTitle = (char *)sqlite3_column_text(compiledStatement, 0);
			NSString *tName;
			tName = [NSString stringWithUTF8String:cTitle];
			
			char *cAdd = (char *)sqlite3_column_text(compiledStatement, 1);
			NSString *tSalary;
			tSalary = [NSString stringWithUTF8String:cAdd];
			
			char *cNotes = (char *)sqlite3_column_text(compiledStatement, 2);
			NSString *tDesc;
			tDesc = [NSString stringWithUTF8String:cNotes];
			
			
			NSInteger empID = sqlite3_column_int(compiledStatement, 3);
			Employee* emp = [[Employee alloc] initWithName:tName salary:tSalary desc:tDesc empID:empID];
			// Add the animal object to the animals Array
			[employees addObject:emp];
			
			//	[tName release];
		}
	}
	// Release the compiled statement from memory
	sqlite3_finalize(compiledStatement);
	
	return employees;
	
}

-(void)updateEmployee:(NSInteger)empID name:(NSString*)name salary:(NSString*)salary desc:(NSString*)desc{
	const char *sqlStatement = "UPDATE Employees SET Name = ?, Salary = ? , Description = ? WHERE EmpID = ?";
	sqlite3_stmt *compiledStatement;
	if(sqlite3_prepare_v2(database, sqlStatement, -1, &compiledStatement, NULL) == SQLITE_OK) {
		
		sqlite3_bind_text(compiledStatement, 1, [name UTF8String], -1, SQLITE_TRANSIENT);
		sqlite3_bind_text(compiledStatement, 2, [salary UTF8String], -1, SQLITE_TRANSIENT);
		sqlite3_bind_text(compiledStatement, 3, [desc UTF8String], -1, SQLITE_TRANSIENT);
		sqlite3_bind_int(compiledStatement, 4, empID);
		
		
		// Loop through the results and add them to the feeds array
		
		if(SQLITE_DONE != sqlite3_step(compiledStatement)){
			// Read the data from the result row
			
			NSLog(@"ERROR UPDATING");
			
		}
		else {
			
		}
		
		
		// Add the animal object to the animals Array
		
		
		//	[tName release];
	}
	sqlite3_finalize(compiledStatement);
}

-(void)deleteEmployee:(NSInteger)empID{
	const char *sqlStatement = "DELETE FROM Employees WHERE EmpID = ?";
	sqlite3_stmt *compiledStatement;
	if(sqlite3_prepare_v2(database, sqlStatement, -1, &compiledStatement, NULL) == SQLITE_OK) {
		
		
		sqlite3_bind_int(compiledStatement, 1, empID);
		
		
		
		// Loop through the results and add them to the feeds array
		
		if(SQLITE_DONE != sqlite3_step(compiledStatement)){
			// Read the data from the result row
			
			NSLog(@"ERROR UPDATING");
			
		}
		else {
			
		}
		
	}
	sqlite3_finalize(compiledStatement);	
}
- (void)dealloc {
	sqlite3_close(database);
    [super dealloc];
}

@end
