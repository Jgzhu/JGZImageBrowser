//
//  JGZImageBrowserModel.h
//  JGZImageBrowerDemo
//
//  Created by  jgzhu on 2018/5/2.
//  Copyright © 2018年  jgzhu. All rights reserved.
//

#import "JGZImageTool.h"

@interface JGZImageBrowserModel : NSObject
@property (nonatomic,strong,nullable)UIImage *image;
-(void)setImageWithImageName:(NSString *)imageName fileType:(NSString *)type;

@property (nonatomic,strong,nullable)UIImageView *SourceImageView;


@end
