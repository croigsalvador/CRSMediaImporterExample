//
//  CRSTableViewManager.h
//  CRSGalleryImporter
//
//  Created by Carlos Roig on 31/03/15.
//  Copyright (c) 2015 CRoigSalvador. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CRSAlbumsTableViewManagerDelegate;
@class CRSAlbumsViewModel;

@interface CRSAlbumsTableViewManager : NSObject <UITableViewDataSource, UITableViewDelegate>

- (instancetype)initWithAlbumsViewModel:(CRSAlbumsViewModel *)viewModel
                              tableView:(UITableView *)tableView
                         cellIdentifier:(NSString *)cellIdentifier
                            andDelegate:(id<CRSAlbumsTableViewManagerDelegate>)delegate;

@end

@protocol CRSAlbumsTableViewManagerDelegate <NSObject>

- (void)albumsTableViewManager:(CRSAlbumsTableViewManager *)albumsTabelViewManager
          didSelectItemAtIndex:(NSUInteger)index;


@end