//
//  JGZImageBrowserModel.h
//  JGZImageBrowerDemo
//
//  Created by  jgzhu on 2018/5/2.
//  Copyright © 2018年  jgzhu. All rights reserved.
//

#import "JGZImageTool.h"

typedef NS_ENUM(NSUInteger, LoadState) {
    isLoading,
    isLoadFailed,
    isLoadSuccess,
};

@interface JGZImageBrowserModel : NSObject
@property (nonatomic,strong,nullable)UIImage *image;
-(void)setImageWithImageName:(NSString *)imageName fileType:(NSString *)type;

@property (nonatomic,strong,nullable)NSURL *url;
@property (nonatomic,assign)LoadState loadstate;

//-(void)setUrlWith

@property (nonatomic,strong,nullable)UIImageView *SourceImageView;


@end
