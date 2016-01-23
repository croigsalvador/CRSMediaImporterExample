//
//  CRSAlbumsViewController.m
//  CRSGalleryImporter
//
//  Created by Carlos Roig on 31/03/15.
//  Copyright (c) 2015 CRoigSalvador. All rights reserved.
//

#import "CRSAlbumsViewController.h"
#import "CRSAlbumsTableViewManager.h"
#import "CRSAlbumsViewModel.h"
#import "CRSAlbumTableViewCell.h"
#import "CRSAlbumViewController.h"

@interface CRSAlbumsViewController () <CRSAlbumsTableViewManagerDelegate>

@property (strong, nonatomic) UITableView *albumsTableView;
@property (strong, nonatomic) CRSAlbumsTableViewManager *tableViewManager;
@property (strong, nonatomic) CRSAlbumsViewModel *albumsViewModel;
@property (strong, nonatomic) id <CRSAlbumsViewControllerDelegate> delegate;

@end

@implementation CRSAlbumsViewController


#pragma mark - ViewController LifeCycle Methods

- (void)viewDidLoad {
    [super viewDidLoad];
    self.albumsViewModel = (CRSAlbumsViewModel *)self.viewModel;
    self.title = self.albumsViewModel.navigationTitle;
    [self.albumsViewModel loadAlbumsWithMediaType:CRSAlbumsPictures completion:^{
            [self setupTableView];
    }];

    
}

#pragma mark - Setup methods

- (void)setupTableView {
    NSString *cellIdentifier = NSStringFromClass([UITableViewCell class]);
    self.albumsTableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];

    self.tableViewManager = [[CRSAlbumsTableViewManager alloc] initWithAlbumsViewModel:self.albumsViewModel tableView:self.albumsTableView cellIdentifier:cellIdentifier andDelegate:self];

    [self.view addSubview:self.albumsTableView];
}

#pragma mark - CRSAlbumsTableViewManagerDelegate Methods

- (void)albumsTableViewManager:(CRSAlbumsTableViewManager *)albumsTabelViewManager didSelectItemAtIndex:(NSUInteger)index
{
    CRSAlbumViewController *albumViewController = [[CRSAlbumViewController alloc] initWithRouter:self.router viewModel:[self.albumsViewModel albumViewModelForItemAtIndex:index]];
    [self.router albumsViewController:self pushAlbumViewController:albumViewController];
    
}

@end
