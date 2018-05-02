//
//  JGZImageTool.h
//  JGZImageBrowerDemo
//
//  Created by  jgzhu on 2018/4/28.
//  Copyright © 2018年  jgzhu. All rights reserved.
//

#import <UIKit/UIKit.h>

#define JGZ_LOADIMAGE_FROMFILE(ImageName,fileType) [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:ImageName ofType:fileType]]
#define JGZ_KEYWINDOW  [UIApplication sharedApplication].keyWindow
@interface JGZImageTool : NSObject
+ (UIWindow *)getNormalWindow;
+ (UIViewController *)getTopController;
@end
