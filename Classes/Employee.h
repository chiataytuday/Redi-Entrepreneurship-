//
//  Employee.h
//  NewREDIApp
//
//  Created by Administrator on 5/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Employee : NSObject {
	NSInteger empID;
	NSString* name;
	NSString* salary;
	NSString* desc;
}

@property NSInteger empID;
@property (nonatomic, retain) NSString* name;
@property (nonatomic, retain) NSString* salary;
@property (nonatomic, retain) NSString* desc;

-(Employee *)initWithName:(NSString*)tname salary:(NSString*)tsalary desc:(NSString*)tdesc empID:(NSInteger)tempID ;

@end
