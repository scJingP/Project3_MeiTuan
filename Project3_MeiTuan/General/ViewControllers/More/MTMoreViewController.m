//
//  MTMoreViewController.m
//  Project3_MeiTuan
//
//  Created by guoqiang on 16/4/8.
//  Copyright © 2016年 tens03. All rights reserved.
//

#import "MTMoreViewController.h"
#import "MTMoreCell_ButtonModal.h"
#import "MTMoreCell_TextModal.h"
#import <Masonry.h>

@interface MTMoreViewController ()
<UITableViewDataSource, UITableViewDelegate>
- (IBAction)btnMoreOnClick:(UIButton *)sender;
- (IBAction)btnApplicationOnClick:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray *arrCellTitle;
@property (nonatomic, strong) NSArray *arrCellDesc;
@property (nonatomic, strong) NSArray *arrRowNumber;

@end

@implementation MTMoreViewController

#pragma mark - get set
- (NSArray *)arrCellTitle
{
    if (_arrCellTitle == nil) {
        _arrCellTitle = [NSArray arrayWithObjects:@"非wifi下使用省流量模式",@"邀请好友使用美团",@"字号大小",@"清空缓存",@"扫一扫",@"意见反馈",@"问卷调查",@"支付帮助",@"检查更新",@"关于美团",@"加入我们",@"诊断网络",@"版权信息", nil];
    }
    return _arrCellTitle;
}

- (NSArray *)arrCellDesc {
    if (_arrCellDesc == nil) {
        _arrCellDesc = [NSArray arrayWithObjects:@"",@"",@"中号字体(默认)",@"1,829K",@"",@"",@"",@"",@"好赞，当前已是最新版本",@"",@"",@"",@"", nil];
    }
    return _arrCellDesc;
}

- (NSArray *)arrRowNumber
{
    if (_arrRowNumber == nil) {
        _arrRowNumber = [NSArray arrayWithObjects:@4,@9, nil];
    }
    return _arrRowNumber;
}

#pragma mark - Action
- (IBAction)btnMoreOnClick:(UIButton *)sender {
}

- (IBAction)btnApplicationOnClick:(UIButton *)sender {
}

#pragma mark - <UITableViewDataSource, UITableViewDelegate>
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.arrRowNumber[section] integerValue];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.arrRowNumber.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 40;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if (section == 1) {
        return 10;
    } else {
        return 0;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSInteger index = [self getIndex:indexPath];
    if (indexPath.section == 0 && indexPath.row == 0) {
        MTMoreCell_ButtonModal *cell = [tableView dequeueReusableCellWithIdentifier:kCustomCellButtonMore];
        cell.lblTitle.text = self.arrCellTitle[index];
        return cell;
    } else {
        MTMoreCell_TextModal *cell = [tableView dequeueReusableCellWithIdentifier:kCustomCellTextMore];
        cell.lblTitle.text = self.arrCellTitle[index];
        if (![self.arrCellDesc[index] isEqualToString:@""]) {
            cell.accessoryType = UITableViewCellAccessoryNone;
            [cell.lblDesc mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.centerY.equalTo(cell);
                make.right.mas_equalTo(-10);
            }];
        }
        cell.lblDesc.text = self.arrCellDesc[index];
        return cell;
    }
}

#pragma mark - private
- (NSInteger)getIndex:(NSIndexPath *)indexPath
{
    NSInteger section = indexPath.section;
    NSInteger row = indexPath.row;
    NSInteger count = 0;
    for (int i=0; i<section; i++) {
        NSInteger length = [self.arrRowNumber[i] integerValue];
        count += length;
    }
    count += row;
    return count;
}

@end
