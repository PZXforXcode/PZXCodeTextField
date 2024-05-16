# PZXVerificationCodeTextField
下载地址：https://github.com/PZXforXcode/PZXVerificationCodeTextField

一个按格分割的验证码或者密码输入控件，可以自定义大小和输入位数以及选中边框颜色等。类似uberAPP的验证码输入功能，有什么问题或者建议可以加我Vx：KpengS
## 新增效果
![分开样式](https://github.com/PZXforXcode/PZXVerificationCodeTextField/blob/master/PZXVerificationCodeTextField/14761715847088_.pic.jpg)
## 效果图1:
![分开样式](https://upload-images.jianshu.io/upload_images/19409325-abc359691897365c.gif?imageMogr2/auto-orient/strip)
## 效果图2:
![紧贴样式](https://upload-images.jianshu.io/upload_images/19409325-2b23124e901fd1a2.gif?imageMogr2/auto-orient/strip)
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
下载地址：https://github.com/PZXforXcode/PZXVerificationCodeTextField



