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
@property (strong, nonatomic) CRSAlbumViewModel *viewModel;
@property (strong, nonatomic) id <CRSGalleryImporterTheme> theme;
@property (strong, nonatomic) CRSAlbumCollectionViewManager *collectionDataSource;
@property (weak, nonatomic) id delegate;

@end

@implementation CRSAlbumViewController

#pragma mark - Initializers

- (instancetype)initWithViewModel:(CRSAlbumViewModel *)viewModel
                            theme:(id<CRSGalleryImporterTheme>)theme
                      andDelegate:(id)delegate
{
    if (self = [super init]) {
        _viewModel = viewModel;
        _theme = theme;
        _delegate = delegate;
    }
    return self;
}

#pragma mark - ViewController lifeCycle

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = self.viewModel.albumTitle;
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
    cell.assetImage = [self.viewModel imageForAssetAtIndex:index];
}

- (void)albumCollectionViewManager:(CRSAlbumCollectionViewManager *)albumCollectionViewManager didSelectItemAtIndex:(NSUInteger)index {
    [self.viewModel didSelectAssetAtIndex:index];
}

- (void)albumCollectionViewManager:(CRSAlbumCollectionViewManager *)albumCollectionViewManager didDeselectItemAtIndex:(NSUInteger)index {
    [self.viewModel didDeselectAssetAtIndex:index];
}


@end
