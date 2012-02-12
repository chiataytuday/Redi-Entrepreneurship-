//
//  StartupCost.h
//  NewREDIApp
//
//  Created by Administrator on 5/2/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface StartupCost : NSObject {
	NSString* name;
	NSInteger purchased;
	NSInteger needed;
}
@property (nonatomic, retain) NSString* name;
@property NSInteger purchased;
@property NSInteger needed;

-(StartupCost *)initWithName:(NSString*)Name Purchased:(NSInteger)purchased Needed:(NSInteger)needed;
@end
