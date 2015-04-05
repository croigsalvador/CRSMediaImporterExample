//
//  CRSAlbumCollectionViewManager.m
//  CRSGalleryImporter
//
//  Created by Carlos Roig on 05/04/15.
//  Copyright (c) 2015 CRoigSalvador. All rights reserved.
//

#import "CRSAlbumCollectionViewManager.h"
#import "CRSAlbumViewModel.h"

@interface CRSAlbumCollectionViewManager ()

@property (strong, nonatomic) CRSAlbumViewModel *viewModel;
@property (copy, nonatomic) NSString *cellIdentifier;
@property (weak, nonatomic) id <CRSAlbumCollectionViewManagerDelegate> delegate;

@end

@implementation CRSAlbumCollectionViewManager

- (instancetype)initWithViewModel:(id)viewModel
                   cellIdentifier:(NSString *)cellIdentifier
                      andDelegate:(id<CRSAlbumCollectionViewManagerDelegate>)delegate
{
    if (self = [super init]) {
        _viewModel = viewModel;
        _cellIdentifier = cellIdentifier;
        _delegate = delegate;
    }
    return self;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [self.viewModel numberOfPictures];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:self.cellIdentifier forIndexPath:indexPath];
    
    [self.delegate albumCollectionViewManager:self albumCollectionViewCell:cell atIndex:indexPath.item];
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if ([self.delegate respondsToSelector:@selector(albumCollectionViewManager:didSelectItemAtIndex:)]) {
        [self.delegate albumCollectionViewManager:self didSelectItemAtIndex:indexPath.item];
    }
}

- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath {
    if ([self.delegate respondsToSelector:@selector(albumCollectionViewManager:didDeselectItemAtIndex:)]) {
        [self.delegate albumCollectionViewManager:self didDeselectItemAtIndex:indexPath.item];
    }
}

@end
