//
//  UIScrollView+CommonTitleView.h
//  bearCook
//
//  Created by 大熊 on 2017/6/20.
//  Copyright © 2017年 大熊. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CommonTitleView:UICollectionReusableView
@property(strong,nonatomic) UILabel *nameLabel;
-(void)setName:(NSString *)name;
@end
