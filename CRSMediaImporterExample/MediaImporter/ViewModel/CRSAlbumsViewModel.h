//
//  CRSAlbumsViewModel.h
//  CRSGalleryImporter
//
//  Created by Carlos Roig on 31/03/15.
//  Copyright (c) 2015 CRoigSalvador. All rights reserved.
//

#import "CRSViewModel.h"
#import "CRSAssetsImporter.h"

@class CRSAlbum, CRSAlbumViewModel;

@interface CRSAlbumsViewModel : CRSViewModel

@property (copy, nonatomic, readonly) NSString *navigationTitle;

- (instancetype)initWithAssetsImporter:(id<CRSAssetsImporter>)assetsImproter navigationTitle:(NSString *)navigationTitle;

- (void)loadAlbumsWithMediaType:(CRSAlbumsType)mediaType completion:(void(^)())completion;
- (CRSAlbum *)albumAtIndex:(NSUInteger)index;
- (NSUInteger)numberOfAlbums;
- (NSString *)titleForAlbumAtIndex:(NSUInteger)index;
- (CRSAlbumViewModel *)albumViewModelForItemAtIndex:(NSUInteger)index;

@end
