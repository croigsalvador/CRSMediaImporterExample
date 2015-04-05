//
//  CRSAlbum.m
//  CRSGalleryImporter
//
//  Created by Carlos Roig on 31/03/15.
//  Copyright (c) 2015 CRoigSalvador. All rights reserved.
//

#import "CRSAlbum.h"

@implementation CRSAlbum

- (instancetype)initWithTitle:(NSString *)title
                       assets:(NSArray *)assets
                  posterImage:(id)posterImage
               numberOfAssets:(NSInteger)numberOfAssets
{
    if (self = [super init]) {
        _title = title;
        _assets = [assets copy];
        _posterImage = posterImage;
        _numberOfAssets = numberOfAssets;
    }
    return self;
}

@end
