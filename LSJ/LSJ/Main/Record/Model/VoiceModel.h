//
//  VoiceModel.h
//  LSJ
//
//  Created by 周鑫 on 2018/8/17.
//  Copyright © 2018年 ZX. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VoiceModel : NSObject
@property (nonatomic,strong) NSString *imageName;
@property (nonatomic,assign) VoiceType voiceType;

- (instancetype)initWithImageName:(NSString *)imageName voiceType:(VoiceType)voiceType;
@end
