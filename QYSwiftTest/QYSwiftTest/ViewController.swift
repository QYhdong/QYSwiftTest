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
//1.
//        let addTwo = addTo(adder: 2)
//        let result = addTwo(6)
//        print("方法currying后结果是\(result)")
//2.
//        sortClick()
//3.
//        NewcalculateAction(methodString: "+")
//        NewcalculateAction(methodString: "-")
//        NewcalculateAction(methodString: "*")
//        NewcalculateAction(methodString: "/")
//4.
        var num1 = 10
        var num2 = 20
        changeNum(num1: &num1, num2: &num2)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //MARK: 柯里化方法==========
    func addTo(adder:Int) -> (Int) -> Int{
        return {
            num in
            return num + adder
        }
    }

    //MARK: $0==========
    func sortClick(){
        let numArr = [6,2,4,5,7,8,1,9,3]
        var sortNums = numArr.sorted{$0<$1}
        print("<排序后\(sortNums)")
        sortNums = numArr.sorted{$1<$0}
        print(">排序后\(sortNums)")
    }
    
    //MARK: 关于代码简化==========
    /*
     原始代码
     */
    let op1 = 3.5
    let op2 = 2.5
    
//    //运算符
//    func calculateAction(methodString:String){
//    
//        switch methodString {
//        case "+":
//            operationNum(operation: add)
//        case "-":
//            operationNum(operation: subtract)
//        case "*":
//            operationNum(operation: multiply)
//        case "/":
//            operationNum(operation: devide)
//        default: break
//            
//        }
//        
//    }
    //计算
    func operationNum(_ operation:(Double,Double) -> Double){
    
        let value = operation(op1, op2)
        print("打印计算结果\(value)")
    }
//    //加减乘除操作
//    //*
//    func multiply(op1:Double, op2:Double) -> Double {
//        return op1 * op2
//    }
//    //÷
//    func devide(op1:Double, op2:Double) -> Double {
//        return op1 / op2
//    }
//    //+
//    func add(op1:Double, op2:Double) -> Double {
//        return op1 + op2
//    }
//    //-
//    func subtract(op1:Double, op2:Double) -> Double {
//        return op1 - op2
//    }
    
    /*
     简化后的代码
     */
    //运算符
    func NewcalculateAction(methodString:String){
        
        switch methodString {
        case "+":
            operationNum({$0 + $1})
        case "-":
            operationNum({$0 - $1})
        case "*":
            operationNum({$0 * $1})
        case "/":
            operationNum({$0 / $1})
        default: break
            
        }
    }
    
    //MARK:Tuple交换
    func changeNum( num1:inout Int, num2:inout Int){
        print("原始打印num1是\(num1),num2是\(num2)")
        (num1,num2) = (num2,num1)
        print("Tuple后打印num1是\(num1),num2是\(num2)")
    }
    
//------------------------
}

