//
//  DataBaseViewController.swift
//  QYSwiftTest
//
//  Created by HJddd on 2018/12/18.
//  Copyright © 2018年 HuangDong. All rights reserved.
//

import UIKit

class DataBaseViewController: UIViewController {


    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        view.backgroundColor = UIColor.white
    }
    
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let sss = HDFMDBManger.share.selectFromTable(table: "book") as! [String]
        for name in sss {
            print(name)
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        HDFMDBManger.share.insertInfoTable(table: "book", text: "人类简史")
        HDFMDBManger.share.insertInfoTable(table: "book", text: "时间简史")
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        HDFMDBManger.share.clearTable(table: "book")
    }

}
