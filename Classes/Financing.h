//
//  Financing.h
//  NewREDIApp
//
//  Created by Administrator on 5/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Financing : NSObject {
	NSInteger finID;
	NSString* title;
	NSInteger given;
	NSInteger payneeded;
}

@property NSInteger finID;
@property (nonatomic, retain) NSString* title;
@property NSInteger given;
@property NSInteger payneeded;


-(Financing *)initWithTitle:(NSString*)ttitle given:(NSInteger)tgiven payneeded:(NSInteger)tpayneeded finID:(NSInteger)tfinID ;

@end
