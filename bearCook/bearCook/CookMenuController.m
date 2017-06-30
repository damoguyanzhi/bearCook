//
//  NSObject+CookMenuController.m
//  bearCook
//
//  Created by 大熊 on 2017/5/22.
//  Copyright © 2017年 大熊. All rights reserved.
//

#import "CookMenuController.h"
#import "GoodFoodView.h"
#import "ImgData.h"
#import "SDCycleScrollView.h"
#import "HotClassificationController.h"
#import "FoodClassNameCell.h"
#import "GoodFoodCollectionViewCell.h"
#import "HotCollectionHeadView.h"
#import "CommonTitleView.h"
#import "CookMenuListController.h"

@interface CookMenuController ()<SDCycleScrollViewDelegate,UIScrollViewDelegate,HotClassificationProtocal>
@end

@implementation  CookMenuController

static  const CGFloat UISCROLL_VIEW_HEIGHT = 200;
static  const CGFloat  HOT_CLASSIFICATION_HEIGHT=100;
static  NSString *headerId=@"headerId";
static  NSString *cellId=@"cellId";
-(void) viewDidLoad{
    [super viewDidLoad];
    self.navigationItem.title= @"菜单大全";
    [self createGoodFoodData];
    [self createHotClassificationData];
    [self initView];
}

-(void) initView{
    [self initScrollView];
    [self initScrollMenu];
    [self initHotClassification];
    [self initGoodFood];
}

//滚动菜单区域
-(void)initScrollMenu{
    NSArray *imagesURLStrings = @[
                                  @"https://ss2.baidu.com/-vo3dSag_xI4khGko9WTAnF6hhy/super/whfpf%3D425%2C260%2C50/sign=a4b3d7085dee3d6d2293d48b252b5910/0e2442a7d933c89524cd5cd4d51373f0830200ea.jpg",
                                  @"https://ss0.baidu.com/-Po3dSag_xI4khGko9WTAnF6hhy/super/whfpf%3D425%2C260%2C50/sign=a41eb338dd33c895a62bcb3bb72e47c2/5fdf8db1cb134954a2192ccb524e9258d1094a1e.jpg",
                                  @"http://c.hiphotos.baidu.com/image/w%3D400/sign=c2318ff84334970a4773112fa5c8d1c0/b7fd5266d0160924c1fae5ccd60735fae7cd340d.jpg"
                                  ];
    
    // 情景三：图片配文字
    NSArray *titles = @[@"新建交流QQ群：185534916 ",
                        @"感谢您的支持，如果下载的",
                        @"如果代码在使用过程中出现问题",
                        @"您可以发邮件到gsdios@126.com"
                        ];
    UIScrollView *demoContainerView = [[UIScrollView alloc] initWithFrame:self.view.frame];
    demoContainerView.contentSize = CGSizeMake(SCREEN_WIDTH, UISCROLL_VIEW_HEIGHT);
    [_scrollView addSubview:demoContainerView];
    SDCycleScrollView *cycleScrollView2 = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 180) delegate:self placeholderImage:[UIImage imageNamed:@"placeholder"]];
    
    cycleScrollView2.pageControlAliment = SDCycleScrollViewPageContolAlimentRight;
    cycleScrollView2.titlesGroup = titles;
    cycleScrollView2.currentPageDotColor = [UIColor whiteColor]; // 自定义分页控件小圆标颜色
    [demoContainerView addSubview:cycleScrollView2];
    
    //         --- 模拟加载延迟
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        cycleScrollView2.imageURLStringsGroup = imagesURLStrings;
    });
}

//滚动区域
-(void)initScrollView{
    _scrollView=[[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    _scrollView.backgroundColor=[UIColor whiteColor];
    // 是否支持滑动最顶端
    // _scrollView.scrollsToTop = NO;
    //_scrollView.delegate = self;
    // 设置内容大小
    _scrollView.contentSize = CGSizeMake(SCREEN_WIDTH, SCREEN_HEIGHT+10);
    // 是否反弹
    //    scrollView.bounces = NO;
    // 是否分页
    
    [_scrollView flashScrollIndicators];
    // 是否同时运动,lock
    _scrollView.directionalLockEnabled = YES;
    [self.view addSubview:_scrollView];
}

//热门分类
-(void)initHotClassification{
    HotClassificationController *hotClassificationController=[[HotClassificationController alloc]init];
    CGFloat collectionViewY=UISCREEN_TITLE_HEIGHT+UISCROLL_VIEW_HEIGHT+20;
    hotClassificationController.nameArray=self.hotClassificationNameData;
    hotClassificationController.hotDelegate=self;
    
    hotClassificationController.nameAreaTop=collectionViewY;
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    
    hotClassificationController.collectionView =[[UICollectionView alloc]initWithFrame:CGRectMake(0, 300, SCREEN_WIDTH, HOT_CLASSIFICATION_HEIGHT) collectionViewLayout:layout];
    
    UICollectionView *collectionView = hotClassificationController.collectionView;
    CGRect frame=collectionView.frame;
    frame.size.height=HOT_CLASSIFICATION_HEIGHT;
    frame.origin.y=190;
    collectionView.frame=frame;
    
    CGFloat lightWhite=0x000000;
    UIColor *color=[[UIColor alloc]initWithWhite:lightWhite alpha:0.1];
    collectionView.backgroundColor=color;
    hotClassificationController.view.backgroundColor=[UIColor redColor];
    PrintLog(@"hot view%f",hotClassificationController.view.frame.size.height);

    [collectionView registerClass:[FoodClassNameCell class] forCellWithReuseIdentifier:cellId];
    [collectionView registerClass:[HotCollectionHeadView class]
       forSupplementaryViewOfKind:UICollectionElementKindSectionHeader
              withReuseIdentifier:headerId];
    [_scrollView addSubview: collectionView];
}

//好菜推荐
-(void) initGoodFood{
    CGFloat goodY=UISCROLL_VIEW_HEIGHT+HOT_CLASSIFICATION_HEIGHT;
    UICollectionViewFlowLayout *layout=[[UICollectionViewFlowLayout alloc]init];
    PrintLog(@"%f  %f",SCREEN_WIDTH,SCREEN_HEIGHT);
    GoodFoodView *goodFoodView=[[GoodFoodView alloc]initWithFrame:CGRectMake(0, goodY, SCREEN_WIDTH, SCREEN_HEIGHT) collectionViewLayout:layout];
    CGFloat lightWhite=0x000000;
    UIColor *color=[[UIColor alloc]initWithWhite:lightWhite alpha:0.1];
    goodFoodView.backgroundColor=color;
    goodFoodView.imgList=self.goodFoodData;

    [goodFoodView registerClass:[GoodFoodCollectionViewCell class] forCellWithReuseIdentifier:cellId];
    [goodFoodView registerClass:[CommonTitleView class]
     forSupplementaryViewOfKind:UICollectionElementKindSectionHeader
            withReuseIdentifier:headerId];
    [_scrollView addSubview:goodFoodView];
    [goodFoodView reloadData];
}

-(void) createGoodFoodData{
    self.goodFoodData = [NSMutableArray arrayWithCapacity:10];
    ImgData *imgData;
    for(NSUInteger i=0; i<5; i++){
        imgData=[[ImgData alloc] init];
        [imgData setImgUrl : @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1496749723314&di=91387f346f51f11249726a72b4eb2d6f&imgtype=0&src=http%3A%2F%2Fimg03.tooopen.com%2Fimages%2F20131111%2Fsy_46708898917.jpg"];
        [imgData setImgName: @"花生"];
        [self.goodFoodData addObject:imgData];
        PrintLog(@"the object  is:%@", imgData.getImgUrl);
    }
}

-(void)createHotClassificationData{
    self.hotClassificationNameData=[[NSArray alloc]initWithObjects:@"川菜",@"鲁菜",@"粤菜",@"湘菜",@"徽菜",@"苏菜",@"浙菜",@"闽菜", nil];
}

#pragma mark - SDCycleScrollViewDelegate
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index
{
    NSLog(@"---点击了第%ld张图片", (long)index);
    [self.navigationController pushViewController:[NSClassFromString(@"DemoVCWithXib") new] animated:YES];
}

-(UIScrollView *)scrollView
{
    _scrollView=[[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, 100, 200)];
    return _scrollView;
}

// 是否支持滑动至顶部
- (BOOL)scrollViewShouldScrollToTop:(UIScrollView *)scrollView
{
    return YES;
}

// 滑动到顶部时调用该方法
- (void)scrollViewDidScrollToTop:(UIScrollView *)scrollView
{
    NSLog(@"scrollViewDidScrollToTop");
}

// scrollView 已经滑动
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSLog(@"scrollViewDidScroll");
}

// scrollView 开始拖动
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    NSLog(@"scrollViewWillBeginDragging");
}

// scrollView 结束拖动
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    NSLog(@"scrollViewDidEndDragging");
}

// scrollView 开始减速（以下两个方法注意与以上两个方法加以区别）
- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView
{
    NSLog(@"scrollViewWillBeginDecelerating");
}

// scrollview 减速停止
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSLog(@"scrollViewDidEndDecelerating");
}

-(void)chooseName:(NSString *)name{
    PrintLog(@"parentViewController=%@",self.parentViewController.parentViewController);
    CookMenuListController *cookController=[[CookMenuListController alloc]init];
    cookController.hidesBottomBarWhenPushed=true;
    [self.navigationController pushViewController:cookController animated:true];
    [cookController setTitleName:@"菜谱"];
}
@end
