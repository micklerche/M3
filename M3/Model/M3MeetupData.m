//
//  M3MeetupData.m
//  M3
//
//  Created by Mick Lerche on 3/23/15.
//  Copyright (c) 2015 Mick Lerche. All rights reserved.
//

#import "M3MeetupData.h"

@interface M3MeetupData ()
@property NSString *meetupUrlText;
@property NSString *commentUrlText;

@end

@implementation M3MeetupData

- (instancetype)initWithType:(NSString *)callType WithSearch:(NSString *)searchReplacement {
    self = [super init];
    if (self) {
        self.callType = callType;
        self.searchReplacement = searchReplacement;
        self.meetupUrlText = @"https://api.meetup.com/2/open_events.json?zip=60604&text=*****&time=,1w&key=c4f417540617425547e437b3c50427e";
        self.commentUrlText = @"https://api.meetup.com/2/event_comments?&sign=true&photo-host=public&group_id=*****&page=20&key=c4f417540617425547e437b3c50427e";
    }

    return self;
}

- (void)getDictionaryData {


    NSString *urlText = [([self.callType isEqualToString:@"Meetup"] ? self.meetupUrlText : self.commentUrlText)
                         stringByReplacingOccurrencesOfString:@"*****"
                         withString:self.searchReplacement];
    NSLog(@"%@", urlText);
    NSURL *url = [NSURL URLWithString:urlText];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [NSURLConnection sendAsynchronousRequest:request
                                       queue:[NSOperationQueue mainQueue]
                           completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {

                               self.dictionary = [NSJSONSerialization JSONObjectWithData:data
                                                                                 options:NSJSONReadingAllowFragments
                                                                                   error:&connectionError];
                               NSLog(@"Data Received");
                               [self.delegate gotMeetupData:self.dictionary];
                               NSLog(@"Data Received2");

                           }];

}

- (void)getDictionaryData:(id)searchReplacement {
    self.searchReplacement = searchReplacement;
    [self getDictionaryData];
}

@end
