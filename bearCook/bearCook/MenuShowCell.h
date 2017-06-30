//
//  UITableViewCell+MenuShowCell.h
//  bearCook
//
//  Created by 大熊 on 2017/6/23.
//  Copyright © 2017年 大熊. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MenuShowCellDelegate <NSObject>

@optional
-(void)openMenuDetails:(NSString *)menuName;
@end

@interface MenuShowCell:UITableViewCell
@property(strong,nonatomic)UIImageView *imgView;
@property(strong,nonatomic) UILabel *nameLabel;
@property(strong,nonatomic) id<MenuShowCellDelegate>menuShowCellDelegate;
-(void)setImageUrl:(NSString *)url;
-(void)setLable:(NSString *)name;
@end
