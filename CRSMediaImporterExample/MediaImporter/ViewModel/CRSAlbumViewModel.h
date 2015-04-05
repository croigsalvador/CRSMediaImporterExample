//
//  CRSAlbumViewModel.h
//  CRSGalleryImporter
//
//  Created by Carlos Roig on 04/04/15.
//  Copyright (c) 2015 CRoigSalvador. All rights reserved.
//

@import UIKit;

@interface CRSAlbumViewModel : NSObject

@property (copy, nonatomic, readonly) NSString *albumTitle;

- (instancetype)initWithAssets:(NSArray *)assets
                    albumTitle:(NSString *)albumTitle;

- (NSUInteger)numberOfPictures;
- (UIImage *)imageForAssetAtIndex:(NSUInteger)index;
- (void)didSelectAssetAtIndex:(NSUInteger)index;
- (void)didDeselectAssetAtIndex:(NSUInteger)index;
- (NSArray *)selectedAssets;

@end
