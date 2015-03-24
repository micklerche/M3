//
//  M3MemberProfileViewController.m
//  M3
//
//  Created by Mick Lerche on 3/23/15.
//  Copyright (c) 2015 Mick Lerche. All rights reserved.
//

#import "M3MemberProfileViewController.h"
#import "M3MemberProfileViewController.h"

@interface M3MemberProfileViewController ()
@property (strong, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation M3MemberProfileViewController

    - (void)viewDidLoad {
        [super viewDidLoad];
        [self goToURLString:self.memberID];
    }


    - (void)goToURLString:(NSString *)string {

        NSString *urlString = [@"http://www.meetup.com/members/*********/" stringByReplacingOccurrencesOfString:@"*********" withString:string];
        NSURL *url = [NSURL URLWithString:urlString];
        //create new url based on string
        NSURLRequest *request = [NSURLRequest requestWithURL:url]; //url request
        [self.webView loadRequest:request]; //give our webview load the request
    }




#pragma mark - Navigation

//// In a storyboard-based application, you will often want to do a little preparation before navigation
//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//    // Get the new view controller using [segue destinationViewController].
//    // Pass the selected object to the new view controller.
//}


@end
