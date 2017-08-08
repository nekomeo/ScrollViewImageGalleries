//
//  ViewController.m
//  ScrollViewImageGalleries
//
//  Created by Elle Ti on 2017-06-12.
//  Copyright © 2017 Elle Ti. All rights reserved.
//

#import "ViewController.h"
#import "ImageDetailViewController.h"

@interface ViewController () <UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;



@property (strong, nonatomic) NSArray <UIImageView *> *imageViews;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.imageViews = @[[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Lighthouse-in-Field"]],
                        [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Lighthouse-night"]],
                        [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Lighthouse"]]];
    
    self.pageControl.numberOfPages = self.imageViews.count;
    
    UITapGestureRecognizer *tappedImage = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tappedImage)];
    [self.scrollView addGestureRecognizer:tappedImage];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    int i = 0;
    for (UIImageView *imageView in self.imageViews)
    {
        imageView.frame = CGRectMake(i * self.scrollView.frame.size.width, 0, self.scrollView.frame.size.width, self.scrollView.frame.size.height);
        
        imageView.contentMode = UIViewContentModeScaleAspectFit;
        
        [self.scrollView addSubview:imageView];
        
        i++;
    }
    
    self.scrollView.contentSize = CGSizeMake(self.scrollView.frame.size.width*self.imageViews.count, self.scrollView.frame.size.height);
    
}

#pragma mark - Scroll View Delegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat pageWidth = self.scrollView.frame.size.width;
    float fractionalPage = self.scrollView.contentOffset.x / pageWidth;
    NSInteger page = lround(fractionalPage);
    self.pageControl.currentPage = page;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"toDetailView"])
    {
        UIImage *image = (UIImage *)sender;
        ImageDetailViewController *detailVC = [segue destinationViewController];
        detailVC.image = image;
    }
}

- (void)tappedImage
{
    UIImageView *imageView = self.imageViews[self.pageControl.currentPage];
    UIImage *image = imageView.image;
    [self performSegueWithIdentifier:@"toDetailView" sender:image];
}

@end
