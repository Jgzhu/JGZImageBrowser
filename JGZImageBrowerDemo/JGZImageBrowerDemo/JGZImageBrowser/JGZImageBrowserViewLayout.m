//
//  JGZImageBrowserViewLayout.m
//  JGZImageBrowerDemo
//
//  Created by  jgzhu on 2018/4/28.
//  Copyright © 2018年  jgzhu. All rights reserved.
//

#import "JGZImageBrowserViewLayout.h"

@implementation JGZImageBrowserViewLayout
-(void)prepareLayout{
    [super prepareLayout];
    self.scrollDirection=UICollectionViewScrollDirectionHorizontal;
    CGSize size=self.collectionView.bounds.size;
    self.itemSize=CGSizeMake(size.width, size.height);
    self.minimumLineSpacing=0;
    self.minimumInteritemSpacing=0;
}
-(BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds{
    return YES;
}
@end
