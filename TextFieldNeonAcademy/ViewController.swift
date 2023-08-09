//
//  ViewController.swift
//  TextFieldNeonAcademy
//
//  Created by Kerem Caan on 31.07.2023.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    let textField: UITextField = UITextField()
    let secondTf: UITextField = UITextField()
    let thirdTf: UITextField = UITextField()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        textField.delegate = self
        secondTf.delegate = self
        thirdTf.delegate = self
    }

    
    func configureUI() {
        
        view.addSubview(textField)
        textField.placeholder = "Enter name-surname"
        textField.textColor = .red
        textField.borderStyle = .bezel
        textField.font = .boldSystemFont(ofSize: 16)
        textField.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(200)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview()
        }
        
        view.addSubview(secondTf)
        secondTf.placeholder = "Enter email"
        secondTf.textColor = .blue
        secondTf.borderStyle = .bezel
        secondTf.font = .italicSystemFont(ofSize: 16)
        secondTf.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(350)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview()
        }
        
        view.addSubview(thirdTf)
        thirdTf.placeholder = "Enter Phone Number"
        thirdTf.textColor = .green
        thirdTf.borderStyle = .bezel
        thirdTf.font = .none
        thirdTf.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(500)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview()
        }
    }
    
    
    
    

}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let underlineAtt = [NSAttributedString.Key.underlineStyle: NSUnderlineStyle.thick.rawValue]
        let underlineAttString = NSAttributedString(string: thirdTf.text!, attributes: underlineAtt)
        thirdTf.attributedText = underlineAttString
        
        let currentText = textField.text ?? ""

        guard let stringRange = Range(range, in: currentText) else { return false }

        let updatedText = currentText.replacingCharacters(in: stringRange, with: string)
        
        if textField == thirdTf {
            return updatedText.count <= 10
        } else {
            return true
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField){
        if textField == secondTf {
            if isValidEmail(email: textField.text!) {
                print("Email Geçerli")
            } else {
                print("Geçersiz email girildi.")
            }
        }
        }
    
    func isValidEmail(email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    }

