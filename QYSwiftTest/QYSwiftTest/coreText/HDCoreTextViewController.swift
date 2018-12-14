//
//  HDCoreTextViewController.swift
//  QYSwiftTest
//
//  Created by HJddd on 2018/12/7.
//  Copyright © 2018年 HuangDong. All rights reserved.
//

import UIKit

class HDCoreTextViewController: UIViewController {

    var label:UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    
        // Do any additional setup after loading the view.
    }
    
    func setupUI(){
        view.backgroundColor = UIColor.white
        label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        view.addSubview(label)
        label.snp.makeConstraints { (make) in
            make.center.equalTo(self.view)
        }
        label.attributedText = getAttribute(string: "100000/每月")
    }
    
    func getAttribute(string:String)->(NSMutableAttributedString){
        
        let attribute = NSMutableAttributedString(string: string )
        let range = (string as NSString).range(of: "/")
        let pointRange = NSMakeRange(0, range.location)
        let dic = NSMutableDictionary()
        dic[NSFontAttributeName] = UIFont.systemFont(ofSize: 18)
        dic[NSForegroundColorAttributeName] = UIColor.orange
        attribute.addAttributes(dic as! [String : Any], range: pointRange)
        
        let  attch = NSTextAttachment()
        attch.image = UIImage(named: "WechatIMG303")
        attch.bounds = CGRect(x: 0, y: 0, width: 60, height: 60)
        let attchStr = NSAttributedString(attachment: attch)
        attribute.append(attchStr)
        
        return attribute
    }

}
