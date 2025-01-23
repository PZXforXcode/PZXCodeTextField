import UIKit

class ViewController: UIViewController, PZXCodeInputViewDelegate {

    private var cellView: PZXVerificationCodeView!
    private var spacingView: PZXVerificationCodeView!
    private var grayView: PZXVerificationCodeView!
    private var bottomLineInputView: PZXVerificationCodeView!
    private var codeInputView: PZXCodeInputView!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        // Initialize cellView
        cellView = PZXVerificationCodeView(frame: CGRect(x: 0, y: 100, width: view.frame.size.width, height: 60))
        cellView.selectedColor = .black
        cellView.verificationCodeNum = 6
        cellView.spacing = 0
        view.addSubview(cellView)

        // Initialize spacingView
        spacingView = PZXVerificationCodeView(frame: CGRect(x: 0, y: 200, width: view.frame.size.width, height: 60))
        spacingView.selectedColor = .blue
        spacingView.deselectColor = .gray
        spacingView.isCursorHidden = true
        spacingView.borderWidth = 2
        spacingView.verificationCodeNum = 6
        spacingView.spacing = 6
        spacingView.pzx_keyboardType = .decimalPad;
        view.addSubview(spacingView)

        // Initialize grayView
        grayView = PZXVerificationCodeView(frame: CGRect(x: 0, y: 300, width: view.frame.size.width, height: 60))
        grayView.selectedColor = .clear
        grayView.deselectColor = .clear
        grayView.textFieldBackgroundColor = .groupTableViewBackground
        grayView.borderWidth = 0
        grayView.cornerRadius = 6
        grayView.verificationCodeNum = 6
        grayView.spacing = 6
        view.addSubview(grayView)

        // Initialize bottomLineInputView
        bottomLineInputView = PZXVerificationCodeView(frame: CGRect(x: 16, y: 400, width: view.frame.size.width - 32, height: 60))
        bottomLineInputView.selectedColor = .black
        bottomLineInputView.deselectColor = .lightGray
        bottomLineInputView.verificationCodeNum = 6
        bottomLineInputView.lineStyle = true
        bottomLineInputView.spacing = 16
        view.addSubview(bottomLineInputView)

        // Initialize codeInputView
        codeInputView = PZXCodeInputView(numberOfFields: 4)
        codeInputView.translatesAutoresizingMaskIntoConstraints = false
        codeInputView.style = .dash
        codeInputView.delegate = self
        view.addSubview(codeInputView)

        NSLayoutConstraint.activate([
            codeInputView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            codeInputView.topAnchor.constraint(equalTo: view.topAnchor, constant: 500),
            codeInputView.heightAnchor.constraint(equalToConstant: 50),
            codeInputView.widthAnchor.constraint(equalToConstant: 300)
        ])
        
        grayView.pzx_becomeFirstResponder(1)
    }

    @objc func changeButtonPressed(_ sender: UIButton) {
        cellView.isSecure.toggle()
    }

    @objc func outButtonPressed(_ sender: UIButton) {
        let alert = UIAlertController(title: "验证码", message: cellView.vertificationCode, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "确定", style: .default, handler: nil)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        for textField as! UIText in cellView.textFieldArray {
//            textField.resignFirstResponder()
//        }
//        for textField in bottomLineInputView.textFieldArray {
//            textField.resignFirstResponder()
//        }
//        codeInputView.resignFirstResponder()
        self.view.endEditing(true)
    }

    // MARK: - PZXCodeInputViewDelegate
    func codeInputViewDidFinishInput(_ inputView: PZXCodeInputView, code: String) {
        print("Code entered: \(code)")
        // Handle logic after input is completed
    }
}
