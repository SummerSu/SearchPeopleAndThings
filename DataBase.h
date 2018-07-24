//
//  DataBase.h
//  SearchPeopleAndThings
//
//  Created by 孙苏 on 2017/11/27.
//  Copyright © 2017年 sunsu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataBase : NSObject
+(instancetype)sharedDataBase;
-(void)addTianGanData;
-(void)checkTianGanData;

-(NSString *)selectResultBytext:(NSString *)string;

@end
