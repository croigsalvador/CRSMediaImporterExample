//
//  CRSTableViewManager.m
//  CRSGalleryImporter
//
//  Created by Carlos Roig on 31/03/15.
//  Copyright (c) 2015 CRoigSalvador. All rights reserved.
//

#import "CRSAlbumsTableViewManager.h"
#import "CRSAlbumsViewModel.h"

@interface CRSAlbumsTableViewManager ()

@property (strong, nonatomic) CRSAlbumsViewModel *viewModel;
@property (copy, nonatomic) NSArray *items;
@property (copy, nonatomic) NSString *cellIdentifier;
@property (weak, nonatomic) id <CRSAlbumsTableViewManagerDelegate> delegate;
@property (strong, nonatomic) UITableView *tableView;

@end

@implementation CRSAlbumsTableViewManager

- (instancetype)initWithAlbumsViewModel:(CRSAlbumsViewModel *)viewModel
                              tableView:(UITableView *)tableView
                         cellIdentifier:(NSString *)cellIdentifier
                            andDelegate:(id<CRSAlbumsTableViewManagerDelegate>)delegate
{
    if (self = [super init])
    {
        _tableView = tableView;
        _viewModel = viewModel;
        _cellIdentifier = cellIdentifier;
        _delegate = delegate;
        [self setUpTableView];
    }
    return self;
}

- (void)setUpTableView {
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:self.cellIdentifier];
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    [self.tableView reloadData];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.viewModel numberOfAlbums];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:self.cellIdentifier forIndexPath:indexPath];
    
    cell.textLabel.text = [self.viewModel titleForAlbumAtIndex:indexPath.item];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if ([self.delegate respondsToSelector:@selector(albumsTableViewManager:didSelectItemAtIndex:)]) {
        [self.delegate albumsTableViewManager:self didSelectItemAtIndex:indexPath.item];
    }
}


@end
