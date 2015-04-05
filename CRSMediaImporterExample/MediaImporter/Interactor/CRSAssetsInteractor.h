//
//  CRSAlbumsInteractor.h
//  CRSGalleryImporter
//
//  Created by Carlos Roig on 31/03/15.
//  Copyright (c) 2015 CRoigSalvador. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, CRSAlbumsType) {
        CRSAlbumsPictures,
        CRSAlbumsVideos,
        CRSAlbumsBoth,
};

typedef void(^CRSAssetsInteractorCompletion)(NSArray *albums, NSError *error);

@interface CRSAssetsInteractor : NSObject

- (void)obtainAlbumsFromGalleryOfType:(CRSAlbumsType)albumType
                              inQueue:(NSOperationQueue *)queue
                       withCompletion:(CRSAssetsInteractorCompletion)completion;

@end
