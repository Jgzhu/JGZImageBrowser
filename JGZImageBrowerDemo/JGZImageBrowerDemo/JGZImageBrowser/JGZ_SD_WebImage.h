//
//  JGZ_SD_WebImage.h
//  JGZImageBrowerDemo
//
//  Created by  jgzhu on 2018/5/2.
//  Copyright © 2018年  jgzhu. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^SuccessBlock)(void);
typedef void(^FailureBlock)(void);

@interface JGZ_SD_WebImage : NSObject
+(void)setImageView:(UIImageView *)ImageView url:(NSURL *)url placeholder:(UIImage *)placeholder success:(SuccessBlock)success Failure:(FailureBlock)Failure;
@end
