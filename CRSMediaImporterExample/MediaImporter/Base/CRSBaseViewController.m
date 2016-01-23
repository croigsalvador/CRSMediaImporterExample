//
//  CRSBaseViewController.m
//  CRSMediaImporterExample
//
//  Created by Carlos Roig on 23/01/16.
//  Copyright © 2016 CRoigSalvador. All rights reserved.
//

#import "CRSBaseViewController.h"

@implementation CRSBaseViewController

- (instancetype)initWithRouter:(CRSRouter *)router
                     viewModel:(CRSViewModel *)viewModel
{
    self = [super init];
    if (self) {
        _router = router;
        _viewModel = viewModel;
    }
    return self;
}

@end
