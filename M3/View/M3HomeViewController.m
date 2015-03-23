//
//  M3HomeViewController.m
//  M3
//
//  Created by Mick Lerche on 3/23/15.
//  Copyright (c) 2015 Mick Lerche. All rights reserved.
//

#import "M3HomeViewController.h"

@interface M3HomeViewController ()
@property NSDictionary *meetUpData;
@property NSArray *meetUpDataArray;
@property (strong, nonatomic) IBOutlet UITableView *meetUpTableView;
@end

@implementation M3HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.meetUpData = [NSDictionary new];
    self.meetUpDataArray = [NSArray new];
    [self getMeetupData];


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


# pragma mark - "Data Access"

- (void)getMeetupData {

    NSURL *url = [NSURL URLWithString:@"https://api.meetup.com/2/open_events.json?zip=60604&text=mobile&time=,1w&key=c4f417540617425547e437b3c50427e"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [NSURLConnection sendAsynchronousRequest:request
                                       queue:[NSOperationQueue mainQueue]
                           completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {

                               self.meetUpData = [NSJSONSerialization JSONObjectWithData:data
                                                                                  options:NSJSONReadingAllowFragments
                                                                                    error:&connectionError];
                               NSLog(@"Data Received");
                               [self moveDataToArray];
                               [self.meetUpTableView reloadData];

                               
                           }];


}

- (void)moveDataToArray {
    self.meetUpDataArray = [self.meetUpData valueForKey:@"results"];


}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


# pragma mark - "Table View"

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.meetUpDataArray.count;
}




- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"M3cell"];


    NSDictionary *meetUp = [self.meetUpDataArray objectAtIndex:indexPath.row];

    //NSURL *imageUrl = [NSURL URLWithString:[superHero objectForKey:@"avatar_url"]];
    //cell.imageView.contentMode = UIViewContentModeScaleToFill;


    cell.textLabel.text = [meetUp objectForKey:@"name"];
    //cell.detailTextLabel.text = [superHero objectForKey:@"description"];
    //cell.imageView.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:imageUrl]];



    return cell;
}

































@end
