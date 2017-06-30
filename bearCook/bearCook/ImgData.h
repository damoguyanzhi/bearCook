//
//  NSObject+CommonStruct.h
//  bearCook
//
//  Created by 大熊 on 2017/6/5.
//  Copyright © 2017年 大熊. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ImgData:NSObject{
    NSString *imgUrl;
    NSString *imgName;
}
-(void) setImgUrl:(NSString *) url;
-(void) setImgName:(NSString *) name;
-(NSString *)getImgUrl;
-(NSString *)getImgName;
@end
