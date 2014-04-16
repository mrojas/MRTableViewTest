//
//  MRItem.m
//  TableViewTest
//
//  Created by Matias Rojas on 16/04/14.
//  Copyright (c) 2014 Causania. All rights reserved.
//

#import "MRItem.h"

@implementation MRItem {
    BOOL _downloaded;
    BOOL _downloading;
    CGFloat _progress;
    NSTimer *_downloadTimer;
}

- (id)init {
    self = [super init];
    if (self) {
        _downloaded = NO;
        _downloading = NO;
        _progress = 0.0;
    }
    
    return self;
}

- (BOOL)isDownloaded {
    return _downloaded;
}

- (BOOL)isDownloading {
    return _downloading;
}

- (void)downloadItem {
    _downloading = YES;
    // Simulate network activity
    if (_delegate) {
        [_delegate didStartDownloading];
    }
    [NSTimer scheduledTimerWithTimeInterval:2.0
                                     target:self
                                   selector:@selector(updateProgress)
                                   userInfo:nil
                                    repeats:NO];
}

- (void)updateProgress {
    _progress += 0.2;
    if (_delegate) {
        [_delegate didUpdateProgress:_progress];
    }
    if (_progress < 1.0) {
        [NSTimer scheduledTimerWithTimeInterval:2.0
                                         target:self
                                       selector:@selector(updateProgress)
                                       userInfo:nil
                                        repeats:NO];
    } else {
        // Completed
        _downloading = NO;
        _downloaded = YES;
        if (_delegate) {
            [_delegate didFinishDownload];
        }
    }
}

- (CGFloat)progress {
    return _progress;
}

@end
