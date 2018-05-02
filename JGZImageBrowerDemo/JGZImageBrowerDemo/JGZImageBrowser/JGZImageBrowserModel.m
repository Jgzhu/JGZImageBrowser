//
//  JGZImageBrowserModel.m
//  JGZImageBrowerDemo
//
//  Created by  jgzhu on 2018/5/2.
//  Copyright © 2018年  jgzhu. All rights reserved.
//

#import "JGZImageBrowserModel.h"



@interface JGZImageBrowserModel()

@end

@implementation JGZImageBrowserModel
-(void)setImageWithImageName:(NSString *)imageName fileType:(NSString *)type{
    self.image=JGZ_LOADIMAGE_FROMFILE(imageName, type);
}
@end
