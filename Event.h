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
@property (nonatomic) NSString *name;
@property (nonatomic) NSInteger rsvpCounts;
@property (nonatomic) NSString *hostGroupInformation;
@property (nonatomic) NSString *desc;

-(instancetype)initWithName:(NSString *)name WithRSVPCount:(NSInteger)rsvpCounts WithDescription:(NSString *)desc; 

@end
