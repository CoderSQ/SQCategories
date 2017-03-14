//
//  UIDevice+SQHardware.h
//  SQCategoriesDemo
//
//  Created by apple on 2016/12/5.
//  Copyright © 2016年 zsq. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIDevice (SQHardware)

+ (NSString *)sq_platform;
+ (NSString *)sq_platformString;


+ (NSString *)sq_macAddress;

//Return the current device CPU frequency
+ (NSUInteger)sq_cpuFrequency;
// Return the current device BUS frequency
+ (NSUInteger)sq_busFrequency;
//current device RAM size
+ (NSUInteger)sq_ramSize;
//Return the current device CPU number
+ (NSUInteger)sq_cpuNumber;
//Return the current device total memory

/// 获取iOS系统的版本号
+ (NSString *)sq_systemVersion;

// 判断当前系统版本是否大于某个版本 (暂时只支持判断大版本号 如 iOS 7 . 8 .9 .10等,不支持小版本号
+ (BOOL)sq_isSystemVersionBiggerThanVersion:(NSInteger)comparsionVersion;

/// 判断当前系统是否有摄像头
+ (BOOL)sq_hasCamera;
/// 获取手机内存总量, 返回的是字节数
+ (NSUInteger)sq_totalMemoryBytes;
/// 获取手机可用内存, 返回的是字节数
+ (NSUInteger)sq_freeMemoryBytes;

/// 获取手机硬盘空闲空间, 返回的是字节数
+ (long long)sq_freeDiskSpaceBytes;
/// 获取手机硬盘总空间, 返回的是字节数
+ (long long)sq_totalDiskSpaceBytes;

@end
