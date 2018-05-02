//
//  JGZImageBrowserViewCell.h
//  JGZImageBrowerDemo
//
//  Created by  jgzhu on 2018/4/28.
//  Copyright © 2018年  jgzhu. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol JGZImageBrowserViewCellDelegate<NSObject>
-(void)imageDidTap;
@end


@interface JGZImageBrowserViewCell : UICollectionViewCell
@property (nonatomic,weak)id<JGZImageBrowserViewCellDelegate>delegate;
@property (nonatomic,strong)UIImageView *imageview;
-(void)resetUI;
@end
