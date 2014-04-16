//
//  MRItemTableViewCell.m
//  TableViewTest
//
//  Created by Matias Rojas on 16/04/14.
//  Copyright (c) 2014 Causania. All rights reserved.
//

#import "MRItemTableViewCell.h"

@interface MRItemTableViewCell () <ItemDownloadDelegate>

@end

@implementation MRItemTableViewCell

- (void)awakeFromNib
{
    [super awakeFromNib];
    [self setupUI];
}

- (void)didStartDownloading {
    [self setupUI];
}

- (void)didUpdateProgress:(CGFloat)progress {
    [self setupUI];
}

- (void)didFinishDownload {
    [self setupUI];
}

- (void)didFailDownload {
    //
}

- (void)setupUI {
    _progressView.hidden = ![_item isDownloading];
    _progressView.progress = _item.progress;
    
    if ([_item isDownloading]) {
        _itemLabel.text = [NSString stringWithFormat:@"Downloading %@", _item.name];
        [_activityIndicator startAnimating];
        _activityIndicator.hidden = NO;
    } else if ([_item isDownloaded]) {
        _itemLabel.textColor = [UIColor redColor];
        _itemLabel.text = [NSString stringWithFormat:@"Downloaded %@", _item.name];
        [_activityIndicator stopAnimating];
        _activityIndicator.hidden = YES;
    } else {
        // Not downloaded, not downloading (initial state)
        _itemLabel.textColor = [UIColor blackColor];
        _itemLabel.text = _item.name;
        _activityIndicator.hidden = YES;
    }
}

- (void)setItem:(MRItem *)item {
    _item = item;
    _item.delegate = self;
    [self setupUI];
}

- (void)prepareForReuse {
    _item.delegate = nil;
}

@end
