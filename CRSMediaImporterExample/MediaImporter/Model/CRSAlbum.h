//
//  CRSAlbum.h
//  CRSGalleryImporter
//
//  Created by Carlos Roig on 31/03/15.
//  Copyright (c) 2015 CRoigSalvador. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CRSAlbum : NSObject

@property (copy, nonatomic, readonly) NSString *title;
@property (copy, nonatomic, readonly) NSArray *assets;
@property (assign, nonatomic, readonly) id posterImage;
@property (assign, nonatomic, readonly) NSUInteger numberOfAssets;
@property (copy, nonatomic, readonly) NSArray *selectedIndexs;

- (instancetype)initWithTitle:(NSString *)title
                       assets:(NSArray *)assets
                  posterImage:(id)posterImage
               numberOfAssets:(NSInteger)numberOfAssets;

- (void)addIndexToSelectedList:(NSUInteger)indexOfAsset;
- (void)removeIndexFromSelectedList:(NSUInteger)indexOfAsset;
- (NSArray *)selectedAssets;

@end
