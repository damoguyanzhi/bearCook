//
//  CookMenuListController.m
//  bearCook
//
//  Created by 大熊 on 2017/6/21.
//  Copyright © 2017年 大熊. All rights reserved.
//

#import "CookMenuListController.h"
#import "MenuShowCell.h"
#import "ImgData.h"
#import "CookMenuDetailsController.h"
@interface CookMenuListController()<UITableViewDelegate,UITableViewDataSource,MenuShowCellDelegate>
@end

UITableView *tableView;
NSMutableArray *imgList;
@implementation CookMenuListController
-(void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    
    [self createTableViewData];
     [self initLeftBtn];
    [self initTableView];
}

-(void)setTitleName:(NSString *)name{
    self.navigationItem.title=name;
}

-(void)initLeftBtn{
    self.navigationItem.leftBarButtonItem.title=@"返回";
}

-(void)initTableView{
    static  NSString *cellIdentifier = @"CELL_ID";
    tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) style:UITableViewStylePlain];
    tableView.delegate=self;
    tableView.dataSource=self;
    //该行可以使tableView不显示多余的cell
    tableView.tableFooterView = [[UIView alloc] init];
    [tableView registerClass:[MenuShowCell class] forCellReuseIdentifier:cellIdentifier];
    [self.view addSubview:tableView];
}

-(void)clicktap:(id *)sender{
    PrintLog(@"clickTap%s","");
    //[self.navigationController popViewControllerAnimated:YES];
}

-(void)createTableViewData{
    imgList=[[NSMutableArray alloc]init];
    ImgData *imgData;
    for(NSUInteger i=0; i<5; i++){
        imgData=[[ImgData alloc] init];
        [imgData setImgUrl : @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1496749723314&di=91387f346f51f11249726a72b4eb2d6f&imgtype=0&src=http%3A%2F%2Fimg03.tooopen.com%2Fimages%2F20131111%2Fsy_46708898917.jpg"];
        [imgData setImgName: @"花生"];
        [imgList addObject:imgData];
    }
}

//menuShowCellDelegate
-(void)openMenuDetails:(NSString *)menuName{
    CookMenuDetailsController *cookMenuDetailsController=[[CookMenuDetailsController alloc]init];
    [self.navigationController pushViewController:cookMenuDetailsController animated:true];
}

#pragma mark 返回每组行数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return imgList.count;
}

#pragma mark返回每行的单元格
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //NSIndexPath是一个对象，记录了组和行信息
    static  NSString *cellIdentifier = @"CELL_ID";
    MenuShowCell *cell;
    cell=[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if(!cell){
        cell=[[MenuShowCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }

    cell.menuShowCellDelegate=self;
    NSInteger row = indexPath.row;
    ImgData *data=imgList[row];
    NSString *imgUrl=data.getImgUrl;
    NSString *name=data.getImgName;
    [cell setImageUrl:imgUrl];
    [cell setLable:name];
    PrintLog(@"tableVIew cell:%@",imgUrl);
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    CookMenuDetailsController *cookMenuDetailsController=[[CookMenuDetailsController alloc]init];
    [self.navigationController pushViewController:cookMenuDetailsController animated:true];
}
@end
