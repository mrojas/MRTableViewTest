//
//  MRItemTableViewCell.h
//  TableViewTest
//
//  Created by Matias Rojas on 16/04/14.
//  Copyright (c) 2014 Causania. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MRItem.h"

@interface MRItemTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *itemLabel;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;
@property (nonatomic, strong) MRItem *item;
@property (strong, nonatomic) IBOutlet UIProgressView *progressView;
@end
