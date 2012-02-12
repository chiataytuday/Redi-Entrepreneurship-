//
//  License.h
//  NewREDIApp
//
//  Created by Administrator on 5/3/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface License : NSObject {
	NSInteger obtained;
	NSInteger LicID;
	NSString* name;
}

@property (nonatomic, retain) NSString* name;
@property NSInteger obtained;
@property NSInteger licID;

-(License *)initWithName:(NSString*)tname obtained:(NSInteger)tobtained licID:(NSInteger)tlicID ;
@end
