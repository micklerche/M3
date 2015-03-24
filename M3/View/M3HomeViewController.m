//
//  M3HomeViewController.m
//  M3
//
//  Created by Mick Lerche on 3/23/15.
//  Copyright (c) 2015 Mick Lerche. All rights reserved.
//

#import "M3HomeViewController.h"
#import "EventDescriptionViewController.h"
#import "Event.h"
#import "M3MeetupData.h"

@interface M3HomeViewController () <UITextFieldDelegate, M3MeetupDataDelegate>
@property NSDictionary *meetUpData;
@property NSArray *meetUpDataArray;
@property (strong, nonatomic) IBOutlet UITableView *meetUpTableView;
@property (strong, nonatomic) IBOutlet UITextField *searchTextField;
@end

@implementation M3HomeViewController

#pragma mark - "View items"

- (void)viewDidLoad {
    [super viewDidLoad];

    self.meetUpData = [NSDictionary new];
    self.meetUpDataArray = [NSArray new];
    self.searchTextField.delegate = self;


    //[self getMeetupData:@"mobile"];


    // test of data object
    M3MeetupData *md = [[M3MeetupData alloc]initWithType:@"Meetup" WithSearch:@"mobile"];
    md.delegate = self;
    [md getDictionaryData];





}


# pragma mark - "Data Access"

//- (void)getMeetupData:(NSString *)searchText {
//    NSString *urlText = [@"https://api.meetup.com/2/open_events.json?zip=60604&text=*****&time=,1w&key=c4f417540617425547e437b3c50427e"
//                         stringByReplacingOccurrencesOfString:@"*****"
//                         withString:searchText];
//
//    NSURL *url = [NSURL URLWithString:urlText];
//    NSURLRequest *request = [NSURLRequest requestWithURL:url];
//    [NSURLConnection sendAsynchronousRequest:request
//                                       queue:[NSOperationQueue mainQueue]
//                           completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
//
//                               self.meetUpData = [NSJSONSerialization JSONObjectWithData:data
//                                                                                  options:NSJSONReadingAllowFragments
//                                                                                    error:&connectionError];
//                               NSLog(@"Data Received");
//                               [self moveDataToArray];
//                               [self.meetUpTableView reloadData];
//
//                               
//                           }];
//
//
//}

- (void)moveDataToArray {
    self.meetUpDataArray = [self.meetUpData valueForKey:@"results"];
}


#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(UITableViewCell *)cell {
    NSIndexPath *indexPath = [self.meetUpTableView indexPathForCell:cell];
    NSDictionary *eventDictionary = [self.meetUpDataArray objectAtIndex:indexPath.row];
    Event *event = [Event new];
    EventDescriptionViewController *vc = [segue destinationViewController];
    vc.event = event;
    vc.event.dictionary = eventDictionary;
    vc.title = vc.event.name;

}


# pragma mark - "Table View"

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.meetUpDataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"M3cell"];
    NSDictionary *meetUp = [self.meetUpDataArray objectAtIndex:indexPath.row];
    NSDictionary *venue = [meetUp objectForKey:@"venue"];

    cell.textLabel.text = [meetUp objectForKey:@"name"];
    cell.detailTextLabel.text = [venue objectForKey:@"address_1"];
    return cell;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    // removed for abstraction
    //[self getMeetupData:textField.text];
    M3MeetupData *md = [[M3MeetupData alloc]initWithType:@"Meetup" WithSearch:textField.text];
    md.delegate = self;
    [md getDictionaryData];

    return YES;
}


#pragma mark - "M3Data Delegate"

- (void)gotMeetupData:(id)data {
    NSLog(@"Delegate Data Received");

    self.meetUpData = data;
    [self moveDataToArray];
    NSLog(@"Delegate item count: %li", (long)self.meetUpDataArray.count);

    [self.meetUpTableView reloadData];
}




















@end
