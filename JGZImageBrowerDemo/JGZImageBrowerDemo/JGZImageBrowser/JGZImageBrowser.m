//
//  JGZImageBrowser.m
//  JGZImageBrowerDemo
//
//  Created by  jgzhu on 2018/4/28.
//  Copyright © 2018年  jgzhu. All rights reserved.
//

#import "JGZImageBrowser.h"
#import "JGZImageTool.h"
#import "JGZImageBrowserView.h"
#import "JGZImageBrowserViewLayout.h"
@interface JGZImageBrowser ()<JGZImageBrowserViewDelegate>
@property (nonatomic,strong)JGZImageBrowserView *ImageBrowserView;
@end

@implementation JGZImageBrowser

-(JGZImageBrowserView *)ImageBrowserView{
    if (!_ImageBrowserView) {
        _ImageBrowserView = [[JGZImageBrowserView alloc] initWithFrame:CGRectZero collectionViewLayout:[JGZImageBrowserViewLayout new]];
        _ImageBrowserView.BrowserViewDelegate=self;
    }
    return _ImageBrowserView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor clearColor];

    [self.view addSubview:self.ImageBrowserView];
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [UIApplication sharedApplication].statusBarHidden=YES;
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [UIApplication sharedApplication].statusBarHidden=NO;
}

-(void)setLocalImageArray:(NSArray *)LocalImageArray{
    _LocalImageArray=LocalImageArray;
    
    self.ImageBrowserView.LocalImageArray=LocalImageArray;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)show{
    self.ImageBrowserView.CurrentIndex=self.CurrentIndex;
    JGZImageBrowserModel *model=self.LocalImageArray[self.CurrentIndex];
    UIImageView *sourceimageview=[[UIImageView alloc] initWithImage:model.SourceImageView.image];
    
    CGRect frame=[[model.SourceImageView superview] convertRect:model.SourceImageView.frame toView:JGZ_KEYWINDOW];
    sourceimageview.frame=frame;
    sourceimageview.backgroundColor=[UIColor colorWithRed:0 green:0 blue:0 alpha:1];
    sourceimageview.contentMode=UIViewContentModeScaleAspectFill;
     sourceimageview.clipsToBounds=YES;
    [JGZ_KEYWINDOW addSubview:sourceimageview];
    [UIView animateWithDuration:0.25 animations:^{
        sourceimageview.backgroundColor=[UIColor colorWithRed:0 green:0 blue:0 alpha:1];
        sourceimageview.frame=JGZ_KEYWINDOW.bounds;
         sourceimageview.contentMode=UIViewContentModeScaleAspectFit;
    } completion:^(BOOL finished) {
       
        UIViewController *preVC=[JGZImageTool getTopController];

        [preVC presentViewController:self animated:NO completion:^{
            [sourceimageview removeFromSuperview];
        }];
        
    }];

}

-(void)hiden{
    [self dismissViewControllerAnimated:NO completion:nil];
}

#pragma mark--JGZImageBrowserViewDelegate
-(void)imageDidClickCurrentIndex:(NSInteger)CurrentIndex{
    self.CurrentIndex=CurrentIndex;
    [self hiden];
    JGZImageBrowserModel *model=self.LocalImageArray[self.CurrentIndex];
    UIImageView *sourceimageview=[[UIImageView alloc] initWithImage:model.SourceImageView.image];
    
  
    sourceimageview.frame=[UIScreen mainScreen].bounds;
    sourceimageview.backgroundColor=[UIColor colorWithRed:0 green:0 blue:0 alpha:1];
    sourceimageview.contentMode=UIViewContentModeScaleAspectFit;
    [JGZ_KEYWINDOW addSubview:sourceimageview];
    CGRect frame=[[model.SourceImageView superview] convertRect:model.SourceImageView.frame toView:JGZ_KEYWINDOW];
    [UIView animateWithDuration:0.25 animations:^{
        sourceimageview.frame=frame;
         sourceimageview.contentMode=UIViewContentModeScaleAspectFill;
        sourceimageview.clipsToBounds=YES;
    } completion:^(BOOL finished) {
         [sourceimageview removeFromSuperview];
    }];
    
}

@end
