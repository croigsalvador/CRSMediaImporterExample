//
//  CRSAlbumViewController.h
//  CRSGalleryImporter
//
//  Created by Carlos Roig on 04/04/15.
//  Copyright (c) 2015 CRoigSalvador. All rights reserved.
//

#import "CRSGalleryImporterTheme.h"

@class CRSAlbumViewModel;

@interface CRSAlbumViewController : UIViewController

- (instancetype)initWithViewModel:(CRSAlbumViewModel *)viewModel
                            theme:(id<CRSGalleryImporterTheme>)theme
                      andDelegate:(id)delegate;

@end

@protocol CRSAlbumViewControllerDelegate <NSObject>

- (void)albumViewControllerDidPressAcceptButton:(CRSAlbumViewController *)albumsViewController withViewModel:(CRSAlbumViewModel *)viewModel;
- (void)albumViewControllerDidPressCancelButton:(CRSAlbumViewController *)albumsViewController withViewModel:(CRSAlbumViewModel *)viewModel;

@end