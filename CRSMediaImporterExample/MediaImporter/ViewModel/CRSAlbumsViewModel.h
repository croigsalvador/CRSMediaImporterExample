//
//  CRSAlbumsViewModel.h
//  CRSGalleryImporter
//
//  Created by Carlos Roig on 31/03/15.
//  Copyright (c) 2015 CRoigSalvador. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CRSAlbum;

@interface CRSAlbumsViewModel : NSObject

@property (copy, nonatomic, readonly) NSString *navigationTitle;

- (instancetype)initWithAlbums:(NSArray *)albums
              navigationTitle:(NSString *)navigationTitle;
- (NSUInteger)numberOfAlbums;
- (NSString *)titleForAlbumAtIndex:(NSUInteger)index;
- (void)didSelectAlbumAtIndex:(NSUInteger)index;
- (CRSAlbum *)selectedAlbum;

@end
