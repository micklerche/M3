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
@property (nonatomic, readonly) NSString *name;
@property (nonatomic, readonly) NSInteger rsvpCounts;
@property (nonatomic, readonly) NSString *hostGroupInformation;
@property (nonatomic, readonly) NSString *desc;

@end
