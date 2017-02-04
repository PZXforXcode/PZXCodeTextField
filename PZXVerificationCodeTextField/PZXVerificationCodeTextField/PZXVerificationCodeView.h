//
//  PZXVerificationCodeView.h
//  PZXVerificationCodeTextField
//
//  Created by pzx on 16/12/11.
//  Copyright © 2016年 pzx. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PZXVerificationCodeView : UIView

@property(nonatomic,assign)NSInteger VerificationCodeNum;//验证码位数

@property(nonatomic,assign)BOOL isSecure;//是否密文显示

@property(nonatomic,assign)CGFloat Spacing;//每个格子间距


@property (nonatomic, strong,readonly) NSString *vertificationCode;//验证码内容

@property (nonatomic, strong)UIColor *deselectColor;//未选中颜色

@property (nonatomic, strong)UIColor *selectedColor;//选中颜色

@property (nonatomic, strong)NSMutableArray *textFieldArray;//放textField的array用于在外面好取消键盘

@end
