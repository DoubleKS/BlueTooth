//
//  DKBlueToothManager.h
//  蓝牙Tool
//
//  Created by doublek on 2017/4/26.
//  Copyright © 2017年 doublek. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreBluetooth/CoreBluetooth.h>
@interface DKBlueToothManager : NSObject

//创建单例类
+(instancetype)shareInstance;


/**
 开始扫描外设
 @param updataPeripheral 扫描外设回调
 */
-(void)beginScanCBPeripheral:(void(^)(NSArray *peripheraArr))updataPeripheral;


/**
 连接设备
 @param peripheral 外设
 @param completionBlock 连接回调
 */
-(void)connectPeripheral:(CBPeripheral *)peripheral Completion:(void(^)(NSError *error))completionBlock;


@end
