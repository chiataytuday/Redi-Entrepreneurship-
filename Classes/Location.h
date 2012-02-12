//
//  Location.h
//  NewREDIApp
//
//  Created by Administrator on 5/3/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Location : NSObject {
	NSInteger locID;
	NSString* title;
	NSString* address;
	NSString* notes;
}

@property NSInteger locID;
@property (nonatomic, retain) NSString* title;
@property (nonatomic, retain) NSString* address;
@property (nonatomic, retain) NSString* notes;

-(Location *)initWithTitle:(NSString*)ttitle address:(NSString*)taddress notes:(NSString*)tnotes locID:(NSInteger)tlocID ;

@end
