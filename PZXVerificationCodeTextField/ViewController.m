//
//  ViewController.m
//  PZXVerificationCodeTextField
//
//  Created by pzx on 16/12/11.
//  Copyright © 2016年 pzx. All rights reserved.
//

#import "ViewController.h"
#import "PZXVerificationCodeView.h"

@interface ViewController ()

@property(nonatomic,strong)PZXVerificationCodeView *pzxView;
@property(nonatomic,strong)UITextField *TF;
- (IBAction)changeButtonPressed:(UIButton *)sender;
- (IBAction)outButtonPressed:(UIButton *)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    _pzxView = [[PZXVerificationCodeView alloc]initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, 60)];
    _pzxView.selectedColor = [UIColor blackColor];
//    _pzxView.center = self.view.center;
//    _pzxView.deselectColor = [UIColor cyanColor];
    _pzxView.VerificationCodeNum = 6;
//    _pzxView.isSecure = YES;
    _pzxView.Spacing = 0;//每个格子间距属性
    [self.view addSubview:_pzxView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}


- (IBAction)changeButtonPressed:(UIButton *)sender {
    
    _pzxView.isSecure = !_pzxView.isSecure;
}

- (IBAction)outButtonPressed:(UIButton *)sender {
    
    UIAlertController  *alert = [UIAlertController alertControllerWithTitle:@"验证码" message:[NSString stringWithFormat:@"%@",_pzxView.vertificationCode] preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *ok = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    
    [alert addAction:ok];
    [self presentViewController:alert animated:YES completion:nil];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    
    for (UITextField *tf in _pzxView.textFieldArray) {
        
        [tf resignFirstResponder];
    }
//    [self.view endEditing:YES];
    
}
@end
