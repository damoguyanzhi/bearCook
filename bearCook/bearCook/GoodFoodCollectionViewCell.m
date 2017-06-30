//
//  CollectionViewCell.m
//  SubString
//
//  Created by linyingwei on 2017/6/6.
//  Copyright © 2017年 linyingwei. All rights reserved.
//

#import "GoodFoodCollectionViewCell.h"

@implementation GoodFoodCollectionViewCell
static  const CGFloat CellW = 80;
static  const CGFloat CellH=120;
static const  CGFloat ImageH=100;
- (instancetype)initWithFrame:(CGRect)frame{
    CGRect curFrame = CGRectMake(0, 0, CellW, CellH);
    self = [super initWithFrame:curFrame];
    if (!self) {
        return self;
    }
    [self initUI];
    return self;
}

- (void)initUI{
    [self.contentView addSubview:self.imageView];
    [self.contentView addSubview:self.label];
}

- (UIImageView *)imageView{
    if (!_imageView) {
        _imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, CellW, ImageH)];
    }
    return _imageView;
}

-(UILabel *)label{
    if(!_label){
        _label =[[UILabel alloc]initWithFrame:CGRectMake(0, CellH-20, CellW, 20)];
        _label.font=[UIFont systemFontOfSize:12] ;
        _label.textAlignment = NSTextAlignmentCenter;
    }
    return _label;
}

-(void)setImg:(NSString *)url setName:(NSString *)name{
    
    NSData* imageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:url]];
    UIImage* img = [UIImage imageWithData: imageData];
    self.imageView.image = img;
    self.label.text=name;
}

@end
