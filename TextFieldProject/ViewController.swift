//
//  ViewController.swift
//  TextFieldProject
//
//  Created by HoJun on 2022/09/17.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate{

    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textField.delegate = self
        
        setUpUI()
    }
    
    func setUpUI() {
        view.backgroundColor = UIColor.gray
        
        textField.keyboardType = UIKeyboardType.emailAddress
        textField.placeholder = "이메일 입력"
        textField.borderStyle = .roundedRect
        textField.clearButtonMode = .whileEditing
        textField.returnKeyType = .go
        
        // 텍스트필드에 가장 먼저 포커스를 맞춰줌 -> 실행시 키보드 올라오고 커서 깜빡임
        textField.becomeFirstResponder()
    }
    
    // 텍스트 필드의 입력을 시작할때 호출 (시작할지 말지)
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        return true
    }
    
    // 입력을 시작하는 시점
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("유저가 텍스트필드의 입력을 시작했다.")
    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        return true
    }
    
    // 텍스트필드 글자 내용이 입력되거나 지워질때 호출되고 (허락)
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        // 입력된 글자가 숫자인 경우 입력을 허용하지 않음
        if Int(string) != nil {
            return false
        } else {
            // 10 글자 이상 입력되는 것을 막음
            guard let text = textField.text else {return true}
            let newLength = text.count + string.count - range.length
            return newLength <= 10
        }
    }
    
    // 화면의 탭을 감지하는 메서드
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true) // 모든 editing 해제
    }
    
//    // 텍스트필드의 엔터키가 눌러지면 다음 동작을 허락할것인지 말건지
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        <#code#>
//    }
//
//    // 텍스트필드의 입력이 끝날때 호출 (끝날지 말지)
//    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
//        <#code#>
//    }
//
//    // 텍스트필드의 입력이 실제 끝났을때 호출 - 시점
//    func textFieldDidEndEditing(_ textField: UITextField) {
//        <#code#>
//    }
    
    @IBAction func doneButtonTapped(_ sender: UIButton) {
        // 텍스트필드 포커스 해체 -> 키보드 내리기
        textField.resignFirstResponder()
    }
}

