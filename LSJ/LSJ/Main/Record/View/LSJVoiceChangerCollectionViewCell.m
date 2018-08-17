//
//  LSJVoiceChangerCollectionViewCell.m
//  LSJ
//
//  Created by 周鑫 on 2018/8/17.
//  Copyright © 2018年 ZX. All rights reserved.
//

#import "LSJVoiceChangerCollectionViewCell.h"
#import "VoiceModel.h"


@interface LSJVoiceChangerCollectionViewCell ()

@property (nonatomic,weak) UIImageView *imageView;
@end

@implementation LSJVoiceChangerCollectionViewCell
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI {
    
    self.backgroundColor = ClearColor;
    __weak typeof(self) weakSelf = self;
    UIImageView *imageView = [[UIImageView alloc]init];
//    imageView.backgroundColor = RedColor;
    [self.contentView addSubview:imageView];
    self.imageView = imageView;
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(weakSelf);
    }];
    
    
    
}

- (void)setVoiceModel:(VoiceModel *)voiceModel {
    
    _voiceModel = voiceModel;
    self.imageView.image = [UIImage imageNamed:voiceModel.imageName];
    
    
}
@end
