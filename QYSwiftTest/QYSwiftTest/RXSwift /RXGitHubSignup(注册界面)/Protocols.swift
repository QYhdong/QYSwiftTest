//
//  Protocols.swift
//  QYSwiftTest
//
//  Created by HJddd on 2018/9/28.
//  Copyright © 2018年 HuangDong. All rights reserved.
//

import RxCocoa
import RxSwift

//验证结果
enum  ValidationResult{
    case ok(message:String)
    case empty
    case validating
    case failed(message:String)
}

extension ValidationResult{
    var isValid:Bool{
        switch self {
        case .ok:
            return true
        default:
            return false
        }
    }
}

//验证状态
enum SignupState{
    case signedUp(signedUp:Bool)
}

//协议
protocol GitHubApi {
    func usernameAvailable(_ username:String) -> Observable<Bool>
    //注册
    func signup(_ username:String, password:String) -> Observable<Bool>
}

protocol GitHubValidationService {
    //验证用户名
    func validateUsername(_ username:String) -> Observable<ValidationResult>
    //验证密码
    func validatePassword(_ password:String) -> ValidationResult
    //验证再次输入的密码
    func validateRepeatedPassword(_ password:String,repeatedPassword:String) -> ValidationResult
}

