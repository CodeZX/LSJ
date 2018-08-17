//
//  VoiceModel.m
//  LSJ
//
//  Created by 周鑫 on 2018/8/17.
//  Copyright © 2018年 ZX. All rights reserved.
//

#import "VoiceModel.h"

@implementation VoiceModel

- (instancetype)initWithImageName:(NSString *)imageName voiceType:(VoiceType)voiceType{
    self  = [super init];
    if (self) {
        self.imageName = imageName;
        self.voiceType = voiceType;
    }
    return self;
}
@end
