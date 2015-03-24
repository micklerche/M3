//
//  M3MeetupData.h
//  M3
//
//  Created by Mick Lerche on 3/23/15.
//  Copyright (c) 2015 Mick Lerche. All rights reserved.
//

#import <Foundation/Foundation.h>
@protocol M3MeetupDataDelegate <NSObject>

@optional
- (void)gotMeetupData:(id)data;

@end

@interface M3MeetupData : NSObject
@property NSString *callType;
@property NSString *searchReplacement;
@property NSString *userKey;

@property NSString *meetupUrl;
@property NSString *commentUrl;
@property NSDictionary *dictionary;
@property (nonatomic, assign) id <M3MeetupDataDelegate> delegate;

- (void)getDictionaryData;
- (void)getDictionaryData:(NSString *)searchReplacement;
- (instancetype)initWithType:(NSString *)callType WithSearch:(NSString *)searchReplacement;


@end
