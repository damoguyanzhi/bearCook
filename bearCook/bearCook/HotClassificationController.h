//
//  UICollectionViewController+HotClassificationController.h
//  bearCook
//
//  Created by 大熊 on 2017/6/14.
//  Copyright © 2017年 大熊. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol HotClassificationProtocal <NSObject>
@optional
-(void)chooseName:(NSString *)name;
@end
@interface HotClassificationController:UICollectionViewController
@property(strong,nonatomic)NSArray *nameArray;
@property()CGFloat nameAreaTop;
@property(strong,nonatomic)id<HotClassificationProtocal>  hotDelegate;
@end
