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

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let vcOne = UIViewController()
        vcOne.view.backgroundColor = UIColor.orange
        
        let vcTwo = UIViewController()
        vcTwo.view.backgroundColor = UIColor.blue
        
        addChildViewController(vcOne)
        addChildViewController(vcTwo)
        
        
        let aaa = Person("aaa")
        print(aaa)
        
        weak var bbb = Person("bbb")
        print(bbb)
        
        weak var ccc = aaa
        print(ccc)
        
        print(CFGetRetainCount(aaa))
        
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
    }
}
