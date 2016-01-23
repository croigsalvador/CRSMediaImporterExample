//
//  CRSAlbumsViewModel.m
//  CRSGalleryImporter
//
//  Created by Carlos Roig on 31/03/15.
//  Copyright (c) 2015 CRoigSalvador. All rights reserved.
//

#import "CRSAlbumsViewModel.h"
#import "CRSAssetsImporter.h"
#import "CRSAlbum.h"
#import "CRSAlbumViewModel.h"

@interface CRSAlbumsViewModel ()

@property (copy, nonatomic) NSArray *albums;
@property (strong, nonatomic) id<CRSAssetsImporter> assetsImporter;

@end

@implementation CRSAlbumsViewModel

- (instancetype)initWithAssetsImporter:(id<CRSAssetsImporter>)assetsImproter navigationTitle:(NSString *)navigationTitle {
    if (self = [super init]) {
        _assetsImporter = assetsImproter;
    }
    return self;
}

- (void)loadAlbumsWithMediaType:(CRSAlbumsType)mediaType completion:(void(^)())completion {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [self.assetsImporter obtainAlbumsFromGalleryOfType:mediaType inQueue:[NSOperationQueue mainQueue] withCompletion:^(NSArray *albums, NSError *error) {
            self.albums = [albums copy];
            completion();
        }];
    });
}

- (CRSAlbum *)albumAtIndex:(NSUInteger)index {
    return self.albums[index];
}

- (NSUInteger)numberOfAlbums {
    return self.albums.count;
}

- (NSString *)titleForAlbumAtIndex:(NSUInteger)index {
    CRSAlbum *album  = self.albums[index];
    return album.title;
}

- (CRSAlbumViewModel *)albumViewModelForItemAtIndex:(NSUInteger)index
{
    CRSAlbum *album = [self albumAtIndex:index];
    return [[CRSAlbumViewModel alloc] initWithAssets:album.assets albumTitle:album.title];
}

@end
