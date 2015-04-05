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

@end

@implementation CRSAlbumsTableViewManager

- (instancetype)initWithAlbumsViewModel:(CRSAlbumsViewModel *)viewModel
                         cellIdentifier:(NSString *)cellIdentifier
                            andDelegate:(id<CRSAlbumsTableViewManagerDelegate>)delegate
{
    if (self = [super init]) {
        _viewModel = viewModel;
        _cellIdentifier = cellIdentifier;
        _delegate = delegate;
    }
    return self;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.viewModel numberOfAlbums];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:self.cellIdentifier forIndexPath:indexPath];
    
    [self.delegate albumsTableViewManager:self albumTableViewCell:cell atIndex:indexPath.item];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if ([self.delegate respondsToSelector:@selector(albumsTableViewManager:didSelectItemAtIndex:)]) {
        [self.delegate albumsTableViewManager:self didSelectItemAtIndex:indexPath.item];
    }
}


@end
