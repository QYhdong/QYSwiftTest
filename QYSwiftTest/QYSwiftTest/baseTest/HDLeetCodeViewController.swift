//
//  HDLeetCodeViewController.swift
//  QYSwiftTest
//
//  Created by HJddd on 2018/9/5.
//  Copyright © 2018年 HuangDong. All rights reserved.
//

import UIKit

class HDLeetCodeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.white
        
        let result = twoSumOther([2,6,11,15,7], 9)
        print("两数之和的下标---\(result)")

    }

    // 1. 两数之和 =============================================
    /*
     给定一个整数数组和一个目标值，找出数组中和为目标值的两个数。
     
     你可以假设每个输入只对应一种答案，且同样的元素不能被重复利用。
     
     示例:
     
     给定 nums = [2, 7, 11, 15], target = 9
     
     因为 nums[0] + nums[1] = 2 + 7 = 9
     所以返回 [0, 1]
  */

    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        //循环对比前后两数之和
        for i in 0..<nums.count{
            for j in (i+1)..<nums.count{
                if nums[i] + nums[j] == target{
                    return [i,j]
                }
            }
        }
//        guard let tempArr = temp else{return}
        return []
    }

    //哈希表
    func twoSumOther(_ nums: [Int], _ target: Int) -> [Int] {

//        var numDic:[Int:Int] = Dictionary()
//        for(i,num) in nums.enumerated(){
//            numDic[i] = num
//        }
//
//        for j in 0..<nums.count{
//            let otherNum = target - nums[j]
//            for k in 0..<nums.count{
//                if numDic[k] == otherNum{
//                    return [j,k]
//                }
//            }
//
//        }
        
            var numDic:[Int:Int] = Dictionary()
            for(i,num) in nums.enumerated(){
                numDic[num] = i
            }
            for j in 0..<nums.count{
              let otherNum = target - nums[j]
                guard let index = numDic[otherNum] else{
                    return []
                }
                return [j,index]
            }
        
        return []
    }
    
    
    func bubbleSort(nums:[Int]) -> [Int]{
        var mutableArr = nums
        for i in 0..<mutableArr.count-1{
            for j in 0..<mutableArr.count-1-i{
                if mutableArr[j]>mutableArr[j+1]{
                    let tempNum = mutableArr[j+1]
                    mutableArr[j+1] = mutableArr[j]
                    mutableArr[j] = tempNum
                }
            }
        }
        return mutableArr
    }
    
}
