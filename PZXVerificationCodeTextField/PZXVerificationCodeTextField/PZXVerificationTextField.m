//
//  PZXVerificationTextField.m
//  PZXVerificationCodeTextField
//
//  Created by pzx on 16/12/11.
//  Copyright © 2016年 pzx. All rights reserved.
//

#import "PZXVerificationTextField.h"

@implementation PZXVerificationTextField

-(void)deleteBackward{
    [super deleteBackward];
    if ([self.pzx_delegate respondsToSelector:@selector(PZXTextFieldDeleteBackward:)]) {
        
        [self.pzx_delegate PZXTextFieldDeleteBackward:self];
    }
    
    
}

@end
