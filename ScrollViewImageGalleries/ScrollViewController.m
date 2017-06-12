//
//  ScrollViewController.m
//  ScrollViewImageGalleries
//
//  Created by Elle Ti on 2017-06-12.
//  Copyright © 2017 Elle Ti. All rights reserved.
//

#import "ScrollViewController.h"

@interface ScrollViewController ()

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@end

@implementation ScrollViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self pagingScrollView];
    
//    UIImageView * imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Lighthouse-in-Field.jpg"]];
//    imageView.contentMode = UIViewContentModeScaleAspectFit;
//    imageView.backgroundColor = [UIColor yellowColor];
//    
//    [self.scrollView addSubview:imageView];
}

- (void)pagingScrollView
{
    CGFloat xOrigin = 0;
    self.scrollView.pagingEnabled = YES;
    
    NSArray *imagesArray = [NSArray arrayWithObjects:@"Lighthouse-in-Field.jpg", @"Lighthouse-night.jpg", @"Lighthouse.jpg", nil];
        
    for (int i = 0; i < imagesArray.count; i++)
    {
        xOrigin = i * CGRectGetWidth(self.view.frame);
        UIImageView *image = [[UIImageView alloc] initWithFrame:CGRectMake(xOrigin, 0, self.view.frame.size.width, self.view.frame.size.height)];
        
        [image setImage:[UIImage imageNamed:[imagesArray objectAtIndex:i]]];
        [image setContentMode:UIViewContentModeScaleAspectFit];
        
        [self.scrollView addSubview:image];
    }
    
    self.scrollView.contentSize = CGSizeMake(imagesArray.count * CGRectGetWidth(self.view.frame),
                                             CGRectGetHeight(self.view.frame));
}

@end
