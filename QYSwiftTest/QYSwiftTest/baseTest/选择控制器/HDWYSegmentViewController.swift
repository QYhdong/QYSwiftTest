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
        
        
        let aaa = "aaa"
        print(aaa)
        
        
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
