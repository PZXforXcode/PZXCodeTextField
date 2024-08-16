//
//  PZXVerificationCodeView.m
//  PZXVerificationCodeTextField
//
//  Created by pzx on 16/12/11.
//  Copyright © 2016年 pzx. All rights reserved.
//

#import "PZXVerificationCodeView.h"
#import "PZXVerificationTextField.h"
@interface PZXVerificationCodeView ()<UITextFieldDelegate,PZXTextFieldDelegate>
#pragma mark - 私有属性

@property (nonatomic, strong,readwrite) NSString *vertificationCode;//验证码内容
@end

@implementation PZXVerificationCodeView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.VerificationCodeNum = 4;//默认4位
        self.Spacing = 0;//默认间距为0
        self.lineStyle = false; //默认是格子样式
        self.selectedColor = [UIColor cyanColor];
        self.deselectColor = [UIColor redColor];   //默认边框颜色

        [self setView]; //绘制界面
        
        
        NSLog(@"%ld",self.VerificationCodeNum);
    }
    return self;
}

-(void)setSecure{//修改明文密文方法
    
    for (UITextField *tf in _textFieldArray) {
        
        tf.secureTextEntry = _isSecure;
    }

}

-(void)setView {
    self.textFieldArray = [NSMutableArray array];
    
    // Remove any existing subviews (text fields and lines)
    for (UIView *view in [self subviews]) {
        [view removeFromSuperview];
    }
    
    CGFloat textFieldWidth = self.frame.size.width / self.VerificationCodeNum - _Spacing;
    
    for (int i = 0; i < self.VerificationCodeNum; i++) {
        // Create the text field
        PZXVerificationTextField *tf = [[PZXVerificationTextField alloc] initWithFrame:CGRectMake(i * (self.frame.size.width / self.VerificationCodeNum) + _Spacing / 2, 0, textFieldWidth, self.frame.size.height)];
        tf.backgroundColor = [UIColor clearColor];
        tf.pzx_delegate = self;
        tf.keyboardType = UIKeyboardTypeNumberPad;
        tf.textColor = [UIColor blackColor];
        tf.inputView = nil;
        tf.delegate = self;
        tf.tag = 100 + i;
        tf.textAlignment = NSTextAlignmentCenter;
        tf.secureTextEntry = self.isSecure;
        
        if (self.lineStyle) {
            // If lineStyle is true, remove border and add a line below the text field
            tf.layer.borderWidth = 0.0;
            UIView *line = [[UIView alloc] initWithFrame:CGRectMake(tf.frame.origin.x, CGRectGetMaxY(tf.frame) - 1, textFieldWidth, 1)];
            line.backgroundColor = self.deselectColor;
            line.tag = 1000 + i;
            [self addSubview:line];
        } else {
            tf.layer.borderColor = self.deselectColor.CGColor;
            tf.layer.borderWidth = 0.5;
        }
        
        [self addSubview:tf];
        [self.textFieldArray addObject:tf];
    }
}


//点击退格键的代理
#pragma mark - PZXTextFieldDelegate
-(void)PZXTextFieldDeleteBackward:(PZXVerificationTextField *)textField{
    
    PZXVerificationTextField *tf = [_textFieldArray firstObject];
    if (textField.tag > tf.tag) {
        
        UITextField *newTF =  (UITextField *)[self viewWithTag:textField.tag-1];
        newTF.text = @"";
        [newTF becomeFirstResponder];
    }

    
}

#pragma mark - UITextFieldDelegate

//代理（里面有自己的密码线）
-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{

    // 处理粘贴多个字符的情况
    if (string.length > 1) {
        NSMutableArray *textFields = [NSMutableArray arrayWithArray:self.textFieldArray];
        NSInteger currentIndex = textField.tag - 100; // 假设第一个文本框的 tag 为 100
        for (NSUInteger i = 0; i < string.length; i++) {
            if (currentIndex + i < textFields.count) {
                UITextField *tf = textFields[currentIndex + i];
                tf.text = [NSString stringWithFormat:@"%c", [string characterAtIndex:i]];
                [tf becomeFirstResponder];
            }
        }
        
        // 清除剩余的文本框
        for (NSUInteger i = currentIndex + string.length; i < textFields.count; i++) {
            UITextField *tf = textFields[i];
            tf.text = @"";
        }
        
        [self getVertificationCode];
        return NO;
    } else {
        // 处理单字符输入
        textField.text = string;
        UITextField *tf = [_textFieldArray lastObject];
        if (textField.text.length > 0) {
            if (textField.tag < tf.tag) {
                UITextField *newTF =  (UITextField *)[self viewWithTag:textField.tag + 1];
                [newTF becomeFirstResponder];
            }
        }
        [self getVertificationCode];
        return NO;
    }
}

//在里面改变选中状态以及获取验证码
-(void)textFieldDidBeginEditing:(UITextField *)textField{

    textField.layer.borderColor = self.selectedColor.CGColor;
    UIView *line =  (UIView *)[self viewWithTag:textField.tag + 900];
    line.backgroundColor = self.selectedColor;
    [self getVertificationCode];
}

-(void)textFieldDidEndEditing:(UITextField *)textField{
    
    textField.layer.borderColor = self.deselectColor.CGColor;
    UIView *line =  (UIView *)[self viewWithTag:textField.tag + 900];
    line.backgroundColor = self.deselectColor;

    [self getVertificationCode];
}

-(void)getVertificationCode{ //获取验证码方法

    NSString *str = [NSString string];
    
    for (int i = 0; i<_textFieldArray.count; i++) {
        str = [str stringByAppendingString:[NSString stringWithFormat:@"%@",(UITextField *)[_textFieldArray[i] text]]];
    }
    _vertificationCode = str;
    
}
#pragma mark - set方法
-(void)setVerificationCodeNum:(NSInteger)VerificationCodeNum{
    
    //这里用self会死循环！
    _VerificationCodeNum = VerificationCodeNum;
    [self setView];
    
}
-(void)setSpacing:(CGFloat)Spacing{

    _Spacing = Spacing;
    [self setView];
}

- (void)setLineStyle:(BOOL)lineStyle{
    
    _lineStyle = lineStyle;
    [self setView];
}


-(void)setIsSecure:(BOOL)isSecure{
    
    _isSecure = isSecure;
    [self setSecure];

}

-(void)setDeselectColor:(UIColor *)deselectColor{

    _deselectColor = deselectColor;
    
}
-(void)setSelectedColor:(UIColor *)selectedColor{
    
    _selectedColor = selectedColor;

}

//点击回收键盘
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    for (UITextField *tf in self.textFieldArray) {
        
        [tf resignFirstResponder];
    }


}
@end
