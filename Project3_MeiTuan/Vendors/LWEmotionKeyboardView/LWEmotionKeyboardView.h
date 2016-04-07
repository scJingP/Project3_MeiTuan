//
//  LWTotalEmoticonCollectionView.h
//  PJWeibo
//
//  Created by tens03 on 16/4/5.
//  Copyright © 2016年 tens03. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Masonry.h>
#import "LWEmotionsManager.h"
#import "LWEmotionModel.h"

@class LWEmotionKeyboardView;
@protocol LWEmotionKeyboardViewDelegate <NSObject>

- (void)emotionKeyboardView:(LWEmotionKeyboardView *)emotionKeyboardView didSelectEmotion:(LWEmotionModel *)model;
- (void)emotionKeyboardViewWillDelete:(LWEmotionKeyboardView *)emotionKeyboardView;

@end

@interface LWEmotionKeyboardView : UIView

@property (nonatomic, weak) id<LWEmotionKeyboardViewDelegate> delegate;

@end

@interface LWTotalCollectionViewCell : UICollectionViewCell

@property (nonatomic, strong) NSArray<LWEmotionModel *> *singlePageEmotions;

@end

@interface LWPartCollectionViewCell : UICollectionViewCell

@property (nonatomic, strong) UIImageView *imageView;

@end
