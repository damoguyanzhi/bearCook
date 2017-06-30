//
//  UITableViewCell+MenuShowCell.m
//  bearCook
//
//  Created by 大熊 on 2017/6/23.
//  Copyright © 2017年 大熊. All rights reserved.
//

#import "MenuShowCell.h"
@interface MenuShowCell()
@end

@implementation MenuShowCell
-(instancetype)initWithFrame:(CGRect)frame{
    self =[super initWithFrame:frame];
    if(!self){
        return self;
    }
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(clicktap:)];
    [self.contentView addGestureRecognizer:tap];
    return self;
}

-(void)setImageUrl:(NSString *)url{
    NSData *data=[NSData dataWithContentsOfURL:[NSURL URLWithString:url]];
    UIImage *img=[UIImage imageWithData:data];
    self.imgView.image=img;
    [self.contentView addSubview:self.imgView];
}

-(void)setLable:(NSString *)name{
    self.nameLabel.text=name;
    [self.contentView addSubview:self.nameLabel];
}

-(UIImageView*)imgView{
    if(!_imgView){
        NSInteger imgW=SCREEN_WIDTH*2/5;
        _imgView=[[UIImageView alloc]initWithFrame:CGRectMake(10, 10, imgW, 60)];
    }
    return _imgView;
}

-(UILabel*)nameLabel{
    if(!_nameLabel){
        NSInteger imgW=SCREEN_WIDTH*2/5;
        _nameLabel=[[UILabel alloc]initWithFrame:CGRectMake(imgW+30, 30, 100, 20)];
    }
    return _nameLabel;
}

-(void)clicktap:(UITapGestureRecognizer *)sender{
    //[self.menuShowCellDelegate openMenuDetails:self.nameLabel.text];
}
@end
