//
//  ImageDetailViewController.m
//  ScrollViewImageGalleries
//
//  Created by Elle Ti on 2017-06-12.
//  Copyright © 2017 Elle Ti. All rights reserved.
//

#import "ImageDetailViewController.h"

@interface ImageDetailViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *detailScrollView;
@property (nonatomic) UIImageView *image;
@property (nonatomic) UIPanGestureRecognizer *twoFingerPinch;
@property (nonatomic) CGFloat currentScale;
@property (nonatomic) CGFloat minScale;
@property (nonatomic) CGFloat maxScale;

@end

@implementation ImageDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.image = [[UIImageView alloc] initWithFrame:CGRectZero];
    self.image.translatesAutoresizingMaskIntoConstraints = NO;
    self.image.image = [UIImage imageNamed:@"Lighthouse.jpg"];
    
    [self.detailScrollView addSubview:self.image];
    
    NSLayoutConstraint *leading = [self.image.leadingAnchor constraintEqualToAnchor:self.detailScrollView.leadingAnchor];
    
    NSLayoutConstraint *top = [self.image.topAnchor constraintEqualToAnchor:self.detailScrollView.topAnchor];
    
    NSLayoutConstraint *bottom = [self.image.bottomAnchor constraintEqualToAnchor:self.detailScrollView.bottomAnchor];
    
    NSLayoutConstraint *trailing = [self.image.trailingAnchor constraintEqualToAnchor:self.detailScrollView.trailingAnchor];
    
    [self.image.superview addConstraints:@[leading, top, bottom, trailing]];
    
    UIPinchGestureRecognizer *pinchGesture = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(setTwoFingerPinch:)];
//    pinchGesture.delegate = self;
    [self.detailScrollView addGestureRecognizer:pinchGesture];
    [self.detailScrollView setUserInteractionEnabled:YES];
    
    self.detailScrollView.minimumZoomScale = 1;
    self.detailScrollView.maximumZoomScale = 3;
    
    self.currentScale = 1.0;
    self.minScale = 0.5;
    self.maxScale = 3.0;
}

- (UIView *)zoomInScroll:(UIScrollView *)sender
{
    return self.image;
}

- (void)setTwoFingerPinch:(UIPinchGestureRecognizer *)sender
{
//    CGFloat currentScale = sender.scale;
//    CGFloat minScale = self.detailScrollView.minimumZoomScale;
//    CGFloat maxScale = self.detailScrollView.maximumZoomScale;
    
    if (self.currentScale * sender.scale > self.minScale && self.currentScale < self.maxScale)
    {
        self.currentScale *= sender.scale;
        CGAffineTransform zoom = CGAffineTransformMakeScale(self.currentScale, self.currentScale);
        [[sender view] setTransform:zoom];
    }
    [sender setScale:1.0];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
