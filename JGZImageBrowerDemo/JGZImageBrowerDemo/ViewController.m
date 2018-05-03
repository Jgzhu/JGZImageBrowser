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
@property (nonatomic,strong)NSMutableArray *imageUrlArray;
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
    
    self.imageUrlArray=[NSMutableArray arrayWithCapacity:0];
    [self.imageUrlArray addObject:@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1524118687954&di=d92e4024fe4c2e4379cce3d3771ae105&imgtype=0&src=http%3A%2F%2Fimg3.duitang.com%2Fuploads%2Fitem%2F201605%2F18%2F20160518181939_nCZWu.gif"];
    [self.imageUrlArray addObject:@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1524118772581&di=29b994a8fcaaf72498454e6d207bc29a&imgtype=0&src=http%3A%2F%2Fimglf2.ph.126.net%2F_s_WfySuHWpGNA10-LrKEQ%3D%3D%2F1616792266326335483.gif"];
    [self.imageUrlArray addObject:@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1524118803027&di=beab81af52d767ebf74b03610508eb36&imgtype=0&src=http%3A%2F%2Fe.hiphotos.baidu.com%2Fbaike%2Fpic%2Fitem%2F2e2eb9389b504fc2995aaaa1efdde71190ef6d08.jpg"];
    [self.imageUrlArray addObject:@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1524118823131&di=aa588a997ac0599df4e87ae39ebc7406&imgtype=0&src=http%3A%2F%2Fimg3.duitang.com%2Fuploads%2Fitem%2F201605%2F08%2F20160508154653_AQavc.png"];
    [self.imageUrlArray addObject:@"https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=722693321,3238602439&fm=27&gp=0.jpg"];
    [self.imageUrlArray addObject:@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1524118892596&di=5e8f287b5c62ca0c813a548246faf148&imgtype=0&src=http%3A%2F%2Fwx1.sinaimg.cn%2Fcrop.0.0.1080.606.1000%2F8d7ad99bly1fcte4d1a8kj20u00u0gnb.jpg"];
    [self.imageUrlArray addObject:@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1524118914981&di=7fa3504d8767ab709c4fb519ad67cf09&imgtype=0&src=http%3A%2F%2Fimg5.duitang.com%2Fuploads%2Fitem%2F201410%2F05%2F20141005221124_awAhx.jpeg"];
    [self.imageUrlArray addObject:@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1524118934390&di=fbb86678336593d38c78878bc33d90c3&imgtype=0&src=http%3A%2F%2Fi2.hdslb.com%2Fbfs%2Farchive%2Fe90aa49ddb2fa345fa588cf098baf7b3d0e27553.jpg"];
    [self.imageUrlArray addObject:@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1524118984884&di=7c73ddf9d321ef94a19567337628580b&imgtype=0&src=http%3A%2F%2Fimg5q.duitang.com%2Fuploads%2Fitem%2F201506%2F07%2F20150607185100_XQvYT.jpeg"];
    
    
}
- (IBAction)imageclick:(id)sender {
    NSMutableArray *imagearray=[NSMutableArray arrayWithCapacity:0];
    for (int i=0; i<9; i++) {
        JGZImageBrowserModel *model=[[JGZImageBrowserModel alloc] init];
        [model setImageWithImageName:[NSString stringWithFormat:@"localImage%d",i] fileType:@"jpeg"];
        model.SourceImageView=self.imageviewArray[i];
        model.url=[NSURL URLWithString:[NSString stringWithFormat:@"%@",self.imageUrlArray[i]]];
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
