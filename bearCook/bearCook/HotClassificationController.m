//
//  UICollectionViewController+HotClassificationController.m
//  bearCook
//
//  Created by 大熊 on 2017/6/14.
//  Copyright © 2017年 大熊. All rights reserved.
//

#import "HotClassificationController.h"
#import "FoodClassNameCell.h"
#import "HotClassificationVIew.h"
#import "HotCollectionHeadView.h"
#import "CookMenuListController.h"
#import "FoodClassNameCell.h"
@interface HotClassificationController ()<UICollectionViewDelegateFlowLayout,FoodClassNameProtocal>
@end

static NSString *const cellId=@"cell";
static NSString *const headerId = @"headerId";
static NSString *const footerId = @"footerId";
@implementation HotClassificationController
CGFloat nameAreaTop;

-(void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor redColor];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

#pragma mark设置CollectionView每组所包含的个数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    PrintLog(@"nameArray.count=%lu",(unsigned long)self.nameArray.count);
    return self.nameArray.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView  cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellId=@"cellId";
    FoodClassNameCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellId forIndexPath:indexPath];
    cell.foodClassNameDelegate=self;
    cell.backgroundColor = [UIColor whiteColor];
    NSInteger curRow = indexPath.row;
    NSString *name=self.nameArray[curRow];
    [cell setName:name];
    return cell;
}

#pragma mark定义每个cell的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(60, 30);
}
//pragma mark定义整个CollectionViewCell与整个View的间距
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    PrintLog(@"nameAreaTop=%f",self.nameAreaTop);
    return UIEdgeInsetsMake(5, 10, 5, 10);//（上、左、下、右）
}
//pragma mark定义每个UICollectionView的横向间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 10;
}

//pragma mark定义每个UICollectionView的纵向间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 5;
}

//pragma mark点击CollectionView触发事件
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    //    if(indexPath.section==0)
    //    {
    //        if(indexPath.row==0)
    //        {
    //            [self.navigationController pushViewController:cookMenuListController animated:true];
    //        }
    //    }
}
//pragma mark设置CollectionViewCell是否可以被点击
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}

//头部和脚部的加载
-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    NSString *reuseIdentifier;
    if ([kind isEqualToString: UICollectionElementKindSectionHeader ]){
        reuseIdentifier = headerId;
    }
    HotCollectionHeadView *view =  [collectionView dequeueReusableSupplementaryViewOfKind :kind   withReuseIdentifier:reuseIdentifier   forIndexPath:indexPath];
    
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]){
        [view setName:@"八大菜系"];
    }
    return view;
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    return CGSizeMake(100, 20);
}

-(void)chooseName:(NSString *)name{
    PrintLog(@"name=%@,%@",name,self.parentViewController);
    [self.hotDelegate chooseName:name];
}
@end

