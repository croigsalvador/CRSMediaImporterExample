//
//  CRSAssetsImporter.h
//  CRSMediaImporterExample
//
//  Created by Carlos Roig on 23/01/16.
//  Copyright © 2016 CRoigSalvador. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, CRSAlbumsType) {
    CRSAlbumsPictures,
    CRSAlbumsVideos,
    CRSAlbumsBoth,
};

typedef void(^CRSAssetsImporterCompletion)(NSArray *albums, NSError *error);

@protocol CRSAssetsImporter <NSObject>

- (void)obtainAlbumsFromGalleryOfType:(CRSAlbumsType)albumType
                              inQueue:(NSOperationQueue *)queue
                       withCompletion:(CRSAssetsImporterCompletion)completion;

@end
