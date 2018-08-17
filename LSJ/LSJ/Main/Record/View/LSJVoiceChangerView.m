//
//  LSJVoiceChangerView.m
//  LSJ
//
//  Created by 周鑫 on 2018/8/17.
//  Copyright © 2018年 ZX. All rights reserved.
//

#import "LSJVoiceChangerView.h"
#import "LSJVoiceChangerCollectionViewCell.h"
#import "VoiceModel.h"



static NSString *identifier = @"LSJVoiceChangerCollectionViewCell";
@interface LSJVoiceChangerView ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property (nonatomic,weak) UICollectionView *collectionView;
@property (nonatomic,strong) NSArray *dataSource;
@property (nonatomic,weak) UIButton *closeBtn;
@end
@implementation LSJVoiceChangerView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI {
    
    self.backgroundColor = WhiteColor;
    
    __weak typeof(self) weakSelf = self;
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    layout.itemSize = CGSizeMake(66,66);
    layout.minimumLineSpacing = 30;
    layout.minimumInteritemSpacing = 25;
    UICollectionView  *collectionView = [[UICollectionView alloc]initWithFrame:self.frame collectionViewLayout:layout];
    collectionView.backgroundColor = WhiteColor;
    collectionView.delegate = self;
    collectionView.dataSource  = self;
    [self addSubview:collectionView];
    self.collectionView = collectionView;
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(weakSelf).offset(UIEdgeInsetsMake(20, 20, 20, 20));
    }];
                           
    [self.collectionView registerClass:[LSJVoiceChangerCollectionViewCell class] forCellWithReuseIdentifier:identifier];
    
    
    UIButton *closeBtn = [UIButton buttonWithType:UIButtonTypeContactAdd];
    [self addSubview:closeBtn];
    self.closeBtn = closeBtn;
    [closeBtn addTarget:self action:@selector(closeBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.closeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(-10);
        make.top.equalTo(10);
    }];
    
    
    
    self.layer.cornerRadius = 5;
    self.layer.masksToBounds = YES;
}

- (void)closeBtnClicked:(UIButton *)btn {
    
    if ([self.delegate respondsToSelector:@selector(voiceChangerView:didCloseBtnClicked:)]) {
        [self.delegate voiceChangerView: self didCloseBtnClicked:btn];
    }
}

#pragma mark -------------------------- UICollectionViewDelegate ----------------------------------------

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return self.dataSource.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    LSJVoiceChangerCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    cell.voiceModel = self.dataSource[indexPath.row];
  
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    
    __weak typeof(self) weakSelf = self;
    if ([self.delegate respondsToSelector:@selector(voiceChangerView:didSelect:)]) {
        VoiceModel *voicemModel = weakSelf.dataSource[indexPath.row];
        [self.delegate voiceChangerView:self didSelect:voicemModel.voiceType];
    }
}

#pragma mark -------------------------- load lazy ----------------------------------------
- (NSArray *)dataSource {
    if (!_dataSource) {
//        _dataSource = @[@"boy",@"deep",@"girl",@"man",@"neutral",@"oldman",@"thriller",@"whimsy",@"woman"];
        _dataSource = @[   [[VoiceModel alloc]initWithImageName:@"boy" voiceType:VoiceTypeBoy],
                        [[VoiceModel alloc]initWithImageName:@"girl" voiceType:VoiceTypeGirl],
                        [[VoiceModel alloc]initWithImageName:@"man" voiceType:VoiceTypeMan],
                        [[VoiceModel alloc]initWithImageName:@"woman" voiceType:VoiceTypeWoman],
                        [[VoiceModel alloc]initWithImageName:@"oldman" voiceType:VoiceTypeOldman],
        ];
    }
    return _dataSource;
}

@end
