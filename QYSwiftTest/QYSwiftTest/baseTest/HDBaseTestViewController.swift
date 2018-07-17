//
//  HDBaseTestViewController.swift
//  QYSwiftTest
//
//  Created by HJddd on 2018/7/17.
//  Copyright © 2018年 HuangDong. All rights reserved.
//

import UIKit

class HDBaseTestViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
      let resultOne = testOne(numArr: [1,2,3])
        print("数字顺序\(resultOne.one).....\(resultOne.two).....\(resultOne.three)")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
 //1.函数返回包含多个返回值
    func testOne(numArr:[Int]) -> (one:Int , two:Int , three:Int){
        return (numArr[0],numArr[1],numArr[2])
    }

}
