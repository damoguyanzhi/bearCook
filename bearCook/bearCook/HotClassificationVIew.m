//
//  UICollectionView+HotClassificationVIew.m
//  bearCook
//
//  Created by 大熊 on 2017/6/14.
//  Copyright © 2017年 大熊. All rights reserved.
//

#import "HotClassificationVIew.h"

@implementation HotClassificationVIew
-(instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(nonnull UICollectionViewLayout *)layout{
    self = [super initWithFrame:frame collectionViewLayout:layout];
    if (self) {
        self.alwaysBounceVertical = YES;
        self.backgroundColor=[UIColor whiteColor];
    }
    return self;
}
@end
