//
//  LWZBarReaderViewController.m
//  Project3_MeiTuan
//
//  Created by tens03 on 16/4/13.
//  Copyright © 2016年 tens03.All rights reserved.
//

#import "LWZBarReaderViewController.h"


#define SCANVIEW_EdgeTop 40.0
#define SCANVIEW_EdgeLeft 50.0
#define TINTCOLOR_ALPHA 0.2 //浅色透明度
#define DARKCOLOR_ALPHA 0.5 //深色透明度
#define ScanCropBoardColor  [UIColor greenColor]    //可扫描区域的边框颜色

@interface LWZBarReaderViewController ()
<ZBarReaderViewDelegate>
{
    UIView *_QrCodeline;
    NSTimer *_timer;
    //设置扫描画面
    UIView *_scanView;
    ZBarReaderView *_readerView;
    // 头视图
    UIView *_headView;
    UIButton *_btnCancel;
    UILabel *_lblTitle;
}

@end

@implementation LWZBarReaderViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName: nibNameOrNil bundle: nibBundleOrNil];
    if (self) {
        
    }
    return self ;
}

- (void)viewDidLoad
{
    [super viewDidLoad ];
    /********************初始化头视图************************/
    _headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 64)];
    _headView.backgroundColor = ScanCropBoardColor;
    [self.view addSubview:_headView];
    
    _lblTitle = [[UILabel alloc] init];
    _lblTitle.font = [UIFont systemFontOfSize:14];
    _lblTitle.width = 150;
    _lblTitle.height = 15;
    _lblTitle.centerX = _headView.centerX;
    _lblTitle.centerY = _headView.centerY;
    _lblTitle.text = @"扫描二维码";
    _lblTitle.textAlignment = NSTextAlignmentCenter;
    _lblTitle.textColor = [UIColor whiteColor];
    [_headView addSubview:_lblTitle];
    
    _btnCancel = [UIButton buttonWithType:UIButtonTypeCustom];
    [_btnCancel setTitle:@"<" forState:UIControlStateNormal];
    _btnCancel.backgroundColor = ScanCropBoardColor;
    _btnCancel.tintColor = [UIColor whiteColor];
    _btnCancel.width = 15;
    _btnCancel.height = 15;
    _btnCancel.centerY = _headView.centerY;
    _btnCancel.leftX = 10;
    [_btnCancel addTarget:self action:@selector(btnCancelOnClick:) forControlEvents:UIControlEventTouchUpInside];
    [_headView addSubview:_btnCancel];
    
    //初始化扫描界面
    [self setScanView];
    _readerView = [[ZBarReaderView alloc ] init ];
    _readerView.frame = CGRectMake (0, 64, kScreenWidth, kScreenHeight - 64);
    _readerView.tracksSymbols = NO ;
    _readerView.readerDelegate = self ;
    [_readerView addSubview: _scanView ];
    //关闭闪光灯
    _readerView.torchMode = 0 ;
    [self.view addSubview: _readerView ];
    //扫描区域
    //readerView.scanCrop =
    [_readerView start ];
    [self createTimer ];
}

#pragma mark -- ZBarReaderViewDelegate
-(void)readerView:(ZBarReaderView *)readerView didReadSymbols:(ZBarSymbolSet *)symbols fromImage:(UIImage *)image
{
    const zbar_symbol_t *symbol = zbar_symbol_set_first_symbol (symbols.zbarSymbolSet);
    NSString *symbolStr = [NSString stringWithUTF8String: zbar_symbol_get_data (symbol)];
    
    UIAlertView *alertView=[[UIAlertView alloc ] initWithTitle: @"" message: symbolStr delegate: nil cancelButtonTitle: @"取消" otherButtonTitles: nil ];
    [alertView show ];
    
    //判断是否包含 头'http:'
    NSString *regex = @"http+:[^//s]*" ;
    NSPredicate *predicate = [NSPredicate predicateWithFormat: @"SELF MATCHES %@", regex];
    //判断是否包含 头'ssid:'
    NSString *ssid = @"ssid+:[^//s]*" ;;
    NSPredicate *ssidPre = [NSPredicate predicateWithFormat: @"SELF MATCHES %@", ssid];
    if ([predicate evaluateWithObject: symbolStr]) {
        
    }
    else if ([ssidPre evaluateWithObject: symbolStr]){
        NSArray *arr = [symbolStr componentsSeparatedByString: @";" ];
        NSArray * arrInfoHead = [[arr objectAtIndex: 0] componentsSeparatedByString: @":"];
        NSArray * arrInfoFoot = [[arr objectAtIndex: 1] componentsSeparatedByString: @":"];
        symbolStr = [NSString stringWithFormat: @"ssid: %@ /n password:%@", [arrInfoHead objectAtIndex: 1],[arrInfoFoot objectAtIndex: 1]];
        UIPasteboard *pasteboard=[UIPasteboard generalPasteboard];
        //然后，可以使用如下代码来把一个字符串放置到剪贴板上：
        pasteboard.string = [arrInfoFoot objectAtIndex: 1];
    }
    
}

#pragma mark - private
//二维码的扫描区域
- (void)setScanView
{
    _scanView =[[UIView alloc ] initWithFrame: CGRectMake (0, 0, kScreenWidth, kScreenHeight - 64)];
    _scanView.backgroundColor =[UIColor clearColor ];
    //最上部view
    UIView * upView = [[UIView alloc ] initWithFrame: CGRectMake (0, 0, kScreenWidth, SCANVIEW_EdgeTop)];
    upView.alpha = TINTCOLOR_ALPHA ;
    upView.backgroundColor = [UIColor blackColor ];
    [_scanView addSubview: upView];
    //左侧的view
    UIView *leftView = [[UIView alloc ] initWithFrame: CGRectMake (0, SCANVIEW_EdgeTop, SCANVIEW_EdgeLeft, kScreenWidth - 2 * SCANVIEW_EdgeLeft)];
    leftView.alpha = TINTCOLOR_ALPHA ;
    leftView.backgroundColor = [UIColor blackColor ];
    [_scanView addSubview: leftView];
    
    /******************中间扫描区域****************************/
    UIImageView *scanCropView=[[UIImageView alloc ] initWithFrame: CGRectMake (SCANVIEW_EdgeLeft, SCANVIEW_EdgeTop, kScreenWidth - 2 * SCANVIEW_EdgeLeft, kScreenWidth - 2 * SCANVIEW_EdgeLeft)];
    //scanCropView.image=[UIImage imageNamed:@""];
    scanCropView.layer.borderColor = ScanCropBoardColor.CGColor;
    scanCropView.layer.borderWidth = 2.0 ;
    scanCropView.backgroundColor =[UIColor clearColor ];
    [_scanView addSubview: scanCropView];
    //右侧的view
    UIView *rightView = [[UIView alloc ] initWithFrame: CGRectMake (kScreenWidth - SCANVIEW_EdgeLeft, SCANVIEW_EdgeTop, SCANVIEW_EdgeLeft, kScreenWidth - 2 * SCANVIEW_EdgeLeft)];
    rightView.alpha = TINTCOLOR_ALPHA ;
    rightView.backgroundColor = [UIColor blackColor];
    [_scanView addSubview: rightView];
    //底部view
    UIView *downView = [[UIView alloc ] initWithFrame: CGRectMake (0, kScreenWidth - 2 * SCANVIEW_EdgeLeft + SCANVIEW_EdgeTop, kScreenWidth, kScreenHeight -(kScreenWidth - 2 * SCANVIEW_EdgeLeft + SCANVIEW_EdgeTop)- 64)];
    //downView.alpha = TINTCOLOR_ALPHA;
    downView.backgroundColor = [[UIColor blackColor ] colorWithAlphaComponent: TINTCOLOR_ALPHA ];
    [_scanView addSubview: downView];
    
    //用于说明的label
    UILabel *labIntroudction= [[UILabel alloc ] init ];
    labIntroudction.backgroundColor = [UIColor clearColor ];
    labIntroudction.frame = CGRectMake (0, 5, kScreenWidth, 20);
    labIntroudction.numberOfLines = 1 ;
    labIntroudction.font =[UIFont systemFontOfSize: 15.0 ];
    labIntroudction.textAlignment = NSTextAlignmentCenter ;
    labIntroudction.textColor =[UIColor whiteColor ];
    labIntroudction.text = @"将二维码对准方框，即可自动扫描" ;
    [downView addSubview: labIntroudction];
    UIView *darkView = [[UIView alloc ] initWithFrame: CGRectMake (0, downView.frame.size.height - 100.0, kScreenWidth, 100.0)];
    darkView.backgroundColor = [[UIColor blackColor ]  colorWithAlphaComponent: DARKCOLOR_ALPHA ];
    [downView addSubview: darkView];
    
    //用于开关灯操作的button
    UIButton *openButton=[[UIButton alloc ] initWithFrame: CGRectMake (10, 20, 300.0, 40.0)];
    [openButton setTitle: @"开启闪光灯" forState: UIControlStateNormal ];
    [openButton setTitleColor: [UIColor whiteColor ] forState: UIControlStateNormal ];
    openButton.titleLabel.textAlignment = NSTextAlignmentCenter ;
    openButton.backgroundColor = ScanCropBoardColor;
    openButton.titleLabel.font =[UIFont systemFontOfSize: 22.0 ];
    [openButton addTarget: self action: @selector (openLight) forControlEvents: UIControlEventTouchUpInside ];
    [darkView addSubview: openButton];
 
    //画中间的基准线
    _QrCodeline = [[UIView alloc ] initWithFrame: CGRectMake (SCANVIEW_EdgeLeft, SCANVIEW_EdgeTop, kScreenWidth - 2 * SCANVIEW_EdgeLeft, 2)];
    _QrCodeline.backgroundColor = ScanCropBoardColor;
    [_scanView addSubview: _QrCodeline ];
}

- (void)openLight
{
    if (_readerView.torchMode == 0) {
        _readerView.torchMode = 1;
    } else {
        _readerView.torchMode = 0 ;
    }
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear: animated];
    if (_readerView.torchMode == 1) {
        _readerView.torchMode = 0 ;
    }
    [self stopTimer ];
    [_readerView stop ];
}

//二维码的横线移动
- (void)moveUpAndDownLine
{
    CGFloat Y= _QrCodeline.frame.origin.y ;
    //CGRectMake(SCANVIEW_EdgeLeft, SCANVIEW_EdgeTop, kScreenWidth-2*SCANVIEW_EdgeLeft, 1)]
    if (kScreenWidth- 2 *SCANVIEW_EdgeLeft+SCANVIEW_EdgeTop==Y) {
        [UIView beginAnimations: @"asa" context: nil ];
        [UIView setAnimationDuration: 1 ];
        _QrCodeline.frame=CGRectMake(SCANVIEW_EdgeLeft, SCANVIEW_EdgeTop, kScreenWidth- 2 *SCANVIEW_EdgeLeft, 1);        [UIView commitAnimations];
    } else if (SCANVIEW_EdgeTop==Y){
        [UIView beginAnimations: @"asa" context: nil ];
        [UIView setAnimationDuration: 1 ];
        _QrCodeline.frame=CGRectMake(SCANVIEW_EdgeLeft, kScreenWidth- 2 *SCANVIEW_EdgeLeft+SCANVIEW_EdgeTop, kScreenWidth- 2 *SCANVIEW_EdgeLeft, 1);
        [UIView commitAnimations];
    }
}

- (void)createTimer
{
    //创建一个时间计数
    _timer=[NSTimer scheduledTimerWithTimeInterval: 1.0 target: self selector: @selector (moveUpAndDownLine) userInfo: nil repeats: YES ];
}

- (void)stopTimer
{
    if ([_timer isValid] == YES)
    {
        [_timer invalidate];
        _timer = nil ;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)btnCancelOnClick:(UIButton *)sender
{
    if ([self.delegate respondsToSelector:@selector(LWZBarReaderView:cancleOnClick:)]) {
        [self.delegate LWZBarReaderView:_readerView cancleOnClick:sender];
    }
}

@end

