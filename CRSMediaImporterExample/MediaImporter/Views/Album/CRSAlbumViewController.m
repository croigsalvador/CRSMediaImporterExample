//
//  CRSAlbumViewController.m
//  CRSGalleryImporter
//
//  Created by Carlos Roig on 04/04/15.
//  Copyright (c) 2015 CRoigSalvador. All rights reserved.
//

#import "CRSAlbumViewController.h"
#import "CRSGalleryImporterTheme.h"
#import "CRSAlbumCollectionViewManager.h"
#import "CRSAlbumViewModel.h"
#import "CRSPictureCollectionViewCell.h"

@interface CRSAlbumViewController () <CRSAlbumCollectionViewManagerDelegate>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (strong, nonatomic) CRSAlbumViewModel *albumViewModel;
@property (strong, nonatomic) id <CRSGalleryImporterTheme> theme;
@property (strong, nonatomic) CRSAlbumCollectionViewManager *collectionDataSource;

@end

@implementation CRSAlbumViewController

#pragma mark - ViewController lifeCycle

- (void)viewDidLoad {
    [super viewDidLoad];
    self.albumViewModel = (CRSAlbumViewModel *)self.viewModel;
    self.title = self.albumViewModel.albumTitle;
    [self setupCollectionView];
}

#pragma mark - Setup

- (void)setupCollectionView {
    NSString *cellIdentfier = NSStringFromClass([CRSPictureCollectionViewCell class]);
    [self.collectionView registerNib:[UINib nibWithNibName:cellIdentfier bundle:nil] forCellWithReuseIdentifier:cellIdentfier];
    
    self.collectionDataSource = [[CRSAlbumCollectionViewManager alloc] initWithViewModel:self.viewModel cellIdentifier:cellIdentfier andDelegate:self];
    self.collectionView.dataSource = self.collectionDataSource;
    self.collectionView.delegate = self.collectionDataSource;
    self.collectionView.allowsMultipleSelection = YES;
}


#pragma mark - CRSAlbumCollectionViewManagerDelegate 

- (void)albumCollectionViewManager:(CRSAlbumCollectionViewManager *)albumCollectionViewManager albumCollectionViewCell:(CRSPictureCollectionViewCell *)cell atIndex:(NSUInteger)index {
    cell.assetImage = [self.albumViewModel imageForAssetAtIndex:index];
}

- (void)albumCollectionViewManager:(CRSAlbumCollectionViewManager *)albumCollectionViewManager didSelectItemAtIndex:(NSUInteger)index {
    [self.albumViewModel didSelectAssetAtIndex:index];
}

- (void)albumCollectionViewManager:(CRSAlbumCollectionViewManager *)albumCollectionViewManager didDeselectItemAtIndex:(NSUInteger)index {
    [self.albumViewModel didDeselectAssetAtIndex:index];
}


@end
