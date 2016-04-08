//
//  LWPalacePictureView.h
//  LWNinePalacePicture
//
//  Created by tens03 on 16/3/23.
//  Copyright © 2016年 tens03. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, PalaceViewType) {
    PalaceViewTypeFrameForImageNumber = 0,
    PalaceViewTypeFrameFixed
};

@class LWPalacePictureView;
@protocol LWPalacePictureViewDelegate <NSObject>

@required
/**
 *  当九宫格视图大小需要改变时调用
 *
 *  @param palaceView 九宫格视图
 *  @param size       计算后要改变的size
 */
- (void)palaceView:(LWPalacePictureView *)palaceView changeSelfSize:(CGSize)size;

@optional
/**
 *  删除图片按钮点击事件的处理方法
 *
 *  @param palaceView   九宫格视图
 *  @param deleteButton 删除按钮
 */
- (void)palaceView:(LWPalacePictureView *)palaceView deleteImageForIndex:(int)index;

/**
 *  添加图片按钮点击事件的处理方法
 *
 *  @param palaceView 九宫格视图
 *  @param addButton  添加按钮
 */
- (void)palaceView:(LWPalacePictureView *)palaceView addImageForAddButton:(UIButton *)addButton;

@end

@interface LWPalacePictureView : UIView
<UITableViewDelegate>

/**
 *  模式PalaceViewTypeFrameForImageNumber使用的图片URL数据源
 */
@property(nonatomic,strong)NSArray *arrPictureUrl;

/**
 *  模式PalaceViewTypeFrameFixed使用的图片数据源
 */
@property(nonatomic,strong)NSArray *arrImage;

/**
 *  palaceView视图显示的最大宽度 默认kScreenWidth-12*2
 */
@property(nonatomic,assign)float maxWidth;

/**
 *  palaceView各元素的间距 默认4
 */
@property(nonatomic,assign)float intervalMargin;

/**
 *  显示类型 默认PalaceViewTypeFrameForImageNumber
 */
@property(nonatomic,assign)PalaceViewType type;

/**
 *  委托对象属性
 */
@property(nonatomic,weak)id<LWPalacePictureViewDelegate> delegate;

/**
 *  添加“添加按钮”到palaceView上
 */
- (void)initAddButtonToSelf;

@end
