//
//  ImageDetailViewController.m
//  ScrollViewImageGalleries
//
//  Created by Elle Ti on 2017-06-12.
//  Copyright © 2017 Elle Ti. All rights reserved.
//

#import "ImageDetailViewController.h"

@interface ImageDetailViewController () <UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *detailScrollView;

@property (nonatomic) UIImageView *detailImageView;
@property (strong, nonatomic) NSArray <UIImageView *> *imageViews;

@end

@implementation ImageDetailViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIImage *image = self.image;
    self.detailImageView = [[UIImageView alloc] initWithImage:image];
    
    self.detailImageView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.detailScrollView addSubview:self.detailImageView];
    
    [self.detailImageView.topAnchor constraintEqualToAnchor:self.detailScrollView.topAnchor].active = YES;
    [self.detailImageView.bottomAnchor constraintEqualToAnchor:self.detailScrollView.bottomAnchor].active = YES;
    [self.detailImageView.leadingAnchor constraintEqualToAnchor:self.detailScrollView.leadingAnchor].active = YES;
    [self.detailScrollView.trailingAnchor constraintEqualToAnchor:self.detailScrollView.trailingAnchor].active = YES;
    
    self.detailScrollView.minimumZoomScale = 0.5;
    self.detailScrollView.maximumZoomScale = 2.0;
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Scroll View Delegate

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return self.detailImageView;
}


@end
