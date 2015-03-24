//
//  EventDescriptionViewController.m
//  M3
//
//  Created by Mick Lerche on 3/23/15.
//  Copyright (c) 2015 Mick Lerche. All rights reserved.
//

#import "EventDescriptionViewController.h"
#import "M3CommentViewController.h"

@interface EventDescriptionViewController ()
@property (strong, nonatomic) IBOutlet UILabel *name;
@property (strong, nonatomic) IBOutlet UILabel *rsvpCount;
@property (strong, nonatomic) IBOutlet UILabel *hostInformation;
@property (strong, nonatomic) IBOutlet UIWebView *descriptionWebView;

@end

@implementation EventDescriptionViewController


- (void)viewDidLoad {
    [super viewDidLoad];

    self.name.text = self.event.name;
    self.rsvpCount.text = self.event.rsvpCounts;
    self.hostInformation.text = self.event.hostGroupInformation;

    [self.descriptionWebView loadHTMLString:self.event.desc baseURL:nil];

}




#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    M3CommentViewController *vc = [segue destinationViewController];
    vc.event = self.event;
    vc.title = vc.event.name;
}


@end
