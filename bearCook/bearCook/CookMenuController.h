//
//  NSObject+CookMenuController.h
//  bearCook
//
//  Created by 大熊 on 2017/5/22.
//  Copyright © 2017年 大熊. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CookMenuController:UIViewController

@property(strong,nonatomic)  NSMutableArray *goodFoodData;
@property(strong,nonatomic) NSArray *hotClassificationNameData;
@property(strong,nonatomic) UIScrollView *scrollView;

@end
