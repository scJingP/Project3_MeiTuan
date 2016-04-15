//
//  MTTextSearchVC.m
//  Project3_MeiTuan
//
//  Created by tens03 on 16/4/13.
//  Copyright © 2016年 tens03. All rights reserved.
//

#import "MTTextSearchVC.h"
#import "MTImageButton.h"
#import "MTLocationCollectionCellCollectionViewCell.h"
#import <Masonry.h>
static NSString *identify = @"MTLocationCollectionCellCollectionViewCell";
@interface MTTextSearchVC ()
<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>
@property(strong, nonatomic)NSArray *textArray;
@property(strong, nonatomic)UICollectionView *collectionView;
@end
 
@implementation MTTextSearchVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addToView];
    [self.collectionView registerClass:[MTLocationCollectionCellCollectionViewCell class] forCellWithReuseIdentifier:identify];
    [self addCollectionToView];
}
-(void)addToView{
    ///.right 搜索
    UIBarButtonItem *buttonItemRight = [[UIBarButtonItem alloc]initWithTitle:@"搜索" style:UIBarButtonItemStyleBordered target:self action:nil];
    self.navigationItem.rightBarButtonItem = buttonItemRight;
    /**
     中间 textFiled
     */
    ///.textFiled
    UITextField *textSearchTextField = [[UITextField alloc]init];
    [textSearchTextField setPlaceholder:    @"请输入商家分类或商圈"];
    textSearchTextField.font = [UIFont systemFontOfSize:12];
    textSearchTextField.frame = CGRectMake(16, 0, 244, 30);
        UIBarButtonItem *textSearchButtonItem = [[UIBarButtonItem alloc]initWithCustomView:textSearchTextField];
    ///.放大镜
//    MTImageButton *imageButton = [[MTImageButton alloc]init];
//    
//    imageButton.iconImage.image = [UIImage imageNamed:@"icon_search_empty"];
//    imageButton.iconImage.width = 16;
//    imageButton.iconImage.height  = 16;
//    imageButton.frame = CGRectMake(0, 0, 16, 30);
//        UIBarButtonItem *imageButtonItem = [[UIBarButtonItem alloc]initWithCustomView:imageButton];
    
    UIView *searchAndImageView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 260, 30)];
//    [searchAndImageView addSubview:imageButton];
    [searchAndImageView addSubview:textSearchTextField];
    
    UIBarButtonItem *searchAndImageViewButtonItem = [[UIBarButtonItem alloc]initWithCustomView:searchAndImageView];
    
    UIToolbar *toolBar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, 260, 30)];
    toolBar.items = @[searchAndImageViewButtonItem ];
    toolBar.backgroundColor = [UIColor greenColor];
    self.navigationItem.titleView = toolBar;
    /**
     *  自动布局
     *
     *  @param make <#make description#>
     *
     *  @return <#return value description#>
     */
//    [imageButton mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.leading.mas_equalTo(searchAndImageView.mas_leading);
//        make.top.mas_equalTo(searchAndImageView.mas_top);
//    }];
//    
//    self.toolbarItems = @[imageButtonItem, textSearchButtonItem];
}



-(void)addCollectionToView{
    [self.view addSubview:self.collectionView];
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.view).offset(120);
        make.leading.mas_equalTo(self.view);
        make.trailing.mas_equalTo(self.view);
        make.height.mas_equalTo(120);
    }];
}

#pragma mark - UICollectionViewDataSource
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(0, 0, 0, 0);
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 9;
}
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(80, 30);
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    MTLocationCollectionCellCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identify forIndexPath:indexPath];
    
    
    cell.button.addressNameLabel.text = self.textArray[indexPath.row];
    cell.button.addressNameLabel.textColor = [UIColor whiteColor];
    return cell;
}
-(NSArray *)textArray{
    if (!_textArray) {
        _textArray =  @[
                        @"德克士",
                        @"华莱士",
                        @"乡村基",
                        @"麦的多",
                        @"豪客来",
                        @"廖记棒棒鸡",
                        @"水货",
                        @"烤匠",
                        @"元祖食品",
                        ];
    }
    return _textArray;
}
-(UICollectionView *)collectionView{
    if (!_collectionView) {
        
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
        flowLayout.itemSize = CGSizeMake(80, 30);
        flowLayout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:flowLayout];
        _collectionView .delegate = self;
        _collectionView.dataSource = self;
        _collectionView.backgroundColor = [UIColor colorWithR:200 g:200 b:200 alpha:1];
        //        _collectionView.frame = CGRectMake(0, 0, <#CGFloat width#>, <#CGFloat height#>)
    }
    return _collectionView;
    
}
@end
