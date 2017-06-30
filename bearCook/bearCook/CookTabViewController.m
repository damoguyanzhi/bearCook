//
//  CookTabViewController.m
//  bearCook
//
//  Created by 大熊 on 2017/5/22.
//  Copyright © 2017年 大熊. All rights reserved.
//

#import "CookTabViewController.h"
#import "CookMenuController.h"
#import "MyMenuController.h"
#import "OtherController.h"

@interface CookTabViewController()
@end

@implementation  CookTabViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initTabbarItem];
    
    CGFloat FirstValue=10132.33;
    CGFloat addValue=2880;
    CGFloat months=12;
    CGFloat  totalMonths=15;
    CGFloat   totalValue=(FirstValue*months+addValue*(66))/months*totalMonths;
    PrintLog(@"总金额=%f",totalValue);
}

- (void)initTabbarItem{
    CookMenuController *menu=[[CookMenuController alloc]init];
    [self controller:menu title:@"所有菜单"  image:@"icon_tabbar_homepage" selectedImage:@"icon_tabbar_homepage_selected"];
   
    OtherController *otherController=[[OtherController alloc]init];
    [self controller:otherController title:@"其他" image:@"icon_tabbar_homepage" selectedImage:@"icon_tabbar_homepage_selected"];
    
    [[UITabBarItem appearance] setTitleTextAttributes:[
                                                       NSDictionary dictionaryWithObjectsAndKeys:[UIColor blackColor],NSForegroundColorAttributeName,
                                                       nil]
                                             forState:UIControlStateSelected];
}

-(void)controller:(UIViewController *)controller
            title:(NSString *)title
            image:(NSString *)image
            selectedImage:(NSString *)selectedImage{
    controller.tabBarItem.title=title;
    controller.tabBarItem.image=[UIImage imageNamed:image];
    controller.tabBarItem.selectedImage=[[UIImage imageNamed:selectedImage]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UINavigationController *nav=[[UINavigationController alloc]initWithRootViewController:controller];
    [self addChildViewController:nav];
}

@end
