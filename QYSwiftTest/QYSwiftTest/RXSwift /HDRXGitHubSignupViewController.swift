//
//  HDRXGitHubSignupViewController.swift
//  QYSwiftTest
//
//  Created by HJddd on 2018/9/28.
//  Copyright © 2018年 HuangDong. All rights reserved.
//

import UIKit
import SnapKit

class HDRXGitHubSignupViewController: UIViewController {

    lazy var userNameTextField:UITextField! = UITextField()                                         //用户名
    lazy var usernameValidation = UILabel()                                                                       //用户名验证
    lazy var passwordTextField:UITextField! = UITextField()                                         //密码
    lazy var passwordValidation = UILabel()                                                                       //密码验证
    lazy var repeatedPasswordTextField:UITextField! = UITextField()                          //确认密码
    lazy var repeatedPasswordValidation = UILabel()                                                        //确认密码验证
    
    lazy var signupBtn:UIButton = {                                                                                   //登录按钮
        let btn = UIButton(type: UIButtonType.custom)
        btn.setTitle("signup(注册)", for: UIControlState.normal)
        btn.setTitleColor(UIColor.white, for: UIControlState.normal)
        btn.backgroundColor = UIColor.blue
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    //布局
    func setupUI() {
        
        view.addSubview(userNameTextField)
        view.addSubview(passwordTextField)
        view.addSubview(repeatedPasswordTextField)
        view.addSubview(repeatedPasswordTextField)
        
        userNameTextField.placeholder = "Username(用户名)"
        passwordTextField.placeholder = "Password(密码)"
        repeatedPasswordTextField.placeholder = "Password Repeat(确认密码)"
        
        
        
    }

}
