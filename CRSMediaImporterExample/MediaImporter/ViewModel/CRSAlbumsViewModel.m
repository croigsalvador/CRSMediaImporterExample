//
//  CRSAlbumsViewModel.m
//  CRSGalleryImporter
//
//  Created by Carlos Roig on 31/03/15.
//  Copyright (c) 2015 CRoigSalvador. All rights reserved.
//

#import "CRSAlbumsViewModel.h"
#import "CRSAlbum.h"

@interface CRSAlbumsViewModel ()

@property (copy, nonatomic) NSArray *albums;
@property (strong, nonatomic) CRSAlbum *album;

@end

@implementation CRSAlbumsViewModel

- (instancetype)initWithAlbums:(NSArray *)albums
               navigationTitle:(NSString *)navigationTitle;
{
    if (self != [super init]) return nil;
    _albums = albums;
    _navigationTitle = navigationTitle;
    return self;
}

- (NSUInteger)numberOfAlbums {
    return self.albums.count;
}

- (NSString *)titleForAlbumAtIndex:(NSUInteger)index {
    CRSAlbum *album  = self.albums[index];
    return album.title;
}

- (void)didSelectAlbumAtIndex:(NSUInteger)index {
    self.album = self.albums[index];
}

- (CRSAlbum *)selectedAlbum {
    return self.album;
}

@end
