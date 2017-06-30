//
//  UIScrollView+CommonTitleView.m
//  bearCook
//
//  Created by 大熊 on 2017/6/20.
//  Copyright © 2017年 大熊. All rights reserved.
//

#import "CommonTitleView.h"

@implementation CommonTitleView
static const CGFloat CellW=60;
static const CGFloat  CellH=20;
-(instancetype)initWithFrame:(CGRect)frame{
    CGRect curFrame = CGRectMake(0, 0, CellW, CellH);
    self = [super initWithFrame:curFrame];
    if (!self) {
        return self;
    }
    CGFloat lightWhite=0x000000;
    UIColor *color=[[UIColor alloc]initWithWhite:lightWhite alpha:0];
    self.backgroundColor=color;
    [self addSubview: self.nameLabel];
    return self;
}

-(UILabel *)nameLabel{
    if(!_nameLabel){
        _nameLabel =[[UILabel alloc]initWithFrame:CGRectMake(10, 0, 100, 20)];
        _nameLabel.font=[UIFont systemFontOfSize:12] ;
        _nameLabel.textAlignment = NSTextAlignmentLeft;
    }
    return _nameLabel;
}

-(void)setName:(NSString *)name{
    self.nameLabel.text=name;
}
@end
