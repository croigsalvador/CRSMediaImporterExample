//
//  CRSAlbumViewModel.m
//  CRSGalleryImporter
//
//  Created by Carlos Roig on 04/04/15.
//  Copyright (c) 2015 CRoigSalvador. All rights reserved.
//

#import "CRSAlbumViewModel.h"
#import <AssetsLibrary/AssetsLibrary.h>

@interface CRSAlbumViewModel ()

@property (copy, nonatomic) NSArray *assets;
@property (strong, nonatomic) NSMutableSet *selectedPictures;

@end

@implementation CRSAlbumViewModel

- (instancetype)initWithAssets:(NSArray *)assets
                   albumTitle:(NSString *)albumTitle
{
    if (self != [super init]) return nil;
    _assets = [assets copy];
    _albumTitle = albumTitle;
    return self;
}

- (NSUInteger)numberOfPictures {
    return self.assets.count;
}

- (UIImage *)imageForAssetAtIndex:(NSUInteger)index
{
    ALAsset *asset = self.assets[index];
    return [UIImage imageWithCGImage:[asset thumbnail]];
}

- (void)didSelectAssetAtIndex:(NSUInteger)index {
    [self.selectedPictures addObject:self.assets[index]];
}

- (void)didDeselectAssetAtIndex:(NSUInteger)index {
    [self.selectedPictures removeObject:self.assets[index]];
}

- (NSArray *)selectedAssets {
    return self.selectedPictures.allObjects;
}

@end
