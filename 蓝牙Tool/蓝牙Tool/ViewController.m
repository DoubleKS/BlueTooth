//
//  ViewController.m
//  蓝牙Tool
//
//  Created by doublek on 2017/4/26.
//  Copyright © 2017年 doublek. All rights reserved.
//

#import "ViewController.h"
#import "DKBlueToothManager.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property(nonatomic,strong)NSArray <CBPeripheral *>*dataSourceArr;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)scanButtonClick:(UIButton *)sender {
    
    [[DKBlueToothManager shareInstance] beginScanCBPeripheral:^(NSArray *peripheraArr) {
      
        self.dataSourceArr = peripheraArr;
        //刷新UI
        [self.tableView reloadData];
    }];
    
}
#pragma mark - 实现数据源方法
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.dataSourceArr.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    CBPeripheral *peripheral = self.dataSourceArr[indexPath.row];
    cell.textLabel.text = [peripheral.identifier UUIDString];
    cell.detailTextLabel.text = peripheral.name;
    
    return cell;
}
#pragma tableView选中某一行的代理方法
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
       CBPeripheral *peripheral = self.dataSourceArr[indexPath.row];
    [[DKBlueToothManager shareInstance] connectPeripheral:peripheral Completion:^(NSError *error) {
        if (error == nil) {
            NSLog(@"连接成功");
        }else{
            NSLog(@"%@",error);
        }
        
    }];
    
}

@end
