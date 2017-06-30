//
//  UICollectionViewCell+FoodClassNameCell.m
//  bearCook
//
//  Created by 大熊 on 2017/6/14.
//  Copyright © 2017年 大熊. All rights reserved.
//

#import "FoodClassNameCell.h"

@implementation FoodClassNameCell

static const CGFloat CellW=60;
static const CGFloat  CellH=30;
-(instancetype)initWithFrame:(CGRect)frame{
    CGRect curFrame = CGRectMake(0, 0, CellW, CellH);
    self = [super initWithFrame:curFrame];
    if (!self) {
        return self;
    }
    [self.contentView addSubview: self.nameLabel];
    return self;
}

-(UILabel *)nameLabel{
    if(!_nameLabel){
        _nameLabel =[[UILabel alloc]initWithFrame:CGRectMake(5, 5, 50, 20)];
        _nameLabel.font=[UIFont systemFontOfSize:12] ;
        _nameLabel.textAlignment = NSTextAlignmentCenter;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(Clicktap:)];
        [self addGestureRecognizer:tap];
    }
    return _nameLabel;
}

-(void)setName:(NSString *)name{
    self.nameLabel.text=name;
}

-(void)Clicktap:(UITapGestureRecognizer *)sender{
    NSLog(@"tag:%ld",sender.view.tag);
    [self.foodClassNameDelegate chooseName:_nameLabel.text];
}

@end
