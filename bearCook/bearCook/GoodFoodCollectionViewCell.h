//
//  CollectionViewCell.h
//  SubString
//
//  Created by linyingwei on 2017/6/6.
//  Copyright © 2017年 linyingwei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GoodFoodCollectionViewCell : UICollectionViewCell
@property (strong, nonatomic) UIImageView *imageView;
@property(strong,nonatomic) UILabel *label;

-(void)setImg:(NSString *)url setName:(NSString *)name;
@end
