//
//  DatabaseController.h
//  NewREDIApp
//
//  Created by Administrator on 4/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>
#import "Business.h"
#import "StartupCost.h"
#import "License.h"
#import "Location.h"
#import "Financing.h"
#import "Employee.h"

@interface DatabaseController : NSObject {
	NSString *databaseName;
	NSString *databasePath;
	sqlite3 *database;
	
}

@property (nonatomic, retain) NSString* databaseName;
@property (nonatomic, retain) NSString* databasePath;
@property sqlite3 *database;

-(void) checkAndCreateDatabase;
-(NSMutableArray *)getBusinesses;
-(void)addBusinessWithName:(NSString*)name;
-(void)deleteBusinessWithID:(NSInteger)busID;

-(NSMutableArray *)getInputFieldsForSection:(NSInteger)section BusinessID:(NSInteger)busID;
-(NSString*)getDataForFieldName:(NSString*)fieldName andBusID:(NSInteger)busID;
-(NSInteger)getCheckedForFieldName:(NSString*)fieldName andBusID:(NSInteger)busID;
-(void)updateData:(NSString*)data ForFieldName:(NSString*)fieldName andBusID:(NSInteger)busID;
-(void)updateChecked:(NSInteger)checked ForFieldName:(NSString*)fieldName andBusID:(NSInteger)busID;
-(NSMutableArray*)getStepsforBusID:(NSInteger)busID;

-(NSMutableArray*)getStartupCostsForBusID:(NSInteger)busID;
-(void)updateNeeded:(NSInteger)value ForStartupName:(NSString*)name andBusID:(NSInteger)busID;
-(void)updatePurchased:(NSInteger)value ForStartupName:(NSString*)name andBusID:(NSInteger)busID;

-(NSMutableArray*)getlicensesforBusID:(NSInteger)busID section:(NSInteger)section;
-(void)addLicenseWithName:(NSString*)name busID:(NSInteger)busID section:(NSInteger)section;
-(void)updateLicense:(NSInteger)licID obtained:(NSInteger)obtained;
-(void)deleteLicense:(NSInteger)licID;

-(void)addLocationWithTitle:(NSString*)title busID:(NSInteger)busID address:(NSString*)address notes:(NSString*)notes;
-(NSMutableArray*)getLocationsforBusID:(NSInteger)busID;
-(void)updateLocation:(NSInteger)locID title:(NSString*)title address:(NSString*)address notes:(NSString*)notes;
-(void)deleteLocation:(NSInteger)locID;

-(void)addFinancingWithTitle:(NSString*)title busID:(NSInteger)busID;
-(NSMutableArray*)getFinancingforBusID:(NSInteger)busID;
-(void)updateFinancing:(NSInteger)finID given:(NSInteger)given payneeded:(NSInteger)payneeded;
-(void)deleteFinancing:(NSInteger)finID;

-(void)addEmployeeWithName:(NSString*)name busID:(NSInteger)busID salary:(NSString*)salary desc:(NSString*)desc;
-(NSMutableArray*)getEmployeesforBusID:(NSInteger)busID;
-(void)updateEmployee:(NSInteger)empID name:(NSString*)name salary:(NSString*)salary desc:(NSString*)desc;
-(void)deleteEmployee:(NSInteger)empID;
@end
