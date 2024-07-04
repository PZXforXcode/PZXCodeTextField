# PZXCodeTextField
EN:  

A segmented verification code or password input control that allows customization of size, input digits, and selected border color, among other options. Similar to the verification code input feature in the Uber app. If you have any questions or suggestions, feel free to add me on WeChat: KpengS.  

Chinese:  

一个按格分割的验证码或者密码输入控件，可以自定义大小和输入位数以及选中边框颜色等。类似uberAPP的验证码输入功能，有什么问题或者建议可以加我Vx：KpengS  

## 新增效果/New Features
![分开样式](https://github.com/PZXforXcode/PZXVerificationCodeTextField/blob/master/PZXVerificationCodeTextField/14761715847088_.pic.jpg)
## 效果图1:/Effect 1:
![分开样式](https://upload-images.jianshu.io/upload_images/19409325-abc359691897365c.gif?imageMogr2/auto-orient/strip)
## 效果图2:/Effect 2:
![紧贴样式](https://upload-images.jianshu.io/upload_images/19409325-2b23124e901fd1a2.gif?imageMogr2/auto-orient/strip)
## Usage:
Objective-C
```Objective-C
    _pzxView = [[PZXVerificationCodeView alloc]initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, 60)];
    _pzxView.selectedColor = [UIColor blackColor];
//    _pzxView.deselectColor = [UIColor cyanColor];
    _pzxView.VerificationCodeNum = 4;
//    _pzxView.isSecure = YES;
      _pzxView.Spacing = 0;//每个格子间距属性// Spacing between each box
   [self.view addSubview:_pzxView];
```
Swift
```Swift
        override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
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



