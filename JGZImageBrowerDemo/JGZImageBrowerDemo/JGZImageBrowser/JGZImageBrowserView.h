//
//  JGZImageBrowserView.h
//  JGZImageBrowerDemo
//
//  Created by  jgzhu on 2018/4/28.
//  Copyright © 2018年  jgzhu. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol JGZImageBrowserViewDelegate<NSObject>
-(void)imageDidClickCurrentIndex:(NSInteger)CurrentIndex;
@end

@interface JGZImageBrowserView : UICollectionView
@property (nonatomic,weak)NSArray *LocalImageArray;
@property (nonatomic,assign)NSInteger CurrentIndex;
@property (nonatomic ,weak)id<JGZImageBrowserViewDelegate>BrowserViewDelegate;
@end
