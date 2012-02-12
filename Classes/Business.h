//
//  Business.h
//  NewREDIApp
//
//  Created by Administrator on 4/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Business : NSObject {
	NSInteger busID;
	NSString* name;
}

@property NSInteger busID;
@property (nonatomic, retain) NSString* name;

-(Business *)initWithID:(NSInteger)tID Name:(NSString*)tName;

@end
