//
//  NSObject+CommonStruct.m
//  bearCook
//
//  Created by 大熊 on 2017/6/5.
//  Copyright © 2017年 大熊. All rights reserved.
//

#import "ImgData.h"

@implementation ImgData

-(void) setImgUrl:(NSString *)url{
    imgUrl=url;
}
-(NSString *) getImgUrl{
    return imgUrl;
}

-(void) setImgName:(NSString *)name{
    imgName=name;
}

-(NSString *) getImgName{
    return imgName;
}
@end
