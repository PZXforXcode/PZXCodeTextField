import UIKit

@objc public protocol PZXCodeInputViewDelegate: AnyObject {
    func codeInputViewDidFinishInput(_ inputView: PZXCodeInputView, code: String)
}

@objc public class PZXCodeInputView: UIView {
    
    @objc public enum PZXCodeInputViewStyle: Int {
        case dash
        case box
    }
    
    private var labels: [UILabel] = []
    private let textField = UITextField()
    private let numberOfFields: Int
    private let dashCharacter: String = "-"
    private let stackView = UIStackView()
    
    @objc weak var delegate: PZXCodeInputViewDelegate?
    
    @objc public var style: PZXCodeInputViewStyle = .dash {
        didSet {
            updateLabels()
        }
    }
    
    @objc public init(numberOfFields: Int = 6) {
        self.numberOfFields = numberOfFields
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        stackView.spacing = 8
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        for _ in 0..<numberOfFields {
            let label = createLabel()
            labels.append(label)
            stackView.addArrangedSubview(label)
        }
        
        addSubview(stackView)
        
        textField.keyboardType = .numberPad
        textField.isHidden = true
        textField.addTarget(self, action: #selector(textFieldChanged), for: .editingChanged)
        addSubview(textField)
        
        setupConstraints()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(becomeFirstResponder))
        addGestureRecognizer(tapGesture)
    }
    
    private func createLabel() -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.monospacedDigitSystemFont(ofSize: 24, weight: .regular)
        label.textAlignment = .center
        label.layer.borderWidth = 1.0
        label.layer.borderColor = UIColor.lightGray.cgColor
        

        return label
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
        ])
        
        for label in labels {
            NSLayoutConstraint.activate([
                label.widthAnchor.constraint(equalToConstant: 50),
                label.heightAnchor.constraint(equalToConstant: 50)
            ])
        }
    }
    
    @objc public override func becomeFirstResponder() -> Bool {
        textField.becomeFirstResponder()
    }
    
    @objc private func textFieldChanged() {
        updateLabels()
        
        if let text = textField.text, text.count == numberOfFields {
            delegate?.codeInputViewDidFinishInput(self, code: text)
        }
    }
    
    private func updateLabels() {
        guard let text = textField.text else { return }
        
        for i in 0..<numberOfFields {
            if (style == .box) {
                labels[i].layer.borderWidth = 1.0
            } else {
                labels[i].layer.borderWidth = 0
            }
            if i < text.count {
                let index = text.index(text.startIndex, offsetBy: i)
                labels[i].text = String(text[index])
            } else {
                labels[i].text = style == .dash ? dashCharacter : ""
            }
        }
    }
    
    @objc public func setResignFirstResponder() {
        textField.resignFirstResponder()
    }
}
