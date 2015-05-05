//
//  CRSAlbum.m
//  CRSGalleryImporter
//
//  Created by Carlos Roig on 31/03/15.
//  Copyright (c) 2015 CRoigSalvador. All rights reserved.
//

#import "CRSAlbum.h"

@interface CRSAlbum ()

@property (strong, nonatomic) NSMutableSet *selectedIndexList;

@end

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
        _selectedIndexList = [[NSMutableSet alloc] init];
    }
    return self;
}

- (NSArray *)selectedIndexs {
    return [[self.selectedIndexList allObjects] copy];
}

- (void)addIndexToSelectedList:(NSUInteger)indexOfAsset {
    [self.selectedIndexList addObject:@(indexOfAsset)];
}

- (void)removeIndexFromSelectedList:(NSUInteger)indexOfAsset {
    [self.selectedIndexList removeObject:@(indexOfAsset)];
}

- (NSArray *)selectedAssets {
   
    NSMutableArray *selectedAssetsList = [[NSMutableArray alloc]initWithCapacity:self.selectedIndexList.count];
    
    for (NSNumber *indexOfSelectedAsset in self.selectedIndexList) {
        NSUInteger index = [indexOfSelectedAsset integerValue];
        [selectedAssetsList addObject:self.assets[index]];
    }
    
    return [selectedAssetsList copy];
}

@end
