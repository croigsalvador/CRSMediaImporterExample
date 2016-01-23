//
//  CRSRouter.h
//  CRSMediaImporterExample
//
//  Created by Carlos Roig on 23/01/16.
//  Copyright © 2016 CRoigSalvador. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CRSAlbumViewController, CRSAlbumsViewController;

@interface CRSRouter : NSObject

- (void)presentViewController:(CRSAlbumsViewController *)albumsViewController
                onRootViewController:(UIViewController *)rootViewController;
- (void)albumViewControllerDidPressCancelButton:(CRSAlbumViewController *)albumsViewController;
- (void)albumViewControllerPopButtonPressed:(CRSAlbumsViewController *)albumsViewController;
- (void)albumsViewController:(CRSAlbumsViewController *)albumsViewController
     pushAlbumViewController:(CRSAlbumViewController *)albumViewController;



@end
