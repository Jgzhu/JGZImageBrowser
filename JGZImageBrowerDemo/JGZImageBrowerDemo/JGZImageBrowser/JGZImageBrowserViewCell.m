//
//  JGZImageBrowserViewCell.m
//  JGZImageBrowerDemo
//
//  Created by  jgzhu on 2018/4/28.
//  Copyright © 2018年  jgzhu. All rights reserved.
//

#import "JGZImageBrowserViewCell.h"

@interface JGZImageBrowserViewCell()<UIScrollViewDelegate>
@property (nonatomic,strong)UIScrollView *ImageScrollView;
@property (nonatomic)BOOL isZooming;
@end

@implementation JGZImageBrowserViewCell

-(UIScrollView *)ImageScrollView{
    if (!_ImageScrollView) {
        _ImageScrollView=[[UIScrollView alloc] init];
        _ImageScrollView.frame=[UIScreen mainScreen].bounds;
        _ImageScrollView.backgroundColor=[UIColor clearColor];
        _ImageScrollView.delegate=self;
        _ImageScrollView.pagingEnabled=NO;
        _ImageScrollView.userInteractionEnabled=YES;
         _ImageScrollView.contentSize = CGSizeMake(_ImageScrollView.bounds.size.width, _ImageScrollView.bounds.size.height);
        _ImageScrollView.maximumZoomScale = 2;
        _ImageScrollView.minimumZoomScale = 0.5;
        _ImageScrollView.alwaysBounceHorizontal = YES;
        _ImageScrollView.alwaysBounceVertical = YES;
        _ImageScrollView.decelerationRate = UIScrollViewDecelerationRateFast;
        UITapGestureRecognizer *tap=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imageclicked)];
        [_ImageScrollView addGestureRecognizer:tap];
       // _ImageScrollView.bounces=NO;
         _ImageScrollView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }
    return _ImageScrollView;
}
-(void)imageclicked{
    if ([self.delegate respondsToSelector:@selector(imageDidTap)]) {
        [self.delegate imageDidTap];
    }
}
- (UIImageView *)imageview {
    if (!_imageview) {
        _imageview = [UIImageView new];
        _imageview.frame=[UIScreen mainScreen].bounds;
        _imageview.contentMode = UIViewContentModeScaleAspectFit;
        _imageview.userInteractionEnabled=NO;
    }
    return _imageview;
}

-(instancetype)initWithFrame:(CGRect)frame{
    if (self=[super initWithFrame:frame]) {
        self.userInteractionEnabled=YES;
        self.backgroundColor=[UIColor clearColor];
        [self addSubview:self.ImageScrollView];
        [self.ImageScrollView addSubview:self.imageview];
    }
    return self;
}
-(void)resetUI{
    if (_ImageScrollView !=nil) {
        _ImageScrollView.zoomScale=1;
        _imageview.image=nil;
    }
}
#pragma mark UIScrollViewDelegate

- (void)scrollViewDidZoom:(UIScrollView *)scrollView {
   // CGRect frame = self.imageview.frame;
    
//    frame.origin.y = (self.ImageScrollView.frame.size.height - self.imageview.frame.size.height) > 0 ? (self.ImageScrollView.frame.size.height - self.imageview.frame.size.height) * 0.5 : 0;
//    frame.origin.x = (self.ImageScrollView.frame.size.width - self.imageview.frame.size.width) > 0 ? (self.ImageScrollView.frame.size.width - self.imageview.frame.size.width) * 0.5 : 0;
//    self.imageview.frame = frame;
    
    CGRect imageViewFrame = self.imageview.frame;
    CGFloat width = imageViewFrame.size.width, height = imageViewFrame.size.height;
    CGFloat scrollViewHeight = scrollView.bounds.size.height;
    CGFloat scrollViewWidth = scrollView.bounds.size.width;
    if (height > scrollViewHeight) {
        imageViewFrame.origin.y = 0;
    } else {
        imageViewFrame.origin.y = (scrollViewHeight - height) / 2.0;
    }
    if (width > scrollViewWidth) {
        imageViewFrame.origin.x = 0;
    } else {
        imageViewFrame.origin.x = (scrollViewWidth - width) / 2.0;
    }
   
    self.imageview.frame = imageViewFrame;
    //self.ImageScrollView.contentSize = CGSizeMake(self.imageview.frame.size.width + 30, self.imageview.frame.size.height + 30);
   // self.ImageScrollView.frame=imageViewFrame;
   //NSLog(@"%f",imageViewFrame.size.width);
    
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    return self.imageview;
}
- (void)scrollViewWillBeginZooming:(UIScrollView *)scrollView withView:(UIView *)view {
    _isZooming = YES;
//    [self hideLocalImageView];
}
-(void)scrollViewDidEndZooming:(UIScrollView *)scrollView withView:(UIView *)view atScale:(CGFloat)scale{
    _isZooming=NO;
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
}

@end
