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
 
        view.backgroundColor = UIColor.white
        
        // Do any additional setup after loading the view.
        
       let resultOne = testOne(numArr: [1,2,3])
        print("数字顺序\(resultOne.one).....\(resultOne.two).....\(resultOne.three)")
        
       let resultTwo = testTwo(Nums: 2,3,5,6,8,7,10)
        print("打印求和数字:\(resultTwo)")
        
        testThree()
    }


 //1.函数返回包含多个返回值
    func testOne(numArr:[Int]) -> (one:Int , two:Int , three:Int){
        return (numArr[0],numArr[1],numArr[2])
    }

//2.函数可以带有可变个数的参数
    func testTwo(Nums:Int...) -> Int {
        var sumNum = 0
        for num in Nums {
            sumNum += num
        }
        return sumNum
    }
    
//3.
    func testThree(){
        
    }
    
}
