//
//  CRSBaseViewController.h
//  CRSMediaImporterExample
//
//  Created by Carlos Roig on 23/01/16.
//  Copyright © 2016 CRoigSalvador. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CRSRouter, CRSViewModel;

@interface CRSBaseViewController : UIViewController

@property (strong, nonatomic) CRSRouter *router;
@property (strong, nonatomic) CRSViewModel *viewModel;

- (instancetype)initWithRouter:(CRSRouter *)router
                     viewModel:(CRSViewModel *)viewModel;

@end
