//
//  HDAlgorithmViewController.swift
//  QYSwiftTest
//
//  Created by HJddd on 2018/4/25.
//  Copyright © 2018年 HuangDong. All rights reserved.
//

import UIKit

class HDAlgorithmViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white
        
//        let numArr = [2,7,20,12,8,3,66,32,16,18,33]
        
        let numArr = [2, 7, 11, 15];
        
        bubblingCalculate()
        
        algorithmOne(numArr, 9)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    
    //
    func bubblingCalculate() {
        
        var aaa = [2,7,20,12,8,3,66,32,16,18,33]
        for i in 0..<aaa.count {
            for j in 0..<aaa.count - (i+1) {
                if aaa[j] > aaa[j+1]{
                    let temp = aaa[j]
                    aaa[j] = aaa[j+1]
                    aaa[j+1] = temp
                }
            }
        }
        
        print("冒泡\(aaa)")
    }
    
//相加求和
/*
     给定一个整数数组和一个目标值，找出数组中和为目标值的两个数。
     你可以假设每个输入只对应一种答案，且同样的元素不能被重复利用。
     
     示例:
     给定 nums = [2, 7, 11, 15], target = 9
     因为 nums[0] + nums[1] = 2 + 7 = 9
     所以返回 [0, 1]
 */
    
    func algorithmOne(_ num:[Int], _ target:Int)  {
        
    }

    
}
