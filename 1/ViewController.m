//
//  ViewController.m
//  1
//
//  Created by apple on 15/7/6.
//  Copyright (c) 2015年 cloud7. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    
}
@property (nonatomic,strong)UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.view.bounds];
    self.imageView = imageView;
    imageView.image = [UIImage imageNamed:@"1.jpg"];
    imageView.userInteractionEnabled = YES;
    
    imageView.frame = [self aspectFitWithFromRect:CGRectMake(0, 0, imageView.image.size.width, imageView.image.size.height) andRect:imageView.frame];
    
    UIPanGestureRecognizer *PanGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panGesture:)];
    
    [imageView addGestureRecognizer:PanGesture];

    [self.view addSubview:imageView];
}

- (void)panGesture:(UIPanGestureRecognizer *)panGesture
{
    CGPoint panPoint = [panGesture translationInView:self.view];
    self.imageView.center = CGPointMake(self.imageView.center.x + panPoint.x, self.imageView.center.y + panPoint.y);
    [panGesture setTranslation:CGPointZero inView:self.view];
}



/**
 *  UIViewContentModeScaleAspectFit
 *
 *  @param fromRect 出发的rect<一般为图片本人的size 和 (0,0)组合>
 *  @param toRect   需要的rect<一般为view的rect>
 *
 *  @return 需要的rect
 */

- (CGRect)aspectFitWithFromRect:(CGRect)fromRect andRect:(CGRect)toRect
{
    float fromAspectRatio = fromRect.size.width / fromRect.size.height;
    float toAspectRatio = toRect.size.width / toRect.size.height;
    
    CGRect fitRect = toRect;
    
    if (fromAspectRatio > toAspectRatio) {
        fitRect.size.height = toRect.size.width / fromAspectRatio;
        fitRect.origin.y += (toRect.size.height - fitRect.size.height) * 0.5;
    } else {
        fitRect.size.width = toRect.size.height  * fromAspectRatio;
        fitRect.origin.x += (toRect.size.width - fitRect.size.width) * 0.5;
    }
    return fitRect;
}

/**
 *  UIViewContentModeScaleAspectFill
 *
 *  @param fromRect 出发的rect<一般为图片本人的size 和 (0,0)组合>
 *  @param toRect   需要的rect<一般为view的rect>
 *
 *  @return 需要的rect
 */
- (CGRect)aspectFillWithFromRect:(CGRect)fromRect andRect:(CGRect)toRect
{
    float fromAspectRatio = fromRect.size.width / fromRect.size.height;
    float toAspectRatio = toRect.size.width / toRect.size.height;
    
    CGRect fitRect = toRect;
    
    if (fromAspectRatio > toAspectRatio) {
        fitRect.size.width = toRect.size.height  * fromAspectRatio;
        fitRect.origin.x += (toRect.size.width - fitRect.size.width) * 0.5;
    } else {
        fitRect.size.height = toRect.size.width / fromAspectRatio;
        fitRect.origin.y += (toRect.size.height - fitRect.size.height) * 0.5;
    }
    return fitRect;
}

@end
