//
//  ViewController.swift
//  QYSwiftTest
//
//  Created by ddd on 17/8/8.
//  Copyright © 2017年 HuangDong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let addTwo = addTo(adder: 2)
        let result = addTwo(6)
        print("方法currying后结果是\(result)")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //柯里化方法
    func addTo(adder:Int) -> (Int) -> Int{
        return {
            num in
            return num + adder
        }
    }

}

