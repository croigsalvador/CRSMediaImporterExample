//
//  CRSGalleryViewModel.m
//  CRSMediaImporterExample
//
//  Created by Carlos Roig on 21/04/15.
//  Copyright (c) 2015 CRoigSalvador. All rights reserved.
//

#import "CRSGalleryViewModel.h"
#import "CRSAlbumsViewModel.h"
#import "CRSAssetsInteractor.h"

@interface CRSGalleryViewModel ()

@property (strong, nonatomic) CRSAssetsInteractor *assetsInteractor;

@end

@implementation CRSGalleryViewModel

- (instancetype)initWithAssetsInteractor:(CRSAssetsInteractor *)assetsInteractor {
    if (self = [super init]) {
        _assetsInteractor = assetsInteractor;
    }
    return self;
}

- (void)albumsFromUserGaller {
    [self.assetsInteractor obtainAlbumsFromGalleryOfType:CRSAlbumsPictures inQueue:[NSOperationQueue mainQueue] withCompletion:^(NSArray *albums, NSError *error) {
        CRSAlbumsViewModel *viewModel = [[CRSAlbumsViewModel alloc] initWithAlbums:albums navigationTitle:@"Albums"];
    }];
}

- (CRSAlbumsViewModel *)albumsViewModel {
    CRSAlbumsViewModel *albumsViewModel = [CRSAlbumsViewModel alloc] initWithAlbums:<#(NSArray *)#> navigationTitle:<#(NSString *)#>
}

- (NSString *)selectedElementsInGallery {
    return @"2 elements Selected";
}

@end
