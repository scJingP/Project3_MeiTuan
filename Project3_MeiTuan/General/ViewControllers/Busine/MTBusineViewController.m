//
//  MTBusineViewController.m
//  Project3_MeiTuan
//
//  Created by guoqiang on 16/4/8.
//  Copyright © 2016年 tens03. All rights reserved.
//

#import "MTBusineViewController.h"
#import "MTBusineCell.h"

static NSString *Busine = @"busine";
@interface MTBusineViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableview;

@end

@implementation MTBusineViewController

-(void)viewDidLoad{
    [super viewDidLoad];
    self.tableview.delegate = self;
    self.tableview.dataSource = self;
    [self.tableview registerClass:[MTBusineCell class] forCellReuseIdentifier:Busine];
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MTBusineCell *cell = [tableView dequeueReusableCellWithIdentifier:Busine forIndexPath:indexPath];
    cell.imageview.backgroundColor = [UIColor blackColor];
    cell.namelabel.text = [@(indexPath.row)stringValue];
    cell.catenamelabel.text = [@(indexPath.row)stringValue];
    cell.areanamelabel.text = [@(indexPath.row)stringValue];
    cell.marknumber.text = [@(indexPath.row)stringValue];
    cell.distancelabel.text= [@(indexPath.row)stringValue];
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *view = [[UIView alloc] init];
    view.backgroundColor = [UIColor orangeColor];
    return view;
}



@end
