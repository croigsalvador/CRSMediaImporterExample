//
//  CRSAlbumCollectionViewManager.h
//  CRSGalleryImporter
//
//  Created by Carlos Roig on 05/04/15.
//  Copyright (c) 2015 CRoigSalvador. All rights reserved.
//

@import UIKit;

@protocol CRSAlbumCollectionViewManagerDelegate;

@interface CRSAlbumCollectionViewManager : NSObject <UICollectionViewDataSource, UICollectionViewDelegate>

- (instancetype)initWithViewModel:(id)viewModel
                   cellIdentifier:(NSString *)cellIdentifier
                      andDelegate:(id<CRSAlbumCollectionViewManagerDelegate>)delegate;

@end

@protocol CRSAlbumCollectionViewManagerDelegate <NSObject>

- (void)albumCollectionViewManager:(CRSAlbumCollectionViewManager *)albumCollectionViewManager
            albumCollectionViewCell:(UICollectionViewCell *)cell
                       atIndex:(NSUInteger)index;

- (void)albumCollectionViewManager:(CRSAlbumCollectionViewManager *)albumCollectionViewManager
          didSelectItemAtIndex:(NSUInteger)index;

- (void)albumCollectionViewManager:(CRSAlbumCollectionViewManager *)albumCollectionViewManager didDeselectItemAtIndex:(NSUInteger)index;

@end