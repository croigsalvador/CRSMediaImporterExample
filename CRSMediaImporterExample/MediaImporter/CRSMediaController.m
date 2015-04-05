//
//  CRSMediaManager.m
//  CRSGalleryImporter
//
//  Created by Carlos Roig on 31/03/15.
//  Copyright (c) 2015 CRoigSalvador. All rights reserved.
//

#import "CRSMediaController.h"
#import "CRSAssetsInteractor.h"
#import "CRSAlbumsViewController.h"
#import "CRSAlbumsViewModel.h"
#import "CRSAlbumViewModel.h"
#import "CRSAlbumViewController.h"
#import "CRSGalleryNavigationMediator.h"
#import "CRSAlbum.h"

@interface CRSMediaController () <CRSAlbumsViewControllerDelegate, CRSAlbumViewControllerDelegate>

@property (strong, nonatomic) UIViewController *rootViewController;
@property (copy, nonatomic) CRSMediaControllerCompletion completion;
@property (weak, nonatomic) id<CRSMediaControllerDelegate> delegate;
@property (assign, nonatomic) CRSMediaType mediaType;
@property (strong, nonatomic) CRSAssetsInteractor *assetsInteractor;
@property (strong, nonatomic) CRSGalleryNavigationMediator *galleryNavigation;

@end

@implementation CRSMediaController

+ (void)presentMediaControllerInViewController:(UIViewController *)viewController
                                     mediaType:(CRSMediaType)mediaType
                                    inDelegate:(id <CRSMediaControllerDelegate>)delegate
{
    CRSMediaController *mediaController = [[self alloc] initWithViewController:viewController
                                                                     mediaType:mediaType
                                                                      delegate:delegate];
    [mediaController presentGalleryViewController];
    
}

+ (void)presentMediaControllerInViewController:(UIViewController *)viewController
                                     mediaType:(CRSMediaType)mediaType
                           withCompletionBlock:(CRSMediaControllerCompletion)completion {
    
}


- (instancetype)initWithViewController:(UIViewController *)viewController
                             mediaType:(CRSMediaType)mediaType
                              delegate:(id<CRSMediaControllerDelegate>)delegate
{
    if (self = [super init]) {
        _rootViewController = viewController;
        _mediaType = mediaType;
        _delegate = delegate;
    }
    return self;
}

- (instancetype)initWithViewController:(UIViewController *)viewController
                             mediaType:(CRSMediaType)mediaType
                   withCompletionBlock:(CRSMediaControllerCompletion)completion
{
    if (self = [super init]) {
        _rootViewController = viewController;
        _mediaType = mediaType;
        _completion = completion;
    }
    return self;
}

- (CRSAssetsInteractor *)assetsInteractor {
    if (!_assetsInteractor) {
        _assetsInteractor = [[CRSAssetsInteractor alloc] init];
    }
    return _assetsInteractor;
}

- (CRSGalleryNavigationMediator *)galleryNavigation {
    if (!_galleryNavigation) {
        _galleryNavigation = [[CRSGalleryNavigationMediator alloc] init];
    }
    return _galleryNavigation;
}

- (void)presentGalleryViewController {
    
    [self.assetsInteractor obtainAlbumsFromGalleryOfType:CRSAlbumsPictures inQueue:[NSOperationQueue mainQueue] withCompletion:^(NSArray *albums, NSError *error) {
        
        CRSAlbumsViewModel *viewModel = [[CRSAlbumsViewModel alloc] initWithAlbums:albums navigationTitle:@"Albums"];
        
        CRSAlbumsViewController *albumViewController = [[CRSAlbumsViewController alloc] initWithViewModel:viewModel theme:nil andDelegate:self];
        
        [self.galleryNavigation navigateFromViewController:self.rootViewController toViewController:[[UINavigationController alloc] initWithRootViewController:albumViewController] withNavigationType:CRSGalleryNavigationPresent];
    }];
}


#pragma mark - CRSAlbumsViewControllerDelegate 

- (void)albumsViewController:(CRSAlbumsViewController *)albumsViewController didSelectAlbumAtIndexWithViewModel:(CRSAlbumsViewModel *)viewModel {
    
    CRSAlbum *album = [viewModel selectedAlbum];
    CRSAlbumViewModel *albumViewModel = [[CRSAlbumViewModel alloc] initWithAssets:album.assets albumTitle:album.title];
    
    CRSAlbumViewController *albumViewController = [[CRSAlbumViewController alloc] initWithViewModel:albumViewModel theme:nil andDelegate:self];
    
    [self.galleryNavigation navigateFromViewController:albumsViewController toViewController:albumViewController withNavigationType:CRSGalleryNavigationPush];
 }

- (void)albumsViewControllerDidPressCancelButton:(CRSAlbumsViewController *)albumsViewController
                                   withViewModel:(CRSAlbumsViewModel *)viewModel
{
    [self.galleryNavigation navigateFromViewController:albumsViewController toViewController:self.rootViewController withNavigationType:CRSGalleryNavigationDismiss];
}

#pragma mark - CRSAlbumViewControllerDelegate

- (void)albumViewControllerDidPressAcceptButton:(CRSAlbumViewController *)albumsViewController
                                  withViewModel:(CRSAlbumViewModel *)viewModel
{
    
    if ([self.delegate respondsToSelector:@selector(mediaController:didSelectAssets:)]) {
        [self.delegate mediaController:self didSelectAssets:viewModel.selectedAssets];
    }
    if (self.completion) {
        self.completion(viewModel.selectedAssets);
    }
    [self.galleryNavigation navigateFromViewController:albumsViewController toViewController:nil withNavigationType:CRSGalleryNavigationDismiss];
}

- (void)albumViewControllerDidPressCancelButton:(CRSAlbumViewController *)albumsViewController
                                  withViewModel:(CRSAlbumViewModel *)viewModel
{
    [self.galleryNavigation navigateFromViewController:albumsViewController toViewController:nil withNavigationType:CRSGalleryNavigationDismiss];
}


@end
