//
//  CRSAlbumsViewController.h
//  CRSGalleryImporter
//
//  Created by Carlos Roig on 31/03/15.
//  Copyright (c) 2015 CRoigSalvador. All rights reserved.
//

#import "CRSBaseViewController.h"

@protocol CRSAlbumsViewControllerDelegate;

@class CRSAlbumsViewModel;

@interface CRSAlbumsViewController : CRSBaseViewController


@end

@protocol CRSAlbumsViewControllerDelegate <NSObject>

- (void)albumsViewController:(CRSAlbumsViewController *)albumsViewController didSelectAlbumAtIndexWithViewModel:(CRSAlbumsViewModel *)viewModel;
- (void)albumsViewControllerDidPressCancelButton:(CRSAlbumsViewController *)albumsViewController withViewModel:(CRSAlbumsViewModel *)viewModel;

@end