//
//  ViewController.m
//  ScrollViewImageGalleries
//
//  Created by Elle Ti on 2017-06-12.
//  Copyright © 2017 Elle Ti. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIScrollViewDelegate>
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@property (nonatomic) UIImageView *firstImage;
@property (nonatomic) UIImageView *secondImage;
@property (nonatomic) UIImageView *thirdImage;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    self.scrollView.backgroundColor = [UIColor blueColor];
    [self pagingScrollView];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)pagingScrollView
{
//    CGFloat xOrigin = 0;
//    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
//    self.scrollView.pagingEnabled = YES;
//    
////    NSArray *imagesArray = [NSArray arrayWithObjects:@"Lighthouse-in-Field.jpg", @"Lighthouse-night.jpg", @"Lighthouse.jpg", nil];
//    
//    UIImageView * imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Lighthouse-in-Field.jpg"]];
//    imageView.contentMode = UIViewContentModeScaleAspectFit;
//    imageView.backgroundColor = [UIColor yellowColor];
//    
//    [self.scrollView addSubview:imageView];
//    
//    for (int i = 0; i < imagesArray.count; i++)
//    {
//        xOrigin = i * self.scrollView.frame.size.width;
//        UIImageView *image = [[UIImageView alloc] initWithFrame:CGRectMake(xOrigin, 0, self.view.frame.size.width, self.view.frame.size.height)];
//        
//        [image setImage:[UIImage imageNamed:[imagesArray objectAtIndex:i]]];
//        [image setContentMode:UIViewContentModeScaleAspectFit];
//        
//        [self.scrollView addSubview:image];
//        
////        xOrigin += CGRectGetWidth(self.view.frame);
//    }
    
//    self.scrollView.contentSize = CGSizeMake(xOrigin, CGRectGetHeight(self.view.frame));
}

@end
