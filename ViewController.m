//
//  ViewController.m
//  SearchPeopleAndThings
//
//  Created by 孙苏 on 2017/11/24.
//  Copyright © 2017年 sunsu. All rights reserved.
//

/*
 Heavenly Stems
 Earthly Branches
 
 
 十天干属性：
 颜色
 味道
 脏腑
 情绪
 
 五行：
 五脏：肝、心、脾、肺、肾，
 五情：喜、乐、欲、怒、哀，
 五常：仁、礼、信、义、智
 
 
 十二地支属性：
 月份
 时辰
 地支藏干
 
  */


#import "ViewController.h"

#import "DataBase.h"

#import "TimeWebViewController.h"


@interface ViewController ()<UITextFieldDelegate>
{
    NSString * _currentDayStr;
}
@property (weak, nonatomic) IBOutlet UITextField *dayTF;
@property (weak, nonatomic) IBOutlet UITextField *timeTF;
@property (weak, nonatomic) IBOutlet UILabel *resultLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"寻找失物";

    self.dayTF.delegate = self;
    
}

- (IBAction)timeInfoButton:(UIButton *)sender {
    [self.view endEditing:YES];
    TimeWebViewController * vc = [[TimeWebViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)resultButton:(UIButton *)sender {
    
    if ([self.dayTF.text isEqualToString:@""]) {
        _resultLabel.text = @"请输入日";
        return;
    }
    
    NSCharacterSet *charSet = [[NSCharacterSet characterSetWithCharactersInString:@"甲乙丙丁戊己庚辛壬癸"] invertedSet];
    NSString *filteredStr = [[self.dayTF.text componentsSeparatedByCharactersInSet:charSet] componentsJoinedByString:@""];
    NSLog(@"filteredStr==%@",filteredStr);
    if ([filteredStr isEqualToString:@""]||[filteredStr isEqual:[NSNull null]]) {
        _resultLabel.text = @"请输入正确的日";
        return;
    }else{
        if ([self.timeTF.text isEqualToString:@""]) {
            _resultLabel.text = @"请输入时";
            return;
        }else{
             NSString * string2 = [self timeResultByTimeStr:self.timeTF.text];
            if ([string2 isEqualToString:@"请输入正确的时"]) {
                 _resultLabel.text = @"请输入正确的时";
            }else{
                DataBase * db = [DataBase sharedDataBase];
                //判断输入的日有变化
                NSString * string1 =  [db selectResultBytext:filteredStr];
                _resultLabel.text = [NSString stringWithFormat:@"%@%@。",string1,string2];
                NSLog(@"result==%@",_resultLabel.text);
            }
        }
    }
    [self.view endEditing:YES];
}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
        [self.view endEditing:YES];
}

-(NSString *)timeResultByTimeStr:(NSString *)string
{
    NSString * resultStr = @"";
    if ([string isEqualToString:@"子"]||[string isEqualToString:@"午"]||[string isEqualToString:@"卯"]||[string isEqualToString:@"酉"]) {
        resultStr = @"在路边寻找";
    }else if ([string isEqualToString:@"寅"]||[string isEqualToString:@"申"]||[string isEqualToString:@"巳"]||[string isEqualToString:@"亥"]) {
        resultStr = @"已被倒手，难以找回";//归他乡，
    }else if ([string isEqualToString:@"辰"]||[string isEqualToString:@"戌"]||[string isEqualToString:@"丑"]||[string isEqualToString:@"未"]) {
        resultStr = @"不出五十米范围内查找";
    }else{
        resultStr = @"请输入正确的时";
    }
    return resultStr;
}

//-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
//{
//    NSLog(@"STRING=%@",string);
////    NSCharacterSet *charSet = [[NSCharacterSet characterSetWithCharactersInString:@"甲乙丙丁戊己庚辛壬癸"] invertedSet];
////    NSString *filteredStr = [[string componentsSeparatedByCharactersInSet:charSet] componentsJoinedByString:@"哈"];
////    if ([string isEqualToString:filteredStr]) {
////        return YES;
////    }
////    return NO;
//    return YES;
//}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
