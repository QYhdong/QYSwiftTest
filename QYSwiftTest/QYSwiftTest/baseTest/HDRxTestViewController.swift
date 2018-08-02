
//
//  HDRxTestViewController.swift
//  QYSwiftTest
//
//  Created by HJddd on 2018/8/1.
//  Copyright © 2018年 HuangDong. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import SnapKit

class HDRxTestViewController: UIViewController {

    var label:UILabel!
    
            let dispose = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.white
        
        label = UILabel()
        label.text = "哈哈哈"
        view.addSubview(label)

        
        label.snp.makeConstraints { (maker) in
            maker.top.equalTo(view).offset(30)
            maker.left.equalTo(view).offset(15)
        }
        
        let observableO = Observable.of("不","能","说","的","秘","密")

//        observableO.subscribe { (event) in
//            print(event.element ?? "compeled")
//        }
//
//        observableO.subscribe(onNext: { (element) in
//            print(element)
//        }, onError: { (error) in
//            print(error)
//        }, onCompleted: {
//            print("completed")
//        }) {
//
//        }

//        let observer:AnyObserver<String> = AnyObserver{ event in
//            switch event {
//            case .next(let data):
//                print(data)
//            case .error(let error):
//                print(error)
//            case .completed:
//                print("completed")
//            }
//
//        }
//       let observableT = observableO.subscribe(observer)
//        observableT.disposed(by: dispose)
        
        let observable = Observable<Int>.interval(0.5, scheduler: MainScheduler.instance)
        observable.map {CGFloat($0)}.bind(to: label.fontSize).disposed(by: dispose)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

extension UILabel{
    public var  fontSize:Binder<CGFloat>{
        return Binder(self){ label,fontSize in
            label.font = UIFont.systemFont(ofSize: fontSize)
        }
    }
}
