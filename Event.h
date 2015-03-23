//
//  Event.h
//  M3
//
//  Created by Mick Lerche on 3/23/15.
//  Copyright (c) 2015 Mick Lerche. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Event : NSObject
@property NSDictionary *dictionary;
@property NSString *name;
@property NSInteger rsvpCounts;
@property NSDictionary *hostGroupInformation;
//@property (nonatomic, readonly) NSString *desc;
@property NSString *desc;

@end
