//
//  JGZ_SD_WebImage.m
//  JGZImageBrowerDemo
//
//  Created by  jgzhu on 2018/5/2.
//  Copyright © 2018年  jgzhu. All rights reserved.
//

#import "JGZ_SD_WebImage.h"
#import "UIImageView+WebCache.h"
@implementation JGZ_SD_WebImage
+(void)setImageView:(UIImageView *)ImageView url:(NSURL *)url placeholder:(UIImage *)placeholder success:(SuccessBlock)success Failure:(FailureBlock)Failure{
    [ImageView sd_setImageWithURL:url placeholderImage:placeholder completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
        
    }];
}
@end
