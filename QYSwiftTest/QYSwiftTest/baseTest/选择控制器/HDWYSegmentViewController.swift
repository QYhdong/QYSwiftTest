//
//  HDWYSegmentViewController.swift
//  QYSwiftTest
//
//  Created by HJddd on 2018/8/24.
//  Copyright © 2018年 HuangDong. All rights reserved.
//

import UIKit
import Foundation

class HDWYSegmentViewController: HDWYViewController {

    var person:Person!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let vcOne = UIViewController()
        vcOne.view.backgroundColor = UIColor.orange
        
        let vcTwo = UIViewController()
        vcTwo.view.backgroundColor = UIColor.blue
        
        addChildViewController(vcOne)
        addChildViewController(vcTwo)
        
        
        var aaa = Person("aaa")
        print(aaa)
        
        weak var bbb = Person("bbb")
        print(bbb)
        
        weak var ccc = aaa
        print(ccc)
        UILabel()
//        person = ccc
        print(CFGetRetainCount(aaa))
        print()
        withUnsafePointer(to: &aaa) { print("\($0)") }
        
        let arr = [1,2,3,4,5,6,7,8,9]
        
        let result = arr.reduce(0) { (runningNum, num) in
            return runningNum + num
        }
        print(result)
    }

    deinit {
        print()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

class Person {
    var name:String
    
    init(_ name:String) {
        self.name = name
        print(CFGetRetainCount(name as CFTypeRef ))
    }
    
    deinit {
        print("deinit---\(CFGetRetainCount(name as CFTypeRef ))")
    }
}
