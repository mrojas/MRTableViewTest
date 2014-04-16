//
//  MRViewController.m
//  TableViewTest
//
//  Created by Matias Rojas on 16/04/14.
//  Copyright (c) 2014 Causania. All rights reserved.
//

#import "MRViewController.h"
#import "MRItem.h"
#import "MRItemTableViewCell.h"

#define kMaxElements 200

@interface MRViewController () <UITableViewDataSource, UITableViewDelegate>

@end

@implementation MRViewController {
    NSMutableArray *_items;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    _items = [NSMutableArray arrayWithCapacity:kMaxElements];
    
    for (int i = 0; i < kMaxElements; i++) {
        MRItem *item = [[MRItem alloc] init];
        item.name = [NSString stringWithFormat:@"Tap to download %d", i];
        [_items addObject:item];
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MRItemTableViewCell *cell = (MRItemTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"itemTableCell"];
    
    MRItem *item = [_items objectAtIndex:indexPath.row];
    [cell setItem:item];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    MRItem *item = [_items objectAtIndex:indexPath.row];
    if (![item isDownloading]) {
        [item downloadItem];
    }
}

@end
