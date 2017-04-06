//
//  ViewController.m
//  VersionCompare
//
//  Created by youngstar on 17/3/28.
//  Copyright © 2017年 Young.com. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self versionCompareFirst:@"1" andVersionSecond:@"1.1.2"];
    [self versionCompareFirst:@"1.12" andVersionSecond:@"1.1.7"];
    [self versionCompareFirst:@"1.2.0" andVersionSecond:@"1.2"];
    [self versionCompareFirst:@"1.1.7" andVersionSecond:@"1.1.7"];
    
    
    
    // 另一种方法
    NSString *num1 = @"5.4.0";    NSString *num2 = @"5.4";
    
    if ([num1 compare:num2 options:NSNumericSearch] ==NSOrderedDescending)
    {
        NSLog(@"%@ is bigger",num1);
    }
    else
    {
        NSLog(@"%@ is bigger",num2);
    }
}



// 方法调用
- (void)versionCompareFirst:(NSString *)first andVersionSecond:(NSString *)second
{
    NSArray *versions1 = [first componentsSeparatedByString:@"."];
    NSArray *versions2 = [second componentsSeparatedByString:@"."];
    NSMutableArray *ver1Array = [NSMutableArray arrayWithArray:versions1];
    NSMutableArray *ver2Array = [NSMutableArray arrayWithArray:versions2];
    // 确定最大数组
    NSInteger a = (ver1Array.count> ver2Array.count)?ver1Array.count : ver2Array.count;
    // 补成相同位数数组
    if (ver1Array.count < a) {
        for(NSInteger j = ver1Array.count; j < a; j++)
        {
            [ver1Array addObject:@"0"];
        }
    }
    else
    {
        for(NSInteger j = ver2Array.count; j < a; j++)
        {
            [ver2Array addObject:@"0"];
        }
    }
    // 比较版本号
    int result = [self compareArray1:ver1Array andArray2:ver2Array];
    if(result == 1)
    {
        NSLog(@"V1 > V2");
    }
    else if (result == -1)
    {
        NSLog(@"V1 < V2");
    }
    else if (result ==0 )
    {
       NSLog(@"V1 = V2");
    }
}
// 比较版本号
- (int)compareArray1:(NSMutableArray *)array1 andArray2:(NSMutableArray *)array2
{
    for (int i = 0; i< array2.count; i++) {
        NSInteger a = [[array1 objectAtIndex:i] integerValue];
        NSInteger b = [[array2 objectAtIndex:i] integerValue];
        if (a > b) {
            return 1;
        }
        else if (a < b)
        {
            return -1;
        }
    }
    return 0;
}


//int (^ compareVersion)(NSMutableArray *array1, id *array2) = ^(id *array1, id *array2) {
//    for (int i = 0; i< array2.count; i++) {
//        NSInteger a = [[array1 objectAtIndex:i] integerValue];
//        NSInteger b = [[array2 objectAtIndex:i] integerValue];
//        if (a > b) {
//            return 1;
//            
//        }
//        else if (a < b)
//        {
//            return -1;
//        }
//        
//    }
//    
//    return 0;
//};




@end
