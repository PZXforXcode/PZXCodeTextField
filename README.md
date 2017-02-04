# PZXVerificationCodeTextField
一个按格分割的验证码或者密码输入控件，可以自定义大小和输入位数以及选中边框颜色等。类似uberAPP的验证码输入功能
## 效果图1:
![image](https://github.com/PZXforXcode/PZXVerificationCodeTextField/blob/master/PZXVerificationCodeTextField/pzxYZM.gif)
## 效果图2:
![image](https://github.com/PZXforXcode/PZXVerificationCodeTextField/blob/master/PZXVerificationCodeTextField/vDemo.gif)
## Usage:
```Objective-C
    _pzxView = [[PZXVerificationCodeView alloc]initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, 60)];
    _pzxView.selectedColor = [UIColor blackColor];
//    _pzxView.deselectColor = [UIColor cyanColor];
    _pzxView.VerificationCodeNum = 4;
//    _pzxView.isSecure = YES;
      _pzxView.Spacing = 0;//每个格子间距属性
   [self.view addSubview:_pzxView];
```
