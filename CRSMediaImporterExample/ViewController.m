//
//  ViewController.m
//  CRSMediaImporterExample
//
//  Created by Carlos Roig on 05/04/15.
//  Copyright (c) 2015 CRoigSalvador. All rights reserved.
//

#import "ViewController.h"
#import "CRSMediaController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)viewDidAppear:(BOOL)animated {
    [CRSMediaController presentMediaControllerInViewController:self mediaType:CRSMediaPictures inDelegate:nil];
}


@end
