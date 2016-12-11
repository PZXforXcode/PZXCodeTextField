//
//  PZXVerificationTextField.h
//  PZXVerificationCodeTextField
//
//  Created by pzx on 16/12/11.
//  Copyright © 2016年 pzx. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PZXVerificationTextField;//要class一下不然代理里面无法识别

@protocol PZXTextFieldDelegate <NSObject>

- (void)PZXTextFieldDeleteBackward:(PZXVerificationTextField *)textField;


@end

@interface PZXVerificationTextField : UITextField

@property (nonatomic, assign)id<PZXTextFieldDelegate> pzx_delegate;

@end
