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
#import "LWMessageView.h"
#import "MTSweepViewController.h"
#import "ZBarSDK.h"

#import "LWZBarReaderViewController.h"

@interface MTMoreViewController ()
<UITableViewDataSource, UITableViewDelegate, ZBarReaderDelegate, LWZBarReaderViewControllerDelegate>
- (IBAction)btnMoreOnClick:(UIButton *)sender;
- (IBAction)btnApplicationOnClick:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray *arrCellTitle;
@property (nonatomic, strong) NSArray *arrCellDesc;
@property (nonatomic, strong) NSArray *arrRowNumber;

@property (nonatomic, strong) ZBarReaderViewController *vcReader;

@end

@implementation MTMoreViewController
{
//    NSString *zbarValue;
    LWZBarReaderViewController *vcReader_;
}

#pragma mark - life cycle
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
//    if (zbarValue != nil) {
//        [LWMessageView showMessageAddedTo:self.view withText:zbarValue];
//    }
}

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
        NSString *cacheSize = [self calcCacheSize];
        _arrCellDesc = [NSArray arrayWithObjects:@"",@"",@"中号字体(默认)",cacheSize,@"",@"",@"",@"",@"好赞，当前已是最新版本",@"",@"",@"",@"", nil];
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

- (ZBarReaderViewController *)vcReader
{
    if (_vcReader == nil) {
        _vcReader = [[ZBarReaderViewController alloc] init];
        _vcReader.readerDelegate = self;
        _vcReader.tracksSymbols = YES;
        ZBarImageScanner *scanner = _vcReader.scanner;
        [scanner setSymbology: ZBAR_I25 config: ZBAR_CFG_ENABLE to: 0];
        
        CGRect scanCropFrame = CGRectMake(100, 100, 200, 200);
        UIView *redView = [[UIView alloc] initWithFrame:scanCropFrame];
        redView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.5];
        // 设置覆盖物视图
        _vcReader.cameraOverlayView = redView;
        // 设置可扫描的区域，值为可扫描区域在view上的frame同ZBarRaderView的frame的比例
        _vcReader.scanCrop = [self getScanCropForFrame:scanCropFrame withReaderViewFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
    }
    return _vcReader;
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
//            [cell.lblDesc mas_remakeConstraints:^(MASConstraintMaker *make) {
//                make.centerY.equalTo(cell);
//                make.right.mas_equalTo(-10);
//            }];
        }
        cell.lblDesc.text = self.arrCellDesc[index];
        return cell;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.section == 0 && indexPath.row == 3) {     // 清理缓存
        MTMoreCell_TextModal *cell = [tableView cellForRowAtIndexPath:indexPath];
        [self cleanCache];

        cell.lblDesc.text = [self calcCacheSize];
        [LWMessageView showMessageAddedTo:self.view withText:@"缓存已清除"];
    } else if (indexPath.section == 1 && indexPath.row == 0) {  // 扫一扫
        // 第一种使用ZBarReaderView
//        MTSweepViewController *vcSweep = [[MTSweepViewController alloc] init];
//        vcSweep.getZbarValue = ^void(NSString *value) {
//            zbarValue = value;
//        };
//        [self presentViewController:vcSweep animated:YES completion:nil];
        // 第二种使用ZBarReaderViewController
//        [self presentViewController:self.vcReader animated:YES completion:nil];
        // 第三种使用自定义界面的二维码扫描视图LWZBarReaderViewController
        vcReader_ = [[LWZBarReaderViewController alloc] init];
        vcReader_.delegate = self;
        [self presentViewController:vcReader_ animated:YES completion:nil];
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

- (NSString *)calcCacheSize
{
    float cacheSize = 0;
    
    NSString *path_cache = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSArray *arrSubPath = [fileManager subpathsAtPath:path_cache];
    for (NSString *path in arrSubPath) {
        NSString *path_full = [path_cache stringByAppendingPathComponent:path];
        NSDictionary *dicAttrbute = [fileManager attributesOfItemAtPath:path_full error:nil];
        cacheSize += [dicAttrbute fileSize];
    }
    cacheSize = cacheSize/1024/1024;
    
    NSString *strCacheSize = [NSString stringWithFormat:@"%.1fMB",cacheSize];
    return strCacheSize;
}

- (void)cleanCache
{
    NSString *path_cache = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSArray *arrSubPath = [fileManager subpathsAtPath:path_cache];
    for (NSString *path in arrSubPath) {
        NSString *path_full = [path_cache stringByAppendingPathComponent:path];
        
        [fileManager removeItemAtPath:path_full error:nil];
    }
    
}

/**
 *  获取可扫描区域在view上的frame同ZBarRaderView的frame的比例
 *
 *  @param ScanCropFrame   可扫描区域的frame
 *  @param ReaderViewFrame ZBarRaderView的frame
 *
 *  @return CGRect比例
 */
- (CGRect)getScanCropForFrame:(CGRect)ScanCropFrame withReaderViewFrame:(CGRect)ReaderViewFrame
{
    CGFloat x = ScanCropFrame.origin.x/ReaderViewFrame.size.width;
    CGFloat y = ScanCropFrame.origin.y/ReaderViewFrame.size.height;
    CGFloat width  = ScanCropFrame.size.width/ReaderViewFrame.size.width;
    CGFloat height = ScanCropFrame.size.height/ReaderViewFrame.size.height;
    return CGRectMake(x, y, width, height);
}

#pragma mark - <UIImagePickerControllerDelegate>
- (void)imagePickerController:(UIImagePickerController*)reader didFinishPickingMediaWithInfo:(NSDictionary*)info
{
    [self.vcReader.readerView stop];
    id<NSFastEnumeration> results = [info objectForKey:ZBarReaderControllerResults];
    NSString *res;
    for(ZBarSymbol *symbol in results) {
        NSLog(@"%@",symbol.data);
        res = symbol.data;
    }
    [self.vcReader dismissViewControllerAnimated:YES completion:nil];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [LWMessageView showMessageAddedTo:self.view withText:res];
    });
}

#pragma mark - <LWZBarReaderViewControllerDelegate>
- (void)LWZBarReaderView:(ZBarReaderView *)readerView cancleOnClick:(UIButton *)sender
{
    [vcReader_ dismissViewControllerAnimated:YES completion:nil];
}


@end
