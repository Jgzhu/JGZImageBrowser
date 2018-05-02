//
//  JGZImageBrowser.h
//  JGZImageBrowerDemo
//
//  Created by  jgzhu on 2018/4/28.
//  Copyright © 2018年  jgzhu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JGZImageBrowserModel.h"
@interface JGZImageBrowser : UIViewController
@property (nonatomic,strong)NSArray *LocalImageArray;
@property (nonatomic,assign)NSInteger CurrentIndex;
-(void)show;
-(void)hiden;
@end
