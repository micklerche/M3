//
//  M3CommentTableViewCell.h
//  M3
//
//  Created by Mick Lerche on 3/23/15.
//  Copyright (c) 2015 Mick Lerche. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface M3CommentTableViewCell : UITableViewCell
@property NSString *memberID;
@property (strong, nonatomic) IBOutlet UITextView *commentTextView;
@property (strong, nonatomic) IBOutlet UILabel *timelabel;
@property (strong, nonatomic) IBOutlet UILabel *nameLabel;

@end
