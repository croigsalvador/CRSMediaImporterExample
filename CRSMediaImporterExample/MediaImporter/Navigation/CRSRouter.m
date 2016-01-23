//
//  CRSRouter.m
//  CRSMediaImporterExample
//
//  Created by Carlos Roig on 23/01/16.
//  Copyright © 2016 CRoigSalvador. All rights reserved.
//

#import "CRSRouter.h"
#import "CRSAlbumViewController.h"
#import "CRSAlbumsViewController.h"

@interface CRSRouter ()

@property (strong, nonatomic) UINavigationController *navigationController;

@end

@implementation CRSRouter

- (void)presentViewController:(CRSAlbumsViewController *)albumsViewController onRootViewController:(UIViewController *)rootViewController
{
    self.navigationController = [[UINavigationController alloc] initWithRootViewController:albumsViewController];
    [rootViewController presentViewController:self.navigationController animated:YES completion:NULL];
}

- (void)albumViewControllerDidPressCancelButton:(CRSAlbumViewController *)albumsViewController
{
    [albumsViewController dismissViewControllerAnimated:YES completion:NULL];
}

- (void)albumViewControllerPopButtonPressed:(CRSAlbumsViewController *)albumsViewController
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)albumsViewController:(CRSAlbumsViewController *)albumsViewController pushAlbumViewController:(CRSAlbumViewController *)albumViewController
{
    [self.navigationController pushViewController:albumViewController animated:YES];
}



@end
