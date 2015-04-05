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

@interface CRSAlbumsViewController () <CRSAlbumsTableViewManagerDelegate>

@property (strong, nonatomic) UITableView *albumsTableView;
@property (strong, nonatomic) CRSAlbumsTableViewManager *tableViewManager;
@property (strong, nonatomic) CRSAlbumsViewModel *viewModel;
@property (strong, nonatomic) id <CRSGalleryImporterTheme> theme;
@property (strong, nonatomic) id <CRSAlbumsViewControllerDelegate> delegate;

@end

@implementation CRSAlbumsViewController

- (instancetype)initWithViewModel:(CRSAlbumsViewModel *)viewModel
                            theme:(id<CRSGalleryImporterTheme>)theme
                      andDelegate:(id<CRSAlbumsViewControllerDelegate>)delegate
{
    if (self = [super init]) {
        _viewModel = viewModel;
        _theme = theme;
        _delegate = delegate;
    }
    return self;
}

#pragma mark - ViewController LifeCycle Methods

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = self.viewModel.navigationTitle;
    [self setupTableView];
}

#pragma mark - Setup methods

- (void)setupTableView {
    NSString *cellIdentifier = NSStringFromClass([UITableViewCell class]);
    self.tableViewManager = [[CRSAlbumsTableViewManager alloc] initWithAlbumsViewModel:self.viewModel cellIdentifier:cellIdentifier andDelegate:self];
    self.albumsTableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    [self.albumsTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellIdentifier];

    self.albumsTableView.dataSource = self.tableViewManager;
    self.albumsTableView.delegate = self.tableViewManager;
    [self.view addSubview:self.albumsTableView];
}

#pragma mark - CRSAlbumsTableViewManagerDelegate Methods

- (void)albumsTableViewManager:(CRSAlbumsTableViewManager *)albumsTabelViewManager
            albumTableViewCell:(CRSAlbumTableViewCell *)cell
                       atIndex:(NSUInteger)index
{
    cell.textLabel.text = [self.viewModel titleForAlbumAtIndex:index];
}

- (void)albumsTableViewManager:(CRSAlbumsTableViewManager *)albumsTabelViewManager didSelectItemAtIndex:(NSUInteger)index
{
    [self.viewModel didSelectAlbumAtIndex:index];
    if ([self.delegate respondsToSelector:@selector(albumsViewController:didSelectAlbumAtIndexWithViewModel:)]) {
        [self.delegate albumsViewController:self didSelectAlbumAtIndexWithViewModel:self.viewModel];
    }
}

@end
