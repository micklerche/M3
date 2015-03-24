//
//  M3CommentViewController.m
//  M3
//
//  Created by Mick Lerche on 3/23/15.
//  Copyright (c) 2015 Mick Lerche. All rights reserved.
//

#import "M3CommentViewController.h"
#import "M3CommentTableViewCell.h"
#import "M3MemberProfileViewController.h"

@interface M3CommentViewController () <UITableViewDataSource, UITableViewDelegate>
@property (strong, nonatomic) IBOutlet UITableView *commentTableView;
@property NSDictionary *meetUpData;
@property NSArray *meetUpDataArray;
@end

@implementation M3CommentViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.meetUpData = [NSDictionary new];
    self.meetUpDataArray = [NSArray new];

    [self getMeetupData:self.event.groupId];


}


# pragma mark - "Data Access"

- (void)getMeetupData:(NSString *)searchText {
    NSString *urlText = [@"https://api.meetup.com/2/event_comments?&sign=true&photo-host=public&group_id=*****&page=20&key=c4f417540617425547e437b3c50427e"
                         stringByReplacingOccurrencesOfString:@"*****"
                         withString:searchText];

    NSURL *url = [NSURL URLWithString:urlText];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [NSURLConnection sendAsynchronousRequest:request
                                       queue:[NSOperationQueue mainQueue]
                           completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {

                               self.meetUpData = [NSJSONSerialization JSONObjectWithData:data
                                                                                 options:NSJSONReadingAllowFragments
                                                                                   error:&connectionError];
                               NSLog(@"Data Received");
                               [self moveDataToArray];
                               [self.commentTableView reloadData];


                           }];


}

- (void)moveDataToArray {
    self.meetUpDataArray = [self.meetUpData valueForKey:@"results"];
}



#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(M3CommentTableViewCell *)cell {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    M3MemberProfileViewController *vc = [segue destinationViewController];
    vc.memberID = cell.memberID;
}



# pragma mark - "Table View"

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.meetUpDataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    M3CommentTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"CommentCell"];

    NSDictionary *meetUp = [self.meetUpDataArray objectAtIndex:indexPath.row];

    cell.nameLabel.text = [meetUp objectForKey:@"member_name"];

    cell.memberID = [[meetUp objectForKey:@"member_id"] stringValue];

    cell.commentTextView.text = [meetUp objectForKey:@"comment"];

    NSString *depart=[meetUp valueForKey:@"time"];
    NSTimeInterval intervaldep=[depart doubleValue]/1000;

    NSDate *myDate = [NSDate dateWithTimeIntervalSince1970:intervaldep];

    cell.timelabel.text = [NSString stringWithFormat:@"%@", myDate];

    return cell;
}


@end
