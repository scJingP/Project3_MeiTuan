//
//  MTSweepViewController.m
//  Project3_MeiTuan
//
//  Created by tens03 on 16/4/12.
//  Copyright © 2016年 tens03. All rights reserved.
//

#import "MTSweepViewController.h"
#import "ZBarSDK.h"

@interface MTSweepViewController ()
<ZBarReaderViewDelegate>

// 条形码读取视图
@property (nonatomic, strong) ZBarReaderView *readerView;

@end

@implementation MTSweepViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self readerView];
}

- (ZBarReaderView *)readerView
{
    if (_readerView == nil) {
        _readerView = [[ZBarReaderView alloc] init];
        _readerView.readerDelegate = self;
        //处理模拟器
        if (TARGET_IPHONE_SIMULATOR) {
            ZBarCameraSimulator *cameraSimulator = [[ZBarCameraSimulator alloc] initWithViewController:self];
            cameraSimulator.readerView = _readerView;
        }
        [_readerView start];
        [self.view addSubview:_readerView];
    }
    return _readerView;
}

- (void)readerView:(ZBarReaderView*)readerView didReadSymbols:(ZBarSymbolSet*)symbols fromImage:(UIImage*)image
{
    [readerView stop];
    for (ZBarSymbol *symbol in symbols) {
        NSLog(@"%@",symbol.data);
        self.getZbarValue(symbol.data);
    }
    [self dismissViewControllerAnimated:YES completion:nil];
}




@end
