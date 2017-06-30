//
//  UICollectionViewCell+FoodClassNameCell.h
//  bearCook
//
//  Created by 大熊 on 2017/6/14.
//  Copyright © 2017年 大熊. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol FoodClassNameProtocal <NSObject>
@optional
-(void)chooseName:(NSString *)name;
@end

//热门分类类名
@interface FoodClassNameCell:UICollectionViewCell
@property(strong,nonatomic) UILabel *nameLabel;
-(void)setName:(NSString *)name;
@property(strong,nonatomic) id<FoodClassNameProtocal> foodClassNameDelegate;
@end
