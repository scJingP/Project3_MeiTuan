//
//  LWPalacePictureView.m
//  LWNinePalacePicture
//
//  Created by tens03 on 16/3/23.
//  Copyright © 2016年 tens03. All rights reserved.
//

#import "LWPalacePictureView.h"
#import "UIImageView+WebCache.h"
#import "UIButton+WebCache.h"

@interface LWPalacePictureView ()

@property(nonatomic,strong)NSMutableArray *arrImageView;
@property(nonatomic,strong)NSMutableArray *arrDeleteButton;
@property(nonatomic,strong)UIButton *addButton;

@end

@implementation LWPalacePictureView

#pragma mark - get set
- (void)setArrPictureUrl:(NSArray *)arrPictureUrl
{
    _arrPictureUrl = arrPictureUrl;
    
    switch (self.type) {
        case PalaceViewTypeFrameForImageNumber: {
            [self updateImageViewFrameAndImage_change];
            break;
        }
        case PalaceViewTypeFrameFixed: {
            [self updateImageViewFrameAndImage_Fixed];
            break;
        }
    }
}

- (float)maxWidth
{
    if (_maxWidth == 0) {
        _maxWidth = kScreenWidth - 12 * 2;
    }
    return _maxWidth;
}

- (float)intervalMargin
{
    if (_intervalMargin == 0) {
        _intervalMargin = 4;
    }
    return _intervalMargin;
}

- (void)setArrImage:(NSArray *)arrImage
{
    _arrImage = arrImage;
    
    switch (self.type) {
        case PalaceViewTypeFrameForImageNumber: {
            [self updateImageViewFrameAndImage_change];
            break;
        }
        case PalaceViewTypeFrameFixed: {
            [self updateImageViewFrameAndImage_Fixed];
            break;
        }
    }
}

- (NSMutableArray *)arrImageView
{
    if (_arrImageView == nil) {
        _arrImageView = [NSMutableArray array];
        for (int i=0; i<9; i++) {
            UIImageView *imageView = [[UIImageView alloc] init];
            imageView.backgroundColor = [UIColor yellowColor];
            imageView.frame = CGRectZero;
            imageView.userInteractionEnabled = YES;
            [self addSubview:imageView];
            [_arrImageView addObject:imageView];
        }
        
        NSLog(@"创建了%ld个UIImageView",_arrImageView.count);
    }
    return _arrImageView;
}

- (NSMutableArray *)arrDeleteButton
{
    if (_arrDeleteButton == nil) {
        _arrDeleteButton = [NSMutableArray array];
        for (int i=0; i<9; i++) {
            UIButton *deleteButton = [UIButton buttonWithType:UIButtonTypeCustom];
            [deleteButton setImage:[UIImage imageNamed:@"compose_card_delete_normal"] forState:UIControlStateNormal];
            deleteButton.tag = i;       // 通过tag值来判断删除哪一个图片
            [deleteButton addTarget:self action:@selector(deleteButtonOnClick:) forControlEvents:UIControlEventTouchUpInside];
            deleteButton.backgroundColor = [UIColor colorWithWhite:0.1 alpha:0.5];
            [_arrDeleteButton addObject:deleteButton];
        }
    }
    return _arrDeleteButton;
}

- (UIButton *)addButton
{
    if (_addButton == nil) {
        _addButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_addButton setBackgroundImage:[UIImage imageNamed:@"compose_pic_add_highlighted"] forState:UIControlStateNormal];
        _addButton.hidden = YES;
        [_addButton addTarget:self action:@selector(addButtonOnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_addButton];
    }
    return _addButton;
}


#pragma mark - Private
- (void)updateImageViewFrameAndImage_change
{
    int pictureCount = (int)_arrPictureUrl.count;
    // 判断是否有图，有图则继续，无图则将当前视图影藏，并返回(解决了当图片数为0时的复用问题)
    if (pictureCount == 0) {
        self.hidden = YES;
        return ;
    } else {
        self.hidden = NO;
    }
    
    CGSize imageViewSize = [self getImageViewSize:pictureCount];
    [self updateFrameWithImageViewSize:imageViewSize withPictureCount:pictureCount];
    
    for (int i=0; i<pictureCount; i++) {
        UIImageView *imageView = self.arrImageView[i];
        CGPoint point;
        
        if (pictureCount == 1) {
            point = CGPointMake(0, 0);
        } else if (pictureCount == 2 || pictureCount == 4) {
            point.x = (imageViewSize.width+self.intervalMargin)*(i%2);
            point.y = (imageViewSize.height+self.intervalMargin)*(i/2);
        } else {
            point.x = (imageViewSize.width+self.intervalMargin)*(i%3);
            point.y = (imageViewSize.height+self.intervalMargin)*(i/3);
        }
        // 更新Frame
        CGRect frame = {point,imageViewSize};
        imageView.frame = frame;
        // 更新Image
        if (self.arrPictureUrl != nil) {
            [imageView sd_setImageWithURL:self.arrPictureUrl[i]];
        }
        
    }
    
    // 将剩下的UIImageView的Frame、Image置空(解决了图片数不为0，图片数变化时的复用问题)
    for (int i=pictureCount; i<9; i++) {
        UIImageView *imageView_ = self.arrImageView[i];
        imageView_.frame = CGRectZero;
        imageView_.image = nil;
    }
}

- (void)updateImageViewFrameAndImage_Fixed
{
    int pictureCount = (int)_arrImage.count;

    CGSize imageViewSize = [self getImageViewSize:pictureCount];
    [self updateFrameWithImageViewSize:imageViewSize withPictureCount:pictureCount];
    
    for (int i=0; i<pictureCount+1; i++) {
        // 计算imageView的坐标
        CGPoint point;
        point.x = (imageViewSize.width+self.intervalMargin)*(i%3);
        point.y = (imageViewSize.height+self.intervalMargin)*(i/3);
        
        if (i < pictureCount) {
            UIImageView *imageView = self.arrImageView[i];
            UIButton *deleteButton = self.arrDeleteButton[i];
            // 更新Frame、Image
            CGRect frame = {point,imageViewSize};
            imageView.frame = frame;
            imageView.image = self.arrImage[i];
            
            // 给每一个imageView添加一个关闭按钮
            CGRect deleteButtonFrame = CGRectMake(imageView.width-20, 0, 20, 20);
            deleteButton.hidden = NO;
            deleteButton.frame = deleteButtonFrame;
            [imageView addSubview:deleteButton];
        }
        if (i == pictureCount) {
            self.addButton.hidden = NO;
            self.addButton.frame = CGRectMake(point.x, point.y, imageViewSize.width, imageViewSize.height);
        }
    }
    
    // 将剩下的UIImageView的Frame、Image置空(解决了图片数不为0，图片数变化时的复用问题)
    // 将剩下的deleteButton的Frame置空，并影藏
    for (int i=pictureCount; i<9; i++) {
        UIImageView *imageView_ = self.arrImageView[i];
        imageView_.frame = CGRectZero;
        imageView_.image = nil;
        
        UIButton *deleteButton_ = self.arrDeleteButton[i];
        deleteButton_.frame = CGRectZero;
        deleteButton_.hidden = YES;
    }
}


// 第一种：由固定好的图片显示样式来确定self的宽高(但用户需要提供最大的屏幕宽度、高度)
// 第二种：由self得宽高、图片的个数来确定图片的布局
- (CGSize)getImageViewSize:(int)pictureCount;
{
    // 定义每个imageView宽度、高度
    float itemWidth = 0;
    float itemHeight = 0;
    if (self.type == PalaceViewTypeFrameForImageNumber) {
        if (pictureCount == 1) {
            itemWidth = 160;
            itemHeight = 200;
        } else if (pictureCount == 2 || pictureCount == 4) {
            itemWidth = 100;
            itemHeight = 100;
        } else {
            itemWidth = (self.maxWidth-2*self.intervalMargin)/3.0;
            itemHeight = itemWidth;
        }
    } else if (self.type == PalaceViewTypeFrameFixed) {
        itemWidth = (self.maxWidth-2*self.intervalMargin)/3.0;
        itemHeight = itemWidth;
    }
    return CGSizeMake(itemWidth, itemHeight);
}

- (void)updateFrameWithImageViewSize:(CGSize)imageViewSize withPictureCount:(int)pictureCount
{
    // 定义父view(即self)的宽度、高度
    float viewWidth = self.maxWidth;
    float viewHeight = 0;
    if (self.type == PalaceViewTypeFrameForImageNumber) {
        if (pictureCount == 1) {
            viewWidth = 160;
            viewHeight = 200;
        } else if (pictureCount == 2 || pictureCount == 4) {
            viewWidth = imageViewSize.width * 2 + self.intervalMargin;
            viewHeight = imageViewSize.height*(pictureCount/2) + self.intervalMargin*(pictureCount/2-1);
        } else {
            viewWidth = self.maxWidth;
            // ceil()：向上取整 floor()：向下取整
            viewHeight = imageViewSize.height*ceil(pictureCount/3.0) + self.intervalMargin*((pictureCount-1)/3);
        }
    } else if (self.type == PalaceViewTypeFrameFixed) {
        pictureCount += 1;
        if(pictureCount < 3) {
            viewWidth = imageViewSize.height*ceil(pictureCount%3) + self.intervalMargin*((pictureCount-1)%3);
        } else {
            viewWidth = self.maxWidth;
        }
        viewHeight = imageViewSize.height*ceil(pictureCount/3.0) + self.intervalMargin*((pictureCount-1)/3);
        // ceil()：向上取整 floor()：向下取整
    }
    // 改变self的size
    CGSize size = CGSizeMake(viewWidth, viewHeight);
    if ([self.delegate respondsToSelector:@selector(palaceView:changeSelfSize:)]) {
        [self.delegate palaceView:self changeSelfSize:size];
    } else {
        NSLog(@"请实现委托方法palaceView:changeSelfSize:  此方法用于更新self的size");
    }

}

#pragma mark - 按钮事件处理
- (void)deleteButtonOnClick:(UIButton *)sender
{
    if ([self.delegate respondsToSelector:@selector(palaceView:deleteImageForIndex:)]) {
        [self.delegate palaceView:self deleteImageForIndex:(int)sender.tag];
    }
}

- (void)addButtonOnClick:(UIButton *)sender
{
    if ([self.delegate respondsToSelector:@selector(palaceView:addImageForAddButton:)]) {
        [self.delegate palaceView:self addImageForAddButton:sender];
    }
}

#pragma mark - Public
- (void)initAddButtonToSelf
{
    if (self.type == PalaceViewTypeFrameFixed) {
        [self updateImageViewFrameAndImage_Fixed];
    }
}


@end
