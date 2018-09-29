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

    //MARK:控件
    fileprivate lazy var usernameValidation = UILabel()                                                                                                                  //用户名验证
    fileprivate lazy var passwordValidation = UILabel()                                                                                                                  //密码验证
    fileprivate lazy var repeatedPasswordValidation = UILabel()                                                                                                    //确认密码验证
    
    fileprivate lazy var userNameTextField:UITextField! = self.createTextField("Username(用户名)")                                     //用户名
    fileprivate lazy var passwordTextField:UITextField! = self.createTextField("Password(密码)")                                         //密码
    fileprivate lazy var repeatedPasswordTextField:UITextField! = self.createTextField("Password Repeat(确认密码)")        //确认密码
    
    fileprivate lazy var signupBtn:UIButton = { [weak self] in                                                                               //登录按钮
        let btn = UIButton(type: UIButtonType.custom)
        btn.setTitle("signup(注册)", for: UIControlState.normal)
        btn.setTitleColor(UIColor.white, for: UIControlState.normal)
        btn.backgroundColor = UIColor.blue
        btn.layer.cornerRadius = 5
        btn.clipsToBounds = true
        //        weak var weakSelf = self
        self?.view.addSubview(btn)
        return btn
        }()
    
    //创建TextField
    fileprivate func createTextField(_ name:String) ->  UITextField{
        let textF = UITextField()
        textF.placeholder = name
        textF.borderStyle = .roundedRect
        view.addSubview(textF)
        return textF
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        
    }
    
    //布局
    fileprivate func setupUI() {
        
        view.backgroundColor = UIColor.white
        
        view.addSubview(usernameValidation)
        view.addSubview(passwordValidation)
        view.addSubview(repeatedPasswordValidation)
        
        userNameTextField.snp.makeConstraints { (maker) in
            maker.left.equalTo(view).offset(15)
            maker.top.equalTo(view).offset(30)
            maker.right.equalTo(view).offset(-15)
            maker.height.equalTo(40)
        }
        usernameValidation.snp.makeConstraints { (maker) in
            maker.left.equalTo(userNameTextField)
            maker.top.equalTo(userNameTextField.snp_bottomMargin).offset(5)
            maker.height.equalTo(30)
        }
        passwordTextField.snp.makeConstraints { (maker) in
            maker.left.equalTo(userNameTextField)
            maker.right.equalTo(view).offset(-15)
            maker.top.equalTo(usernameValidation.snp_bottomMargin).offset(5)
            maker.height.equalTo(40)
        }
        passwordValidation.snp.makeConstraints { (maker) in
            maker.left.equalTo(userNameTextField)
            maker.top.equalTo(passwordTextField.snp_bottomMargin).offset(5)
            maker.height.equalTo(30)
        }
        repeatedPasswordTextField.snp.makeConstraints { (maker) in
            maker.left.equalTo(userNameTextField)
            maker.right.equalTo(view).offset(-15)
            maker.top.equalTo(passwordValidation.snp_bottomMargin).offset(5)
            maker.height.equalTo(40)
        }
        repeatedPasswordValidation.snp.makeConstraints { (maker) in
            maker.left.equalTo(userNameTextField)
            maker.top.equalTo(repeatedPasswordTextField.snp_bottomMargin).offset(5)
            maker.height.equalTo(30)
        }
        signupBtn.snp.makeConstraints { (maker) in
            maker.centerX.equalTo(view)
            maker.top.equalTo(repeatedPasswordValidation.snp_bottomMargin).offset(15)
            maker.height.equalTo(40)
            maker.left.equalTo(view).offset(30)
            maker.right.equalTo(view).offset(-30)
        }
    }
}


extension HDRXGitHubSignupViewController{
    
    
   
}


