//
//  CRSAlbumsInteractor.m
//  CRSGalleryImporter
//
//  Created by Carlos Roig on 31/03/15.
//  Copyright (c) 2015 CRoigSalvador. All rights reserved.
//

#import "CRSALAssetsImporter.h"
#import <AssetsLibrary/AssetsLibrary.h>
#import "CRSAlbum.h"

@interface CRSALAssetsImporter ()

@property (copy, nonatomic) NSArray *albums;

@end

@implementation CRSALAssetsImporter

- (ALAssetsLibrary *)defaultLibrary
{
    static dispatch_once_t onceToken;
    static ALAssetsLibrary *library = nil;
    dispatch_once(&onceToken, ^{
        library = [[ALAssetsLibrary alloc] init];
    });
    return library;
}

- (void)obtainAlbumsFromGalleryOfType:(CRSAlbumsType)albumType
                              inQueue:(NSOperationQueue *)queue
                       withCompletion:(CRSAssetsImporterCompletion)completion {
    
    ALAssetsLibrary *assetsLibrary = [self defaultLibrary];
    __block NSMutableArray *albums = [NSMutableArray array];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        [assetsLibrary enumerateGroupsWithTypes:ALAssetsGroupAll usingBlock:^(ALAssetsGroup *group, BOOL *stop) {
            
            [group setAssetsFilter:[ALAssetsFilter allAssets]];
            NSMutableArray *assets = [NSMutableArray array];
            
            [group enumerateAssetsUsingBlock:^(ALAsset *result, NSUInteger index, BOOL *stop) {
                if (result) {
                    [assets addObject:result];
                }
            }];
            if (!group) {
                self.albums = [albums copy];
                [queue addOperationWithBlock:^{
                    completion(self.albums, nil);
                }];
            } else {
                NSString *title = [group valueForProperty:ALAssetsGroupPropertyName];
                CRSAlbum *album = [[CRSAlbum alloc] initWithTitle:title assets:[assets copy] posterImage:nil numberOfAssets:[group numberOfAssets]];
                [albums addObject:album];
            }
        } failureBlock:^(NSError *error) {
            [queue addOperationWithBlock:^{
                completion(nil, error);
            }];
        }];
    });
}


@end
