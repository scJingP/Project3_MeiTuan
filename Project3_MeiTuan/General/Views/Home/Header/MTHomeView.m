//
//  MTHomeView.m
//  Project3_MeiTuan
//
//  Created by tens03 on 16/4/10.
//  Copyright © 2016年 tens03. All rights reserved.
//

#import "MTHomeView.h"

static NSString *identify = @"MTHomeCollectionCell";
@interface MTHomeView()
<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>
//@property(strong, nonatomic)UICollectionView *collectionView;
{
    UICollectionView *_collectionView;
    CGRect bbb;
}
@end

@implementation MTHomeView
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        bbb = frame;
        
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
        flowLayout.itemSize = CGSizeMake(64, 80);
        flowLayout.minimumInteritemSpacing = 0;
        flowLayout.minimumLineSpacing = 0;
        flowLayout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
        flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        
        _collectionView = [[UICollectionView alloc]initWithFrame:frame collectionViewLayout:flowLayout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.backgroundColor = [UIColor purpleColor];
        
        [self addSubview:_collectionView];
        
        [_collectionView registerClass:[MTHomeCollectionCell class] forCellWithReuseIdentifier:identify];
        
        [self autoLayer];
        
    }
    return self;
}

-(void)addToView{
    
}
-(void)autoLayer{
    
    NSLog(@"%@   %@", self, _collectionView);
    
    [_collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.leading.trailing.mas_equalTo(self);
    }];
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 19;
}
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section{
    return bbb.size;
}
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(0, 0, 0, 0);
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    MTHomeCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identify forIndexPath:indexPath];
    [cell sizeToFit];
    if (!cell) {
        NSLog(@"----------------------");
    }
    cell.button.functionLabel.text = [@(indexPath.row)stringValue];
    //        NSLog(@"ok ! %ld", indexPath.row);
    //        cell.button.iconImageView.image = [UIImage imageNamed:@"about_praise"];
    //        cell.button.functionLabel.text = @"打酱油";
    
    return cell;
}
#pragma mark  - UICollectionViewDelegateFlowLayout


#pragma mark - get

//-(UICollectionView *)collectionView{
//    if (!_collectionView) {
//        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
//        flowLayout.itemSize = CGSizeMake(60, 60);
//        flowLayout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
//        flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
//
//        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:flowLayout];
//        _collectionView.dataSource = self;
//        _collectionView.bounds = CGRectMake(0, 0, 64, 75);
//    }
//    return _collectionView;
//}



@end
