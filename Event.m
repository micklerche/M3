//
//  Event.m
//  M3
//
//  Created by Mick Lerche on 3/23/15.
//  Copyright (c) 2015 Mick Lerche. All rights reserved.
//

#import "Event.h"

@implementation Event

- (NSString *)getName
{
    if (!_name) {
        _name = [self.dictionary objectForKey:@"name"];
    }
    return _name;
}

- (NSInteger)getRsvpCounts
{
    if (!_rsvpCounts) {
        _rsvpCounts = [[self.dictionary objectForKey:@"rsvpCounts"] integerValue];
    }
    return _rsvpCounts;
}

- (NSString *)getDesc
{
    if (!_desc) {
        _desc = [self.dictionary objectForKey:@"name"];
    }
    return _desc;
}

- (NSString *)getHostGroupInformation
{
    if (!_hostGroupInformation) {
        NSDictionary *dic = [self.dictionary objectForKey:@"group"];

        _hostGroupInformation = [[NSString stringWithFormat:@"%@ - Join mode: ",[dic objectForKey:@"urlname"]] stringByAppendingString:[dic objectForKey:@"join_mode"]];
    }
    return _hostGroupInformation;
}




@end
