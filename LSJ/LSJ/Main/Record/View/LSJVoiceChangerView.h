//
//  LSJVoiceChangerView.h
//  LSJ
//
//  Created by 周鑫 on 2018/8/17.
//  Copyright © 2018年 ZX. All rights reserved.
//

#import <UIKit/UIKit.h>


@class LSJVoiceChangerView;
@protocol  LSJVoiceChangerViewDelegate <NSObject>
@optional
- (void)voiceChangerView:(LSJVoiceChangerView *)voiceChangerView didSelect:(VoiceType)voiceType;
- (void)voiceChangerView:(LSJVoiceChangerView *)voiceChangerView didCloseBtnClicked:(UIButton *)Closebtn;
@required
@end
@interface LSJVoiceChangerView : UIView
@property (nonatomic,weak) id<LSJVoiceChangerViewDelegate> delegate;
@end
