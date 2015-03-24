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
@property (nonatomic, strong, readonly) NSString *name;
@property (nonatomic, strong, readonly) NSString *rsvpCounts;
@property (nonatomic, strong, readonly) NSString *hostGroupInformation;
@property (nonatomic, strong, readonly) NSString *desc;
@property (nonatomic, strong, readonly) NSString *groupId;

-(instancetype)initWithName:(NSString *)name WithRSVPCount:(NSInteger)rsvpCounts WithDescription:(NSString *)desc; 

@end
