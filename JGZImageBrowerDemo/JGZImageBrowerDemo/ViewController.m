//
//  ViewController.m
//  JGZImageBrowerDemo
//
//  Created by  jgzhu on 2018/4/28.
//  Copyright © 2018年  jgzhu. All rights reserved.
//

#import "ViewController.h"
#import "JGZImageBrowser.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageview0;
@property (weak, nonatomic) IBOutlet UIImageView *imageview1;
@property (weak, nonatomic) IBOutlet UIImageView *imageview2;
@property (weak, nonatomic) IBOutlet UIImageView *imageview3;
@property (weak, nonatomic) IBOutlet UIImageView *imageview4;
@property (weak, nonatomic) IBOutlet UIImageView *imageview5;
@property (weak, nonatomic) IBOutlet UIImageView *imageview6;
@property (weak, nonatomic) IBOutlet UIImageView *imageview7;
@property (weak, nonatomic) IBOutlet UIImageView *imageview8;

@property (nonatomic,strong)NSMutableArray *imageviewArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.imageviewArray=[NSMutableArray arrayWithCapacity:0];
    [self.imageviewArray addObject:self.imageview0];
    [self.imageviewArray addObject:self.imageview1];
    [self.imageviewArray addObject:self.imageview2];
    [self.imageviewArray addObject:self.imageview3];
    [self.imageviewArray addObject:self.imageview4];
    [self.imageviewArray addObject:self.imageview5];
    [self.imageviewArray addObject:self.imageview6];
    [self.imageviewArray addObject:self.imageview7];
    [self.imageviewArray addObject:self.imageview8];
    
}
- (IBAction)imageclick:(id)sender {
    NSMutableArray *imagearray=[NSMutableArray arrayWithCapacity:0];
    for (int i=0; i<9; i++) {
        JGZImageBrowserModel *model=[[JGZImageBrowserModel alloc] init];
        [model setImageWithImageName:[NSString stringWithFormat:@"localImage%d",i] fileType:@"jpeg"];
        model.SourceImageView=self.imageviewArray[i];
       
        [imagearray addObject:model];
    }
    
    
    JGZImageBrowser *ImageBrowser=[[JGZImageBrowser alloc] init];
    ImageBrowser.LocalImageArray=imagearray;
    ImageBrowser.CurrentIndex=arc4random()%8;
    [ImageBrowser show];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
