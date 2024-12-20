//
//  ViewController.m
//  PZXVerificationCodeTextField
//
//  Created by pzx on 16/12/11.
//  Copyright © 2016年 pzx. All rights reserved.
//

#import "ViewController.h"
#import "PZXVerificationCodeView.h"
#import "PZXVerificationCodeTextField-Swift.h" // 自动生成的Swift桥接头文件

@interface ViewController () <PZXCodeInputViewDelegate>

@property(nonatomic,strong)PZXVerificationCodeView *cellView;

@property(nonatomic,strong)PZXVerificationCodeView *SpacingView;

@property(nonatomic,strong)PZXVerificationCodeView *grayView;


@property(nonatomic,strong)UITextField *TF;
- (IBAction)changeButtonPressed:(UIButton *)sender;
- (IBAction)outButtonPressed:(UIButton *)sender;

@property(nonatomic,strong)PZXVerificationCodeView *bottomLineInputView;
@property(nonatomic,strong)PZXCodeInputView *codeInputView;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    _cellView = [[PZXVerificationCodeView alloc]initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, 60)];
    _cellView.selectedColor = [UIColor blackColor];
    //    _pzxView.center = self.view.center;
    //    _pzxView.deselectColor = [UIColor cyanColor];
    _cellView.VerificationCodeNum = 6;
    //    _pzxView.isSecure = YES;//密文
    _cellView.Spacing = 0;//每个格子间距属性
    [self.view addSubview:_cellView];
    
    _SpacingView = [[PZXVerificationCodeView alloc]initWithFrame:CGRectMake(0, 200, self.view.frame.size.width, 60)];
    _SpacingView.selectedColor = [UIColor blueColor];
    _SpacingView.deselectColor = [UIColor grayColor];
    //隐藏键盘游标
    _SpacingView.isCursorHidden = true;
    _SpacingView.borderWidth = 2;
    _SpacingView.VerificationCodeNum = 6;
    //    _pzxView.isSecure = YES;//密文
    _SpacingView.Spacing = 6;//每个格子间距属性
    [self.view addSubview:_SpacingView];
    
    
    _grayView = [[PZXVerificationCodeView alloc]initWithFrame:CGRectMake(0, 300, self.view.frame.size.width, 60)];
    _grayView.selectedColor = [UIColor clearColor];
    _grayView.deselectColor = [UIColor clearColor];
    _grayView.textFieldBackgroundColor = [UIColor groupTableViewBackgroundColor];
    _grayView.borderWidth = 0;
    _grayView.cornerRadius = 6;
    _grayView.VerificationCodeNum = 6;
    //    _pzxView.isSecure = YES;//密文
    _grayView.Spacing = 6;//每个格子间距属性
    [self.view addSubview:_grayView];
    
    
    _bottomLineInputView = [[PZXVerificationCodeView alloc]initWithFrame:CGRectMake(16, 400, self.view.frame.size.width - 32, 60)];
    _bottomLineInputView.selectedColor = [UIColor blackColor];
    _bottomLineInputView.deselectColor = [UIColor lightGrayColor];

    _bottomLineInputView.VerificationCodeNum = 6;
    _bottomLineInputView.lineStyle = true;
    _bottomLineInputView.Spacing = 16;//每根线间距属性
    [self.view addSubview:_bottomLineInputView];
    
    
    _codeInputView = [[PZXCodeInputView alloc] initWithNumberOfFields:4];
    _codeInputView.translatesAutoresizingMaskIntoConstraints = NO;
    _codeInputView.style = PZXCodeInputViewStyleDash;
    _codeInputView.delegate = self;
    [self.view addSubview:_codeInputView];
    
    [NSLayoutConstraint activateConstraints:@[
        [_codeInputView.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor],
        [_codeInputView.topAnchor constraintEqualToAnchor:self.view.topAnchor constant:500],
        [_codeInputView.heightAnchor constraintEqualToConstant:50],
        [_codeInputView.widthAnchor constraintEqualToConstant:300]
    ]];

    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


- (IBAction)changeButtonPressed:(UIButton *)sender {
    
    _cellView.isSecure = !_cellView.isSecure;
}

- (IBAction)outButtonPressed:(UIButton *)sender {
    
    UIAlertController  *alert = [UIAlertController alertControllerWithTitle:@"验证码" message:[NSString stringWithFormat:@"%@",_cellView.vertificationCode] preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *ok = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    
    [alert addAction:ok];
    [self presentViewController:alert animated:YES completion:nil];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    
    for (UITextField *tf in _cellView.textFieldArray) {
        
        [tf resignFirstResponder];
    }
    for (UITextField *tf in _bottomLineInputView.textFieldArray) {
        
        [tf resignFirstResponder];
    }
    
    [_codeInputView setResignFirstResponder];
    //    [self.view endEditing:YES];
    
}

#pragma mark - PZXCodeInputViewDelegate

- (void)codeInputViewDidFinishInput:(PZXCodeInputView *)inputView code:(NSString *)code {
    NSLog(@"Code entered: %@", code);
    // 在这里处理输入完成后的逻辑
}
@end
