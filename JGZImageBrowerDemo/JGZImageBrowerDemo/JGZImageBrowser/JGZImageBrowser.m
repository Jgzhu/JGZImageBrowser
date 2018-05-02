//
//  JGZImageBrowser.m
//  JGZImageBrowerDemo
//
//  Created by  jgzhu on 2018/4/28.
//  Copyright © 2018年  jgzhu. All rights reserved.
//

#import "JGZImageBrowser.h"
#import "JGZImageTool.h"
#import "JGZImageBrowserView.h"
#import "JGZImageBrowserViewLayout.h"
@interface JGZImageBrowser ()
@property (nonatomic,strong)JGZImageBrowserView *ImageBrowserView;
@end

@implementation JGZImageBrowser

-(JGZImageBrowserView *)ImageBrowserView{
    if (!_ImageBrowserView) {
        _ImageBrowserView = [[JGZImageBrowserView alloc] initWithFrame:CGRectZero collectionViewLayout:[JGZImageBrowserViewLayout new]];
    }
    return _ImageBrowserView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor yellowColor];

    [self.view addSubview:self.ImageBrowserView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)show{
    UIViewController *preVC=[JGZImageTool getTopController];
    
    [preVC presentViewController:self animated:YES completion:nil];
}

-(void)hiden{
    [self dismissViewControllerAnimated:YES completion:nil];
}



@end
