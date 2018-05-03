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

+(void)DownImageWithUrl:(NSURL *)url progress:(ProgressBlock)progress success:(SuccessBlock)success failure:(FailureBlock)failure{
    [[SDWebImageManager sharedManager] loadImageWithURL:url options:SDWebImageRetryFailed| SDWebImageLowPriority| SDWebImageHandleCookies progress:^(NSInteger receivedSize, NSInteger expectedSize, NSURL * _Nullable targetURL) {
        if(progress){progress(receivedSize,expectedSize);}
    } completed:^(UIImage * _Nullable image, NSData * _Nullable data, NSError * _Nullable error, SDImageCacheType cacheType, BOOL finished, NSURL * _Nullable imageURL) {
        if(error){
            
            if(failure){failure(image,finished);}
        }else{
            if(success){success(image,finished);}
            
        }
    }];
    
}
@end
