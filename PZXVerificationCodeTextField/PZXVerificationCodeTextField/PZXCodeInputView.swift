//
//  File.swift
//  PZXCodeInputView
//
//  Created by 彭祖鑫 on 2024/5/16.
//

import UIKit

@objc protocol PZXCodeInputViewDelegate: AnyObject {
    func codeInputViewDidFinishInput(_ inputView: PZXCodeInputView, code: String)
}


import UIKit

@objc class PZXCodeInputView: UIView, UITextFieldDelegate {
    
    private var labels: [UILabel] = []
    private let textField = UITextField()
    private let numberOfFields: Int
    private let dashCharacter: String = "-"
    private let stackView = UIStackView()
    
    @objc weak var delegate: PZXCodeInputViewDelegate?
    
@objc init(numberOfFields: Int = 6) {
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
        textField.delegate = self
        addSubview(textField)
        
        setupConstraints()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(becomeFirstResponder))
        addGestureRecognizer(tapGesture)
    }
    
    private func createLabel() -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = dashCharacter
        label.font = UIFont.monospacedDigitSystemFont(ofSize: 24, weight: .regular)
        label.textAlignment = .center
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
                label.widthAnchor.constraint(equalToConstant: 30), // 固定宽度
                label.heightAnchor.constraint(equalToConstant: 40)
            ])
        }
    }
    
    @objc override func becomeFirstResponder() -> Bool {
        textField.becomeFirstResponder()
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let currentText = textField.text else { return false }
        let newLength = currentText.count + string.count - range.length
        if newLength <= numberOfFields {
            textField.text = (currentText as NSString).replacingCharacters(in: range, with: string)
            updateLabels()
            
            if newLength == numberOfFields {
                delegate?.codeInputViewDidFinishInput(self, code: textField.text ?? "")
            }
            
            return false
        }
        return false
    }
    
    private func updateLabels() {
        guard let text = textField.text else { return }
        for i in 0..<numberOfFields {
            if i < text.count {
                let index = text.index(text.startIndex, offsetBy: i)
                labels[i].text = String(text[index])
            } else {
                labels[i].text = dashCharacter
            }
        }
    }
}
