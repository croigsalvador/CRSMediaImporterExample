//
//  CRSMediaManager.m
//  CRSGalleryImporter
//
//  Created by Carlos Roig on 31/03/15.
//  Copyright (c) 2015 CRoigSalvador. All rights reserved.
//

#import "CRSMediaController.h"
#import "CRSAssetsImporter.h"
#import "CRSAlbumsViewController.h"
#import "CRSAlbumsViewModel.h"
#import "CRSAlbumViewModel.h"
#import "CRSAlbumViewController.h"
#import "CRSRouter.h"
#import "CRSAlbum.h"
#import "CRSALAssetsImporter.h"

@interface CRSMediaController ()
@property (strong, nonatomic) UIViewController *rootViewController;
@property (copy, nonatomic) CRSMediaControllerCompletion completion;
@property (weak, nonatomic) id<CRSMediaControllerDelegate> delegate;
@property (assign, nonatomic) CRSMediaType mediaType;
@property (strong, nonatomic) id<CRSAssetsImporter> assetsImporter;
@property (strong, nonatomic) CRSRouter *router;
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

- (void)presentGalleryViewController {
    CRSAlbumsViewModel *albumsViewModel = [[CRSAlbumsViewModel alloc] initWithAssetsImporter:self.assetsImporter navigationTitle:@"ALBUMS"];
    CRSAlbumsViewController *albumsViewController = [[CRSAlbumsViewController alloc] initWithRouter:self.router viewModel:albumsViewModel];
    
    [self.router presentViewController:albumsViewController onRootViewController:self.rootViewController];
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
}


- (CRSRouter *)router {
    if (!_router) {
        _router = [[CRSRouter alloc] init];
    }
    return _router;
}

- (id<CRSAssetsImporter>)assetsImporter {
    if (!_assetsImporter) {
        _assetsImporter =[[CRSALAssetsImporter alloc] init];
    }
    return _assetsImporter ;
}


@end
