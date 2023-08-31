//
//  CustomTextField.swift
//  MyPet
//
//  Created by Дина Шварова on 29.04.2023.
//

import UIKit

final class CustomTextField: UIView, UITextFieldDelegate {
    
    var text: String?
    
    var isSecureTextEntry: Bool = false {
        willSet(newValue) {
            textField.isSecureTextEntry = newValue
        }
    }
    
    private lazy var textField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .none
        textField.backgroundColor = .clear
        textField.textColor = .white
        textField.font = .systemFont(ofSize: 16)
        textField.autocapitalizationType = .none
        textField.adjustsFontSizeToFitWidth = true
        textField.delegate = self
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private lazy var bottomLine: UIView = {
        let view = UIView()
        view.backgroundColor = .darkGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    init(text: String, placeholder: String) {
        super.init(frame: .zero)
        setupView()
        textField.text = text
        textField.placeholder = placeholder
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func getText() -> String {
        textField.text ?? ""
    }
    
    func setText(text: String) {
        textField.text = text
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
            return self.textLimit(existingText: textField.text, newText: string, limit: 50)
        }
    
    private func textLimit(existingText: String?, newText: String, limit: Int) -> Bool {
        let text = existingText ?? ""
        let isAtLimit = text.count + newText.count <= limit
        return isAtLimit
    }
    
    private func setupView() {
        addSubviews(bottomLine, textField)
        
        NSLayoutConstraint.activate([
            textField.widthAnchor.constraint(equalTo: widthAnchor),
            
            bottomLine.widthAnchor.constraint(equalTo: widthAnchor),
            bottomLine.heightAnchor.constraint(equalToConstant: 1),
            bottomLine.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 8)
        ])
    }
}

