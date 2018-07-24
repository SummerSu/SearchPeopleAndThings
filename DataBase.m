//
//  DataBase.m
//  SearchPeopleAndThings
//
//  Created by 孙苏 on 2017/11/27.
//  Copyright © 2017年 sunsu. All rights reserved.
//

#import "DataBase.h"
#import "DataBase.h"

#import <FMDB.h>

static DataBase *_DBCtl = nil;

@interface DataBase()<NSCopying,NSMutableCopying>{
    FMDatabase  *_db;

}

@end

@implementation DataBase
+(instancetype)sharedDataBase{
    
    if (_DBCtl == nil) {
        
        _DBCtl = [[DataBase alloc] init];
        
        [_DBCtl initDataBase];
        
    }
    
    return _DBCtl;
    
}

+(instancetype)allocWithZone:(struct _NSZone *)zone{
    
    if (_DBCtl == nil) {
        
        _DBCtl = [super allocWithZone:zone];
        
    }
    
    return _DBCtl;
    
}

-(id)copy{
    
    return self;
    
}

-(id)mutableCopy{
    
    return self;
    
}

-(id)copyWithZone:(NSZone *)zone{
    
    return self;
    
}

-(id)mutableCopyWithZone:(NSZone *)zone{
    
    return self;
    
}


-(void)initDataBase{
    // 获得Documents目录路径
    
    NSString *documentsPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    
    // 文件路径  /
    //手机软件路径：var/mobile/Containers/Data/Application/13FE4A85-5112-4A4C-B3E1-9C792470BE9E/Documents/SearchPeople.sqlite
    
    //模拟器路径：var/mobile/Containers/Data/Application/13FE4A85-5112-4A4C-B3E1-9C792470BE9E/Documents/SearchPeople.sqlite
    
//    NSString *filePath = [documentsPath stringByAppendingPathComponent:@"SearchPeople.sqlite"];
//    NSLog(@"filePath==%@",filePath);
    // 实例化FMDataBase对象
    
    NSString * filePath = [[NSBundle mainBundle] pathForResource:@"SearchPeople" ofType:@"sqlite"];
    _db = [FMDatabase databaseWithPath:filePath];
    
    if ([_db open])
    {
        
        NSString * TianGanSql = @"CREATE TABLE IF NOT EXISTS SearchPeople (id integer PRIMARY KEY AUTOINCREMENT, Name TEXT,Direction TEXT,People TEXT ,Location TEXT ,Distance TEXT);";
        BOOL result =   [_db executeUpdate:TianGanSql];
        if (result) {
            NSLog(@"创建表成功");
        }else{
            if (_db.lastErrorCode == 19)
            {
//                NSString * updateSql = @"update TianGan";
//                [_db executeUpdate:TianGanSql];
                
                NSLog(@"数据重复了");
            }
            
        }
 
    }
    
      [_db close];
}
/*
 
 */


/*
 // 初始化数据表
 //    NSString *personSql = @"CREATE TABLE 'person' ('id' INTEGER PRIMARY KEY AUTOINCREMENT  NOT NULL ,'person_id' VARCHAR(255),'person_name' VARCHAR(255),'person_age' VARCHAR(255),'person_number'VARCHAR(255)) ";
 
 @"CREATE TABLE PersonList (Name text, Age integer, Sex integer, Phone text, Address text, Photo blob)"
 
 
 
 */

-(void)addTianGanData
{
    [_db open];
    
    [_db executeUpdate:@"INSERT INTO SearchPeople (Name,Direction,People,Location,Distance)  VALUES  (?,?,?,?,?);",@"甲",@"青",@"酸",@"头、胆",@"阳"];
    [_db executeUpdate:@"INSERT INTO SearchPeople (Name,Direction,People,Location,Distance)  VALUES  (?,?,?,?,?);",@"甲",@"青",@"酸",@"头、胆",@"阳"];
    [_db executeUpdate:@"INSERT INTO SearchPeople (Name,Direction,People,Location,Distance)  VALUES  (?,?,?,?,?);",@"甲",@"青",@"酸",@"头、胆",@"阳"];
    [_db executeUpdate:@"INSERT INTO SearchPeople (Name,Direction,People,Location,Distance)  VALUES  (?,?,?,?,?);",@"甲",@"青",@"酸",@"头、胆",@"阳"];
    
    [_db close];
}

-(void)checkTianGanData
{
    
    [_db open];
    //查询整个表
    FMResultSet *resultSet = [_db executeQuery:@"select * from SearchPeople;"];
    
    //根据条件查询
//    FMResultSet *resultSet = [_db executeQuery:@"select * from t_student where id<?;"@(14)];
    
    //遍历结果集合
    
    while ([resultSet  next])
        
    {
        NSString *name = [resultSet  objectForColumn:@"Name"];
 
        NSString * Direction = [resultSet objectForColumn:@"Direction"];
        NSString * People = [resultSet objectForColumn:@"People"];
        NSString * Location = [resultSet objectForColumn:@"Location"];
        NSString * Distance = [resultSet objectForColumn:@"Distance"];
        NSLog(@"%@ ** 在%@方向，%@带走，在%@地方，距离%@",name,Direction,People,Location,Distance);
    }
    
        [_db close];
}

// 查询语句   http://www.jianshu.com/p/22198f89e422
-(NSString *)selectResultBytext:(NSString *)string
{
    [_db open];
    //查询整个表 SELECT * FROM 表名 WHERE 字段 = 某个值;
//    NSString * checkStr = [NSString stringWithFormat:@"SELECT * FROM SearchPeople WHERE Name = %@",string];
    FMResultSet *resultSet = [_db executeQuery:@"SELECT * FROM SearchPeople"];
    NSString * resultStr=@"";
    while ([resultSet  next])
    {
        NSString *name = [resultSet  objectForColumn:@"Name"];
        if ([name isEqualToString:string]) {
            NSString * Direction = [resultSet objectForColumn:@"Direction"];
            NSString * People = [resultSet objectForColumn:@"People"];
//            NSString * Location = [resultSet objectForColumn:@"Location"];
            NSString * Distance = [resultSet objectForColumn:@"Distance"];
            resultStr = [NSString stringWithFormat:@"在%@方向，\n%@带走，\n距离%@，\n",Direction,People,Distance];
        }
//        else{
//            resultStr = @"请输入正确的日，";
//        }
    }

    [_db close];
    return resultStr;
}





@end
