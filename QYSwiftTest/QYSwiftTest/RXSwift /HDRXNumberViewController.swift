
//
//  HDRXNumberViewController.swift
//  QYSwiftTest
//
//  Created by HJddd on 2018/9/27.
//  Copyright © 2018年 HuangDong. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class HDRXNumberViewController: UIViewController {
    
    @IBOutlet weak var numOneTextField: UITextField!                //参与计算数字1
    @IBOutlet weak var numTwoTextField: UITextField!                //参与计算数字2
    @IBOutlet weak var numThreeTextField: UITextField!             //参与计算数字3
    @IBOutlet weak var resultLabel: UILabel!                                //结果
    
    var disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        Observable.combineLatest(numOneTextField.rx.text.orEmpty,numTwoTextField.rx.text.orEmpty,numThreeTextField.rx.text.orEmpty){
            textValue1, textValue2, textValue3 -> Int   in
            return (Int(textValue1) ?? 0)+(Int(textValue2) ?? 0)+(Int(textValue3) ?? 0)
        }
        .map{$0.description}
        .bind(to: resultLabel.rx.text)
        .disposed(by: disposeBag)
        
        
    }
    

}
