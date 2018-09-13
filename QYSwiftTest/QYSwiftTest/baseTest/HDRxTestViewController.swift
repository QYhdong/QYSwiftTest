
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
    var labelOther:UILabel!
    var myTableView:UITableView!
    var myViewModel:InfoViewModel!
    
    let dispose = DisposeBag()                      //回收
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.white
        
        label = UILabel()
        label.text = "晴天"
        view.addSubview(label)

        labelOther = UILabel()
        labelOther.text = ""
        view.addSubview(labelOther)
        
        label.snp.makeConstraints { (maker) in
            maker.top.equalTo(view).offset(30)
            maker.left.equalTo(view).offset(15)
        }
        
        labelOther.snp.makeConstraints { (maker) in
            maker.top.equalTo(label.snp.bottom).offset(20)
            maker.left.equalTo(label)
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
//                print(data)3
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
        observable.map {CGFloat($0)}.bind(to: label.rx.fontSize).disposed(by: dispose)
        observable.map {"当前索引数:\($0)"}.bind(to: labelOther.rx.text).disposed(by: dispose)
        
        setupUI()
        bindViewModel()
        
        subsTest()
        //
    }

    func setupUI(){
        //创建tableview
        let tableView = UITableView(frame: CGRect.zero, style: UITableViewStyle.plain)
        tableView.backgroundColor = UIColor.white
        tableView.register(MyCell.self, forCellReuseIdentifier: "MyCell")
        
        view.addSubview(tableView)
        tableView.snp.makeConstraints { (maker) in
            maker.edges.equalTo(view)
        }
        
        myViewModel = InfoViewModel()
        myTableView = tableView
    }
    
    func subsTest(){
        
        let ob = Observable<Any>.create { (anyObjec) -> Disposable in
            
            anyObjec.onNext("an apple a day keeps doctor away")
            
            anyObjec.onCompleted()
            
            return Disposables.create()
        }
        
        ob.subscribe(onNext: { (signal) in
            print(signal)
        }, onError: { (error) in
            print(error)
        }, onCompleted: {
            print("完成")
        }) {
            print("销毁")
        }.disposed(by: dispose)
        
        let btn = UIButton();
        btn.frame = CGRect(x: 100, y: 100, width: 100, height: 100)
        btn.backgroundColor = UIColor.gray
        view.addSubview(btn)
        
        btn.rx.controlEvent(.touchUpInside).subscribe(onNext: { (_) in
            print("被点击......")
            btn.tag += 1
            print("打印tag值->  \(btn.tag )")
        }, onError: { (error) in
            
        }, onCompleted: {
            
        }) {
            
        }.disposed(by: dispose)
        
    }
}
    //绑定ViewModel
    func bindViewModel(){
        
//        self.myViewModel.infoArr.bind(to: myTableView.rx.items(cellIdentifier: "MyCell")){
//               row, model, cell  in
//            cell.textLabel = "\(model.name)------\(model.age)"
//
//        }.disposed(by: dispose)
//
//        self.myViewModel.infoArr.bind(to: myTableView.rx.items(cellIdentifier: "MyCell")){
//            row, model, cell in
//            cell.textLabel = "\(model.name)------\(model.age)"
//        }.disposed(by: dispose)
//
//    }
    
}

extension Reactive where Base: UILabel{
    public var fontSize: Binder<CGFloat> { 
        return Binder(self.base){label,fontSize in
            label.font = UIFont.systemFont(ofSize: fontSize)
        }
    }
}

//cell
class MyCell: UITableViewCell {
    
    lazy var titileLabel:UILabel = UILabel()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super .init(style: style, reuseIdentifier: reuseIdentifier)
        
    }
    
//    lazy var titleLabel:UILabel = {
//        let labell = UILabel()
//        return labell
//    }()
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

//extension UILabel{
//    public var  fontSize:Binder<CGFloat>{
//        return Binder(self){ label,fontSize in
//            label.font = UIFont.systemFont(ofSize: fontSize)
//        }
//    }
//}

//模型
struct InfoModel {
    
    var name: String
    var age: Int

    //构造
    init(name:String , age:Int) {
        self.name = name
        self.age = age
    }
    
}

struct InfoViewModel {
    
    
    let infoArr = Observable.just(
        [
            InfoModel(name: "乔峰", age: 10),
            InfoModel(name: "虚竹", age: 12),
            InfoModel(name: "段誉", age: 15),
            InfoModel(name: "扫地僧", age: 25)
            
        ]
    )
    
}
