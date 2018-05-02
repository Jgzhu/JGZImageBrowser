//
//  JGZImageBrowserView.m
//  JGZImageBrowerDemo
//
//  Created by  jgzhu on 2018/4/28.
//  Copyright © 2018年  jgzhu. All rights reserved.
//

#import "JGZImageBrowserView.h"
#import "JGZImageBrowserViewCell.h"
#import "JGZImageBrowserModel.h"
static NSString *const JGZImageBrowserViewCellIdentifier=@"JGZImageBrowserViewCellIdentifier";


@interface JGZImageBrowserView()<UICollectionViewDelegate,UICollectionViewDataSource,UIScrollViewDelegate,JGZImageBrowserViewCellDelegate>

@end

@implementation JGZImageBrowserView

-(instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout{
    if (self=[super initWithFrame:frame collectionViewLayout:layout]) {
        self.backgroundColor=[UIColor clearColor];
        self.frame=[UIScreen mainScreen].bounds;
        self.userInteractionEnabled=YES;
        [self registerClass:JGZImageBrowserViewCell.class forCellWithReuseIdentifier:JGZImageBrowserViewCellIdentifier];
        self.pagingEnabled=YES;
        self.showsVerticalScrollIndicator=NO;
        self.showsHorizontalScrollIndicator=NO;
        self.alwaysBounceVertical=NO;
        self.delegate=self;
        self.dataSource=self;
        
        self.contentSize=CGSizeMake([UIScreen mainScreen].bounds.size.width*9, [UIScreen mainScreen].bounds.size.height);
         self.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }
    return self;
}
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 9;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    JGZImageBrowserViewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:JGZImageBrowserViewCellIdentifier forIndexPath:indexPath];
    [cell resetUI];
    JGZImageBrowserModel *model=self.LocalImageArray[indexPath.item];
    cell.imageview.image=model.image;
    cell.delegate=self;
    //cell.backgroundColor=[UIColor colorWithRed:arc4random()%250/255.0 green:arc4random()%250/255.0 blue:arc4random()%250/255.0 alpha:1.0];
    return cell;
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    NSLog(@"1--%f",scrollView.contentOffset.x);
    self.CurrentIndex=scrollView.contentOffset.x/[UIScreen mainScreen].bounds.size.width;
}
-(void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView{
    NSLog(@"2--%f",scrollView.contentOffset.x);
}
-(void)setCurrentIndex:(NSInteger)CurrentIndex{
    _CurrentIndex=CurrentIndex;
    [self scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:CurrentIndex inSection:0] atScrollPosition:UICollectionViewScrollPositionNone animated:NO];
}
#pragma mark--JGZImageBrowserViewCellDelegate
-(void)imageDidTap{
    if ([self.BrowserViewDelegate respondsToSelector:@selector(imageDidClickCurrentIndex:)]) {
        [self.BrowserViewDelegate imageDidClickCurrentIndex:self.CurrentIndex];
    }
}
@end
