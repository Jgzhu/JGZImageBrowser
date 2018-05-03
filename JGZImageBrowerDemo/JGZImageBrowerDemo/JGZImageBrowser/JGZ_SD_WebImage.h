//
//  JGZ_SD_WebImage.h
//  JGZImageBrowerDemo
//
//  Created by  jgzhu on 2018/5/2.
//  Copyright © 2018年  jgzhu. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^ProgressBlock)(NSInteger receivedSize, NSInteger expectedSize);
typedef void(^SuccessBlock)(UIImage *image,BOOL isfinished);
typedef void(^FailureBlock)(UIImage *image,BOOL isfinished);

@interface JGZ_SD_WebImage : NSObject
+(void)setImageView:(UIImageView *)ImageView url:(NSURL *)url placeholder:(UIImage *)placeholder success:(SuccessBlock)success Failure:(FailureBlock)Failure;
+(void)DownImageWithUrl:(NSURL *)url progress:(ProgressBlock)progress success:(SuccessBlock)success failure:(FailureBlock)failure;
@end
