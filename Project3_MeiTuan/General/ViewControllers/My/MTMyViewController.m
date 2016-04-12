//
//  MTMyViewController.m
//  Project3_MeiTuan
//
//  Created by guoqiang on 16/4/8.
//  Copyright © 2016年 tens03. All rights reserved.
//

#import "MTMyViewController.h"
#import "MTMyTableViewCell.h"
#import <Masonry.h>
#import "LWIconButton.h"

@interface MTMyViewController ()
<UITableViewDataSource, UITableViewDelegate, UIScrollViewDelegate>

- (IBAction)settingButtonOnClick:(UIButton *)sender;
- (IBAction)messageButtonOnClick:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UIImageView *ivIcon;
@property (weak, nonatomic) IBOutlet UILabel *lblUserName;
@property (weak, nonatomic) IBOutlet UIButton *btnUserDetail;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIImageView *ivBackground;
@property (weak, nonatomic) IBOutlet UIView *headView;

@property (nonatomic, strong) UIView *orderDetailView;

@property (nonatomic, strong) NSMutableArray *arrCellName;
@property (nonatomic, strong) NSMutableArray *arrCellDetailName;
@property (nonatomic, strong) NSMutableArray *arrIcon;
@property (nonatomic, strong) NSArray *arrRowNumber;

@end

@implementation MTMyViewController

#pragma mark - cil
- (void)viewDidLoad {
    [super viewDidLoad];
}

#pragma mark - Action
- (IBAction)settingButtonOnClick:(UIButton *)sender {
}

- (IBAction)messageButtonOnClick:(UIButton *)sender {
}

#pragma mark - get set
- (NSMutableArray *)arrCellName
{
    if (_arrCellName == nil) {
        _arrCellName = [NSMutableArray arrayWithObjects:@"我的订单",@"我的钱包",@"抵用券",@"会员卡",
                        @"积分商城",@"免费福利",@"今日推荐",@"联系客服",@"我要合作",nil];
    }
    return _arrCellName;
}

- (NSMutableArray *)arrCellDetailName
{
    if (_arrCellDetailName == nil) {
        _arrCellDetailName = [NSMutableArray arrayWithObjects:@"查看全部订单",@"余额:¥0.00",@"0",@"",@"9积分限时秒杀",@"80万霸王餐免费抢",@"",@"",@"轻松开店，招财进宝", nil];
    }
    return _arrCellDetailName;
}

- (NSMutableArray *)arrIcon
{
    if (_arrIcon == nil) {
        _arrIcon = [NSMutableArray arrayWithObjects:@"order_all_order",@"ic_global_user_wallet",@"ic_global_user_voucher",@"ic_global_user_membercard",@"",@"",@"ic_global_user_recommend",@"ic_global_user_feedback",@"ic_global_user_cooperation", nil];
    }
    return _arrIcon;
}

- (NSArray *)arrRowNumber
{
    if (_arrRowNumber == nil) {
        _arrRowNumber = [NSArray arrayWithObjects:@1,@3,@2,@1,@1,@1, nil];
    }
    return _arrRowNumber;
}

- (UIView *)orderDetailView
{
    if (_orderDetailView == nil) {
        _orderDetailView = [[UIView alloc] init];
        _orderDetailView.backgroundColor = [UIColor whiteColor];
        
        LWIconButton *btnPendingPayment = [[LWIconButton alloc] initWithFrame:CGRectMake(kScreenWidth/4.0*0, 0, kScreenWidth/4.0, 50)];
        btnPendingPayment.ivIcon.image = [UIImage imageNamed:@"icon_ordercenter_payment"];
        btnPendingPayment.lblTitle.text = @"待支付";
        LWIconButton *btnPendingUse = [[LWIconButton alloc] initWithFrame:CGRectMake(kScreenWidth/4.0*1, 0, kScreenWidth/4.0, 50)];
        btnPendingUse.ivIcon.image = [UIImage imageNamed:@"user_admin_modify_password"];
        btnPendingUse.lblTitle.text = @"待使用";
        LWIconButton *btnPendingComment = [[LWIconButton alloc] initWithFrame:CGRectMake(kScreenWidth/4.0*2, 0, kScreenWidth/4.0, 50)];
        btnPendingComment.ivIcon.image = [UIImage imageNamed:@"icon_mine_comment"];
        btnPendingComment.lblTitle.text = @"待评论";
        LWIconButton *btnRefund = [[LWIconButton alloc] initWithFrame:CGRectMake(kScreenWidth/4.0*3, 0, kScreenWidth/4.0, 50)];
        btnRefund.ivIcon.image = [UIImage imageNamed:@"icon_ordercenter_refund"];
        btnRefund.lblTitle.text = @"退款/售后";
        [_orderDetailView addSubview:btnPendingPayment];
        [_orderDetailView addSubview:btnPendingUse];
        [_orderDetailView addSubview:btnPendingComment];
        [_orderDetailView addSubview:btnRefund];
    }
    return _orderDetailView;

}

#pragma mark - <UITableViewDataSource, UITableViewDelegate>
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSInteger count = [self.arrRowNumber[section] integerValue];
    return count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    NSInteger count = self.arrRowNumber.count;
    return count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MTMyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCustomCellMy forIndexPath:indexPath];
    NSInteger index = [self getIndex:indexPath];
    cell.lblName.text = self.arrCellName[index];
    cell.lblDetailName.text = self.arrCellDetailName[index];
    cell.ivIcon.image = [UIImage imageNamed:self.arrIcon[index]];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if (section == 0) {
        return 50;
    }
    if (section == 5) {
        return 10;
    }
    return 0;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    if (section == 0) {
//        return self.orderDetailView;
        UIView *view = [[UIView alloc] init];
        view.backgroundColor = [UIColor redColor];
        return self.orderDetailView;
    }
    return nil;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    float offsetY = scrollView.contentOffset.y;
//    [self.headView mas_updateConstraints:^(MASConstraintMaker *make) {
//        make.height.mas_equalTo(150 - offsetY);
//    }];
//    [self.tableView mas_remakeConstraints:^(MASConstraintMaker *make) {
//        make.left.right.equalTo(self);
//        make.top.equalTo(self.headView.mas_bottom);
//        make.height.mas_equalTo(150+offsetY);
//    }];
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
