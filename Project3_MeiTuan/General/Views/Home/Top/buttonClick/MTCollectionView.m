//
//  MTCollectionView.m
//  Project3_MeiTuan
//
//  Created by tens03 on 16/4/13.
//  Copyright © 2016年 tens03. All rights reserved.
//

#import "MTCollectionView.h"
#import "MTTextButton.h"
static NSString *identifyCollectionCell = @"MTLocationCollectionCellCollectionViewCell";

@interface MTCollectionView()
<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>
/**
 *  location CollectionView
 */
@property(strong, nonatomic)UICollectionView *collectionView;
///.address Name
@property(strong, nonatomic)NSArray *addressArray;
///.contentCollectionView
@property(strong, nonatomic)UIView *contentCollectionView;

@property(strong, nonatomic)MTTextButton *addressChangeButton;
@end




@implementation MTCollectionView


- (instancetype)init
{
    self = [super init];
    if (self) {
        [self showCollectionView];
    }
    return self;
}

#pragma mark - collectionView
-(void)showCollectionView{
    [self.collectionView registerClass:[MTLocationCollectionCellCollectionViewCell class] forCellWithReuseIdentifier:identifyCollectionCell];
    [self addSubview:self.contentCollectionView];
    self.contentCollectionView.backgroundColor = [UIColor orangeColor];
    self.contentCollectionView.frame = CGRectMake(25, 80, 270, 300);
    
    [self.contentCollectionView addSubview:self.collectionView];
    self.collectionView.frame = CGRectMake(0, 0, 270, 270);
    
    [self.contentCollectionView addSubview:self.addressChangeButton];
    self.addressChangeButton.frame = CGRectMake(0, 270 , 270, 30);
}
-(void)autoCollectionViewPosition{
    [self.contentCollectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.mas_equalTo(self).offset(30);
        make.trailing.mas_equalTo(self).offset(-30);
        make.top.mas_equalTo(self).offset(90);
        make.height.mas_equalTo(300);
    }];
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.contentCollectionView);
        make.leading.mas_equalTo(self.contentCollectionView);
        make.trailing.mas_equalTo(self.contentCollectionView);
        make.height.mas_equalTo(270);
    }];
    self.addressChangeButton.addressNameLabel.font = [UIFont systemFontOfSize:16];
    [self.addressChangeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(self);
        make.leading.mas_equalTo(self);
    }];
}
#pragma mark - collectionView delegate
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
        return UIEdgeInsetsMake(5, 5, 5, 5);
}
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(70, 40);
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 21;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    MTLocationCollectionCellCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifyCollectionCell    forIndexPath:indexPath];
    long j = 0;
    if (indexPath.row < self.addressArray.count) {
        j = indexPath.row;
    }else{
        j = indexPath.row % self.addressArray.count;
    }
    cell.button.addressNameLabel.text = self.addressArray[j];
    return cell;
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"%ld", indexPath.item);
}
#pragma mark - get collectionView
-(UICollectionView *)collectionView{
    if (!_collectionView) {
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:flowLayout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.backgroundColor = [UIColor grayColor];
    }
    return _collectionView;
}
-(NSArray *)addressArray{
    if (!_addressArray) {
        _addressArray = @[
                          @"全城",
                          @"新津",
                          @"锦江区",
                          @"金牛区",
                          @"龙泉驿区",
                          @"武侯区",
                          @"青白江区",
                          @"新都区",
                          @"青羊区",
                          @"温江区",
                          @"成华区",
                          @"都江堰市",
                          @"彭州市",
                          @"邛崃市",
                          @"崇州市",
                          @"金堂县",
                          @"郫县",
                          @"大邑县",
                          @"蒲江县",
                          @"双流县",
                          @"高新区"
                          ];
    }
    return _addressArray;
}
-(UIView *)contentCollectionView{
    if (!_contentCollectionView) {
        _contentCollectionView = [[UIView alloc]init];
        _contentCollectionView.backgroundColor = [UIColor clearColor];
    }
    return     _contentCollectionView;
}
-(MTTextButton *)addressChangeButton{
    if (!_addressChangeButton) {
        _addressChangeButton = [[MTTextButton alloc]init];
        _addressChangeButton.addressNameLabel.text = @"当前城市：成都    切换";
        _addressChangeButton.addressNameLabel.textColor = [UIColor blackColor];
        _addressChangeButton.addressNameLabel.font = [UIFont systemFontOfSize:16];
        [_addressChangeButton addTarget:self action:@selector(addressChangeButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _addressChangeButton;
}

-(void)addressChangeButtonClick:(MTTextButton*)sender{
    NSLog(@"马上去改变  城市");
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    self.hidden = YES;
}
@end