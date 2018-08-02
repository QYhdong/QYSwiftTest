
//
//  HDRxTestViewController.swift
//  QYSwiftTest
//
//  Created by HJddd on 2018/8/1.
//  Copyright © 2018年 HuangDong. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class HDRxTestViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = UIColor.white
        
        let observableO = Observable.of("不","能","说","的","秘","密")
        observableO.subscribe { (event) in
            print(event.element ?? "compeled")
        }

        observableO.subscribe(onNext: { (element) in
            print(element)
        }, onError: { (error) in
            print(error)
        }, onCompleted: {
            print("completed")
        }) {

        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
