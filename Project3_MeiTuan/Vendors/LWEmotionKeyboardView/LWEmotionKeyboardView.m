//
//  LWTotalEmoticonCollectionView.m
//  PJWeibo
//
//  Created by tens03 on 16/4/5.
//  Copyright © 2016年 tens03. All rights reserved.
//

#import "LWEmotionKeyboardView.h"

#define kNotificationEmotionSelect @"EmotionSelectNotification"
#define kNotificationDelete @"kNotificationDelete"

static NSString *totalCellIdentifier = @"totalCellIdentifier";

@interface LWEmotionKeyboardView ()
<UICollectionViewDataSource, UICollectionViewDelegate>
{
    int selectedEmotionIndex;
}

@property (nonatomic, strong) UICollectionView *emotionsCollectionView;
@property (nonatomic, strong) UIPageControl *pagControl;
@property (nonatomic, strong) UIView *titleButtonGrop;
// 此数组中包含多个表情包，每个表情包组成一个字典，key:表情包名称，value:表情组成的数组
//@property (nonatomic, strong) NSDictionary * dicEmotion;
@property (nonatomic, strong) NSArray<LWEmotionPackageModel *> *arrEmotion;

@property (nonatomic, strong) NSMutableArray *arrTitleButton;

@end

@implementation LWEmotionKeyboardView

#pragma mark - life cycle
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initSubview];
        [self setSubviewAutoLayout];
    }
    return self;
}

#pragma mark - get set
- (UICollectionView *)emotionsCollectionView
{
    if (_emotionsCollectionView == nil) {
        UICollectionViewFlowLayout *flowlayout = [[UICollectionViewFlowLayout alloc] init];
        // 50 ：pagControl的高度 + titleButtonGrop的高度
        CGSize itemSize_ = CGSizeMake(self.width, self.height-50);
        flowlayout.itemSize = itemSize_;
        flowlayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        flowlayout.minimumLineSpacing = 0;          // 元素左右之间的间距
        flowlayout.minimumInteritemSpacing = 0;     // 元素上下之间的间距
        CGRect frame = {{0,0},itemSize_};
        _emotionsCollectionView = [[UICollectionView alloc] initWithFrame:frame collectionViewLayout:flowlayout];
        _emotionsCollectionView.dataSource = self;
        _emotionsCollectionView.delegate = self;
        // 先要设置分页，然后设置缓冲，这样缓冲才会有效果
        _emotionsCollectionView.pagingEnabled = YES;
        _emotionsCollectionView.bounces = YES;
        _emotionsCollectionView.showsHorizontalScrollIndicator = NO;
        [_emotionsCollectionView registerClass:[LWTotalCollectionViewCell class] forCellWithReuseIdentifier:totalCellIdentifier];
    }
    return _emotionsCollectionView;
}

- (UIPageControl *)pagControl
{
    if (_pagControl == nil) {
        _pagControl = [[UIPageControl alloc] init];
        _pagControl.currentPageIndicatorTintColor = [UIColor redColor];
        _pagControl.pageIndicatorTintColor = [UIColor grayColor];
        _pagControl.numberOfPages = 5;
        _pagControl.currentPage = 0;
        _pagControl.backgroundColor = [UIColor colorWithR:242 g:242 b:242 alpha:1];
    }
    return _pagControl;
}

- (UIView *)titleButtonGrop
{
    if (_titleButtonGrop == nil) {
        _titleButtonGrop = [[UIView alloc] init];
        _titleButtonGrop.backgroundColor = [UIColor grayColor];
    }
    return _titleButtonGrop;
}

- (NSMutableArray *)arrTitleButton
{
    if (_arrTitleButton == nil) {
        _arrTitleButton = [NSMutableArray array];
        int i=0;
        for (LWEmotionPackageModel *model in self.arrEmotion) {
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            [button setTitle:model.name forState:UIControlStateNormal];
            button.titleLabel.font = [UIFont systemFontOfSize:12];
            button.tag = i++;
            [button setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
            [button setTitleColor:[UIColor blackColor] forState:UIControlStateSelected];
            [button setBackgroundImage:[UIImage createImageWithColor:[UIColor colorWithR:242 g:242 b:242 alpha:1]] forState:UIControlStateNormal];
            [button setBackgroundImage:[UIImage createImageWithColor:[UIColor colorWithR:200 g:200 b:200 alpha:1]] forState:UIControlStateSelected];
            [button addTarget:self action:@selector(titleButtonOnClick:) forControlEvents:UIControlEventTouchUpInside];
            [_arrTitleButton addObject:button];
        }
    }
    return _arrTitleButton;
}

- (NSArray *)arrEmotion
{
    if (_arrEmotion == nil) {
        _arrEmotion = [NSArray array];
        _arrEmotion = [LWEmotionsManager arrayForAllEmotionPackageModel];
    }
    return _arrEmotion;
}

#pragma mark - private
- (void)initSubview
{
    [self addSubview:self.emotionsCollectionView];
    [self addSubview:self.pagControl];
    [self addSubview:self.titleButtonGrop];
    
    UIButton *button = self.arrTitleButton[0];
    button.selected = YES;
    selectedEmotionIndex = 0;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notificationEmotionSelectHandle:) name:kNotificationEmotionSelect object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notificationDeleteHandle:) name:kNotificationDelete object:nil];
}

- (void)notificationDeleteHandle:(NSNotification *)notification
{
    if ([self.delegate respondsToSelector:@selector(emotionKeyboardViewWillDelete:)]) {
        [self.delegate emotionKeyboardViewWillDelete:self];
    }
}

- (void)notificationEmotionSelectHandle:(NSNotification *)notification
{
    LWEmotionModel *model = notification.object;
    if ([self.delegate respondsToSelector:@selector(emotionKeyboardView:didSelectEmotion:)]) {
        [self.delegate emotionKeyboardView:self didSelectEmotion:model];
    }
}

- (void)setSubviewAutoLayout
{
    [self.pagControl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self);
        make.top.equalTo(self.emotionsCollectionView.mas_bottom);
        make.bottom.equalTo(self.titleButtonGrop.mas_top);
        make.height.mas_equalTo(20);
    }];
    [self.titleButtonGrop mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self);
        make.top.equalTo(self.pagControl.mas_bottom);
        make.height.mas_equalTo(30);
    }];
    
    for (UIButton *button in self.arrTitleButton) {
        [self.titleButtonGrop addSubview:button];
    }
    // 设置数组中的按钮间距、宽高相等
    [self.arrTitleButton mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:0 leadSpacing:0 tailSpacing:0];
    
    [self.arrTitleButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_titleButtonGrop).offset(1);
        make.bottom.equalTo(_titleButtonGrop);
    }];
}

- (void)titleButtonOnClick:(UIButton *)sender
{
    for (UIButton *button in self.arrTitleButton) {
        if (button.selected) {
            button.selected = NO;
        }
    }
    sender.selected = YES;
    selectedEmotionIndex = (int)sender.tag;
    [self.emotionsCollectionView reloadData];
}

#pragma mark - <UICollectionViewDataSource, UICollectionViewDelegate>
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    NSInteger number = (self.arrEmotion[selectedEmotionIndex].emotions.count + 19) / 20;
    self.pagControl.numberOfPages = number;
    return number;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    LWTotalCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:totalCellIdentifier forIndexPath:indexPath];
    NSInteger length = self.arrEmotion[selectedEmotionIndex].emotions.count - indexPath.item*20;
    length = MIN(length, 20);
    NSRange range = NSMakeRange(indexPath.item*20, length);
    NSArray *array = [self.arrEmotion[selectedEmotionIndex].emotions subarrayWithRange:range];
    cell.singlePageEmotions = array;
    
    self.pagControl.currentPage = indexPath.item;
    
    return cell;
}
@end





static NSString *partCellIdentifier = @"partCellIdentifier";

@interface LWTotalCollectionViewCell ()
<UICollectionViewDataSource, UICollectionViewDelegate>

@property (nonatomic, strong) UICollectionView *partEmotionCollectionView;

@end

@implementation LWTotalCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self.contentView addSubview:self.partEmotionCollectionView];
    }
    return self;
}

- (void)setSinglePageEmotions:(NSArray<LWEmotionModel *> *)singlePageEmotions
{
    _singlePageEmotions = singlePageEmotions;
    [self.partEmotionCollectionView reloadData];
}

- (UICollectionView *)partEmotionCollectionView
{
    if (_partEmotionCollectionView == nil) {
        UICollectionViewFlowLayout *flowlayout = [[UICollectionViewFlowLayout alloc] init];
        CGSize itemSize_ = CGSizeMake((self.width-6*4)/7.0, (self.height-2*4)/3.0);
        flowlayout.itemSize = itemSize_;
        flowlayout.scrollDirection = UICollectionViewScrollDirectionVertical;
        flowlayout.minimumLineSpacing = 4;          // 元素左右之间的间距
        flowlayout.minimumInteritemSpacing = 4;     // 元素上下之间的间距
        // 50 ：pagControl的高度 + titleButtonGrop的高度
        _partEmotionCollectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, self.width, self.height) collectionViewLayout:flowlayout];
        _partEmotionCollectionView.dataSource = self;
        _partEmotionCollectionView.delegate = self;
        [_partEmotionCollectionView registerClass:[LWPartCollectionViewCell class] forCellWithReuseIdentifier:partCellIdentifier];
        _partEmotionCollectionView.backgroundColor = [UIColor colorWithR:242 g:242 b:242 alpha:1];
    }
    return _partEmotionCollectionView;
}

#pragma mark - <UICollectionViewDataSource, UICollectionViewDelegate>
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 21;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    LWPartCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:partCellIdentifier forIndexPath:indexPath];
    
    if (indexPath.item < 20) {
        if (indexPath.item < self.singlePageEmotions.count) {
            cell.imageView.image = [UIImage imageNamed:self.singlePageEmotions[indexPath.item].png];
        } else {
            cell.imageView.image = nil;
        }
    } else if (indexPath.item == 20) {
        cell.imageView.image = [UIImage imageNamed:@"compose_emotion_delete"];
    }
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    LWPartCollectionViewCell *cell = (LWPartCollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    UIColor *color = cell.backgroundColor;
    
    [UIView animateWithDuration:0.1 animations:^{
        cell.backgroundColor = [UIColor whiteColor];
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.1 animations:^{
            cell.backgroundColor = color;
        }];
    }];
    
    if (indexPath.item == 20) {
        [[NSNotificationCenter defaultCenter] postNotificationName:kNotificationDelete object:nil];
    } else {
        [[NSNotificationCenter defaultCenter] postNotificationName:kNotificationEmotionSelect object:self.singlePageEmotions[indexPath.item]];
    }
}

@end





@implementation LWPartCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self.contentView addSubview:self.imageView];
        [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            // make.edges.equalTo(self.contentView);
            make.left.top.mas_equalTo(5);
            make.right.bottom.mas_equalTo(-5);
        }];
    }
    return self;
}

- (UIImageView *)imageView
{
    if (_imageView == nil) {
        _imageView = [[UIImageView alloc] init];
    }
    return _imageView;
}

@end
