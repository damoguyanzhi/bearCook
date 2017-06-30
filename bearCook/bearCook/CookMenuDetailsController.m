//
//  UIViewController+CookMenuDetailsController.m
//  bearCook
//
//  Created by 大熊 on 2017/6/23.
//  Copyright © 2017年 大熊. All rights reserved.
//

#import "CookMenuDetailsController.h"
#import "MASConstraintMaker.h"
#import "Masonry.h"

@implementation CookMenuDetailsController

-(void)viewDidLoad{
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    self.imgView.translatesAutoresizingMaskIntoConstraints = NO;
    [self initView];
}

-(void)initView{
    [self initScrollerView];
    [self initMenuImageView];
    [self initMenuLel];
    [self initBtn];
}

-(void)initScrollerView{
    [self.view addSubview:self.scrollerVIew];
}

-(void)initMenuImageView{
    NSData *data=[NSData dataWithContentsOfURL:[NSURL URLWithString:TEST_IMAGE_DATA]];
    UIImage *img=[[UIImage alloc]initWithData:data];
    self.imgView.image=img;
    [self.view addSubview:self.imgView];
    
    [self.imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.scrollerVIew);
        make.top.equalTo(self.scrollerVIew).with.offset(UISCREEN_TITLE_HEIGHT+20);
        make.size.mas_equalTo(CGSizeMake(300,300));
    }];
}

-(void)initMenuLel{
    self.menuLabel.text=@"玉米西瓜粥";
    CGFloat menuH=300;
    PrintLog(@"menuLel:%f",menuH);
    [self.scrollerVIew addSubview:self.menuLabel];
    [self.menuLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.scrollerVIew);
        make.top.equalTo(self.imgView).with.offset(menuH+20);
        make.size.mas_equalTo(CGSizeMake(300,20));
    }];
}

-(void)initBtn{
    [self.scrollerVIew addSubview:self.btn];
    CGFloat menuH=40;
    PrintLog(@"menuLel:%f",menuH);
    [self.btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.scrollerVIew);
        make.top.equalTo(self.menuLabel).with.offset(menuH);
        make.size.mas_equalTo(CGSizeMake(60,30));
    }];
}

-(UIImageView *)imgView{
    if(!_imgView){
        _imgView=[[UIImageView alloc]init];
    }
    return _imgView;
}

-(UIScrollView *)scrollerVIew{
    if(!_scrollerVIew)
    {
        _scrollerVIew=[[UIScrollView alloc]initWithFrame:CGRectMake(0, 0,SCREEN_WIDTH ,SCREEN_HEIGHT+10)];
    }
    return _scrollerVIew;
}

-(UILabel *)menuLabel{
    if(!_menuLabel){
            _menuLabel=[[UILabel alloc]init];
        _menuLabel.textAlignment=NSTextAlignmentCenter;
    }
    return _menuLabel;
}

-(UIButton *)btn{
    if(!_btn){
        _btn=[UIButton buttonWithType:UIButtonTypeSystem];
        _btn.backgroundColor=[UIColor greenColor];
        CGRect frame=_btn.frame;
        frame=CGRectMake(0, 0, 60, 30);
        _btn.frame=frame;
        
        [_btn setTitle:@"收藏" forState:UIControlStateNormal];
    }
    return _btn;
}

@end
