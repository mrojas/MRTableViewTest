//
//  MRItem.h
//  TableViewTest
//
//  Created by Matias Rojas on 16/04/14.
//  Copyright (c) 2014 Causania. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ItemDownloadDelegate <NSObject>

- (void)didStartDownloading;
- (void)didUpdateProgress:(CGFloat)progress;
- (void)didFinishDownload;
- (void)didFailDownload;

@end

@interface MRItem : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) id<ItemDownloadDelegate> delegate;

- (void)downloadItem;
- (BOOL)isDownloading;
- (BOOL)isDownloaded;
- (CGFloat)progress;

@end
