//
//  CRSGalleryViewController.h
//  CRSMediaImporterExample
//
//  Created by Carlos Roig on 21/04/15.
//  Copyright (c) 2015 CRoigSalvador. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CRSAlbumsViewController, CRSGalleryViewModel;

@interface CRSGalleryViewController : UIViewController

- (instancetype)initWithViewModel:(CRSGalleryViewModel *)viewModel
          navAlbumsViewController:(UINavigationController *)navAlbumsViewController;

@end
