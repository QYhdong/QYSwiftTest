//
//  HDBaseTestViewController.swift
//  QYSwiftTest
//
//  Created by HJddd on 2018/7/17.
//  Copyright © 2018年 HuangDong. All rights reserved.
//

import UIKit
import CoreSpotlight

class HDBaseTestViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
 
        view.backgroundColor = UIColor.white
        
        // Do any additional setup after loading the view.
        
       let resultOne = testOne(numArr: [1,2,3])
        print("数字顺序\(resultOne.one).....\(resultOne.two).....\(resultOne.three)")
        
       let resultTwo = testTwo(Nums: 2,3,5,6,8,7,10)
        print("打印求和数字:\(resultTwo)")
        
//        testThree()
        
//        insertSearchItem()
        
        gcdTest()
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
    
//CSSearchableItem
    func insertSearchItem(){
        let attributeSet = CSSearchableItemAttributeSet(itemContentType: "com.dong.QYSwiftTest-")
        attributeSet.title = "东dong东"
        attributeSet.contentDescription = "哈哈哈 好好学习天天向上!~"
        let searchableItem = CSSearchableItem(uniqueIdentifier: "0", domainIdentifier: "com.dong.QYSwiftTest-", attributeSet: attributeSet)
        
        
        CSSearchableIndex.default().indexSearchableItems([searchableItem]) { (error) in
            
        }
    }
    
    func gcdTest(){
        
        let queue = DispatchQueue(label: "123", qos: .default)
        
        
        queue.async {
            for i in 0..<20{
                print("打印数字\(i)")
            }
        }
//        queue.sync {
//            for i in 0..<20{
//                print("打印数字\(i)")
//            }
//        }
    }
    
    
    
}
