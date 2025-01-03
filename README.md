<h1 align="center">PZXCodeTextField</h1>
<p align="center">
  <img src="https://github.com/PZXforXcode/PZXCodeTextField/blob/master/PZXVerificationCodeTextField/PICon.png" alt="PZXCodeTextField Logo" width="400">
</p>

## intro / 简介
EN:  

A segmented verification code or password input control that allows customization of size, input digits, and selected border color, among other options. Similar to the verification code input feature in the Uber app. If you have any questions or suggestions, feel free to add me on WeChat: KpengS.  

Chinese:  

一个按格分割的验证码或者密码输入控件，可以自定义大小和输入位数以及选中边框颜色等。类似uberAPP的验证码输入功能，有什么问题或者建议可以加我Vx：KpengS  

## 支持OC和Swift使用

## Overview / 概述
- [x] Objective-C compatibility
- [x] Swift 5 Support
- [x] Supports CocoaPods
- [x] Supports Custom Styling
- [x] Supports Horizontal Line Input Style
- [x] Quick Setup
- [x] Continuous Updates



## New Features / 新增效果

| 样式总览 |
| --- |
| <img src="https://github.com/user-attachments/assets/cde9e984-09f0-4784-996a-7d13ff3209b5" width="190" height="400"> |

| 格子输入框 | 动效 |
| --- | --- |
| <br> <img src="https://github.com/PZXforXcode/PZXCodeTextField/blob/master/PZXVerificationCodeTextField/gezi2024.PNG" width="190" height="400"> |  <br> <img src="https://upload-images.jianshu.io/upload_images/19409325-abc359691897365c.gif?imageMogr2/auto-orient/strip" width="190" height="400"> | <br> <img src="https://github.com/PZXforXcode/PZXVerificationCodeTextField/blob/master/PZXVerificationCodeTextField/14761715847088_.pic.jpg" width="190" height="400"> | <br> <img src="https://github.com/PZXforXcode/PZXCodeTextField/blob/master/PZXVerificationCodeTextField/henxian2024.GIF?imageMogr2/auto-orient/strip" width="190" height="400"> 

| 横线输入框 | 动效 | 
| --- | --- |
| <br> <img src="https://github.com/PZXforXcode/PZXVerificationCodeTextField/blob/master/PZXVerificationCodeTextField/14761715847088_.pic.jpg" width="190" height="400"> | <br> <img src="https://github.com/PZXforXcode/PZXCodeTextField/blob/master/PZXVerificationCodeTextField/henxian2024.GIF?imageMogr2/auto-orient/strip" width="190" height="400"> |

| 下划线输入框 | 动效 | 
| --- | --- |
| <br> <img src="https://github.com/PZXforXcode/PZXCodeTextField/blob/master/PZXVerificationCodeTextField/2024.PNG" width="190" height="400"> |<br> <img src="https://github.com/PZXforXcode/PZXCodeTextField/blob/master/PZXVerificationCodeTextField/yxm2024.GIF" width="190" height="400"> 


## Requirements / 支持
----------------
- iOS 12.0+
- Xcode 15+

## Install / 安装
### Manually / 手动
----------------
1. Download and drop ```/Sources``` folder in your project.  
2. Congratulations!
### CocoaPods
##### pod 文件新增
##### To integrate PZXCodeTextField into your Xcode project using CocoaPods, specify it in your Podfile:

```
target '<Your Target Name>' do
  	pod 'PZXCodeTextField'
end
```


## Usage: / 使用:
Objective-C
```Objective-C
    _cellView = [[PZXVerificationCodeView alloc]initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, 60)];
    _cellView.selectedColor = [UIColor blackColor];
    //    _pzxView.center = self.view.center;
    //    _pzxView.deselectColor = [UIColor cyanColor];
    _cellView.VerificationCodeNum = 6;
    //    _pzxView.isSecure = YES;//密文
    _cellView.Spacing = 0;//每个格子间距属性
    [self.view addSubview:_cellView];
```
Swift
```Swift
        override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.


        let codeView = PZXVerificationCodeView.init(frame: CGRect(x: 0, y: 100, width: SCREEN_WIDTH, height: 60))
        codeView.selectedColor = .black
        codeView.verificationCodeNum = 4
        codeView.spacing = 8
        self.view.addSubview(codeView)
        
        let codeInputView = PZXCodeInputView(numberOfFields: 4)
        codeInputView.translatesAutoresizingMaskIntoConstraints = false
        codeInputView.delegate = self
        view.addSubview(codeInputView)
        
        NSLayoutConstraint.activate([
            codeInputView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            codeInputView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            codeInputView.heightAnchor.constraint(equalToConstant: 50),
            codeInputView.widthAnchor.constraint(equalToConstant: 300)
        ])
    }
    
    func codeInputViewDidFinishInput(_ inputView: PZXCodeInputView, code: String) {
        print("Code entered: \(code)")
        // 在这里处理输入完成后的逻辑
        // Handle the logic after input completion here

    }
```


