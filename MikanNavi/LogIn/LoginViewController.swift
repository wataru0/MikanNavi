//
//  LoginViewController.swift
//  MikanNavi
//
//  Created by 岡本航昇 on 2020/12/26.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var registerButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        label.text = "User Name"
        registerButton.setTitle("In", for: .normal)
    }
    
    @IBAction func registerButtonTapped(_ sender: Any) {
        let userName = textField.text
        
        if userName == "" {
            displayMyAlertMessage(userMessage: "フォームにユーザー名を入力してください！")
            return
        }
        
        // ユーザー名を登録
        UserDefaults.standard.set(userName, forKey: "userName")
        
        // ログイン情報を記録
        UserDefaults.standard.set(true, forKey: "isUserLoggedIn")
        
//        let sb: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
//        let mainViewController = sb.instantiateViewController(identifier: "MainView")
//        self.present(mainViewController, animated: true, completion: nil
        self.dismiss(animated: true, completion: nil)
        
    }
    
    // アラートを出す処理
    func displayMyAlertMessage(userMessage: String){
        
        let myAlert = UIAlertController(title:"Alert", message: userMessage, preferredStyle:  UIAlertController.Style.alert)
        let okAction = UIAlertAction(title:"OK", style: UIAlertAction.Style.default, handler:nil)
        myAlert.addAction(okAction);
        self.present(myAlert,animated:true, completion:nil)
        
    }
}
