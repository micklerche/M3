//
//  Event.m
//  M3
//
//  Created by Mick Lerche on 3/23/15.
//  Copyright (c) 2015 Mick Lerche. All rights reserved.
//

#import "Event.h"

@implementation Event

//- (NSString *)desc {
//    return _desc;
//}

-(instancetype)initWithName:(NSString *)name WithRSVPCount:(NSInteger)rsvpCounts WithDescription:(NSString *)desc
{
    self = [super init];
    if (self) {
        self.name = name;
        self.rsvpCounts = rsvpCounts;
        self.desc = desc;
    }

    return self;
}


@end
