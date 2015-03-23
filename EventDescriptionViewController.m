//
//  EventDescriptionViewController.m
//  M3
//
//  Created by Mick Lerche on 3/23/15.
//  Copyright (c) 2015 Mick Lerche. All rights reserved.
//

#import "EventDescriptionViewController.h"

@interface EventDescriptionViewController ()
@property (strong, nonatomic) IBOutlet UILabel *name;
@property (strong, nonatomic) IBOutlet UILabel *rsvpCount;
@property (strong, nonatomic) IBOutlet UILabel *hostInformation;
@property (strong, nonatomic) IBOutlet UITextView *eventDescription;

@end

@implementation EventDescriptionViewController


- (void)viewDidLoad {
    [super viewDidLoad];

    self.name.text = self.event.name;
    self.rsvpCount.text = [NSString stringWithFormat:@"%li",self.event.rsvpCounts];
    self.eventDescription.text = self.event.desc;



}




#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
//}


@end
