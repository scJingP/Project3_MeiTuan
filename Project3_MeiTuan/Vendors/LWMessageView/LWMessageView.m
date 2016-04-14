//
//  LWMessageView.m
//  Project3_MeiTuan
//
//  Created by tens03 on 16/4/12.
//  Copyright © 2016年 tens03. All rights reserved.
//

#import "LWMessageView.h"

#define kFontSizeMessage      14

@interface LWMessageView ()

@property (nonatomic, strong) UILabel *lblMessage;

@end

static CGFloat _targetHeight = 0;

@implementation LWMessageView

- (instancetype)initWithFrame:(CGRect)frame
{
    _targetHeight = frame.origin.y - kScreenHeight;
    self = [super initWithFrame:CGRectMake(frame.origin.x, kScreenHeight, frame.size.width, frame.size.height)];
    if (self) {
        [self setSelf];
        [self initSubview];
    }
    return self;
}



#pragma mark - set get
- (UILabel *)lblMessage
{
    if (_lblMessage == nil) {
        _lblMessage = [[UILabel alloc] init];
        _lblMessage.font = [UIFont systemFontOfSize:kFontSizeMessage];
        _lblMessage.textColor = [UIColor whiteColor];
    }
    return _lblMessage;
}

#pragma mark - private
- (void)setSelf
{
    self.layer.cornerRadius = 5;
    self.layer.masksToBounds = YES;
    self.backgroundColor = [UIColor colorWithWhite:0 alpha:0.7];
//    self.backgroundColor = [UIColor whiteColor];
}

- (void)initSubview
{
    [self addSubview:self.lblMessage];
}

#pragma mark - public
- (void)showAfterDelay:(NSTimeInterval)delay
{
    
}

+ (void)showMessageAddedTo:(UIView *)view withText:(NSString *)text
{
    CGFloat textWidth = kFontSizeMessage * text.length;
    CGRect frame = CGRectMake(view.centerX-textWidth/2.0, kScreenHeight-150, textWidth+20, kFontSizeMessage+20);
    LWMessageView *messageView = [[LWMessageView alloc] initWithFrame:frame];
    messageView.lblMessage.text = text;
    
    CGRect rect = CGRectMake(10, 10, textWidth, kFontSizeMessage);
    messageView.lblMessage.frame = rect;
    
    [view addSubview:messageView];
    [UIView animateWithDuration:0.2 animations:^{
        messageView.transform = CGAffineTransformMakeTranslation(0, _targetHeight);
    } completion:^(BOOL finished) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [UIView animateWithDuration:0.1 animations:^{
                messageView.hidden = YES;
            }];
            [messageView removeFromSuperview];
        });
    }];
}






@end
