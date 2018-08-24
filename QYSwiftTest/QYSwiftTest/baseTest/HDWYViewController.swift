//
//  HDWYViewController.swift
//  QYSwiftTest
//
//  Created by HJddd on 2018/8/17.
//  Copyright © 2018年 HuangDong. All rights reserved.
//

import UIKit

class HDWYViewController: UIViewController {

    public var dataArr:NSMutableArray!
    
    public var viewControllerArray:NSMutableArray?                      //控制器类名
    public var viewControllerNameArray:NSMutableArray?            //名称
    
    fileprivate var lastSelectedIndex:Int!                   //上一次的标识
    fileprivate var selectedIndex:Int!                         //选中标识
    fileprivate let cellWidth:CGFloat = 54        //cell宽高
    
    fileprivate lazy var bottoLine:UIView = UIView() //底部红线

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataArr = ["分类","推荐","VIP","直播","小说","广播"]
        lastSelectedIndex = 0
        selectedIndex = 0
        
        //设置控制器
//        vcConfig()
        
        setupUI()
        
    }
    
//    private func vcConfig(){
//

//
//    guard let vcArr = viewControllerArray , let vcNameArr = viewControllerNameArray  else {return}
//
//    for (index , vcName) in vcArr.enumerated() {
//    let model = HDVcModel()
//    model.vcTitleName = vcNameArr[index] as? String
//    model.vcClassName = vcName as? String
//    dataArr.add(model)
//    }
//
//    }
    
    //界面布局
    private func setupUI(){
        
        self.automaticallyAdjustsScrollViewInsets = false
        view.backgroundColor = UIColor.white
        
        
        view.addSubview(titleCollectionView)
        titleCollectionView.snp.makeConstraints { (maker) in
            maker.top.equalTo(view).offset(30)
            maker.left.equalTo(view).offset(0)
            maker.right.equalTo(view).offset(0)
            maker.height.equalTo(60)
        }
        
        
        view.addSubview(bottoLine)
        bottoLine.backgroundColor = UIColor.red
        bottoLine.layer.cornerRadius = 2
        bottoLine.clipsToBounds = true
        bottoLine.snp.makeConstraints { (maker) in
            maker.bottom.equalTo(titleCollectionView.snp.bottom).offset(-5)
            maker.left.equalTo(view).offset(10)
            maker.height.equalTo(3)
            maker.width.equalTo(cellWidth-20)
        }
        
        view.addSubview(mainContentScrollView)
        mainContentScrollView.snp.makeConstraints { (maker) in
            maker.top.equalTo(titleCollectionView.snp.bottom)
            maker.left.right.equalTo(view)
            maker.bottom.equalTo(view)
        }
        
    }

    //MARK:--懒加载控件
    
    //顶部标签collection
    private lazy var titleCollectionView:UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: self.cellWidth, height: self.cellWidth)
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor.white
        collectionView.register(HDWYCollectionViewCell.self, forCellWithReuseIdentifier: "HDWYCollectionViewCell")
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        
        return  collectionView
        
    }()
    //管理所添加的控制器View
    private lazy var mainContentScrollView:UIScrollView = {
        let mainscrollView = UIScrollView()
        mainscrollView.isPagingEnabled = true
        mainscrollView.showsHorizontalScrollIndicator = false
        mainscrollView.delegate = self
        return mainscrollView
    }()
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

//MARK: -- collectionView数据源&代理方法
extension HDWYViewController:UICollectionViewDelegate,UICollectionViewDataSource{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HDWYCollectionViewCell", for: indexPath) as! HDWYCollectionViewCell
        
        let name = dataArr[indexPath.row] as! String
        cell.setCellWithString(name: name)
        
        if indexPath.row == selectedIndex{
            cell.changeFont(true)
        }else{
            cell.changeFont(false)
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        selectedIndex = indexPath.row

        let tempNum:CGFloat = CGFloat(abs(selectedIndex - lastSelectedIndex))
        
        print("打印当前\(selectedIndex)-------上一个\(lastSelectedIndex)")
        
        //动态更改布局
        UIView.animate(withDuration: 0.1, animations: {
            if self.selectedIndex > self.lastSelectedIndex{

                let x = self.bottoLine.frame.origin.x
                
                self.bottoLine.snp.updateConstraints({ (maker) in
                    maker.width.equalTo(self.bottoLine.bounds.size.width + self.cellWidth*tempNum-20)
                    maker.left.equalTo(self.view).offset(x)
                })
                self.view.layoutIfNeeded()
            }else{

                self.bottoLine.snp.updateConstraints({ (maker) in
                    maker.width.equalTo(self.bottoLine.bounds.size.width + self.cellWidth*tempNum-20)
                    maker.left.equalTo(self.view).offset(self.cellWidth*CGFloat(indexPath.row)+10)
                })
                self.view.layoutIfNeeded()
            }

        }) { (true) in

            UIView.animate(withDuration: 0.1, animations: {
                if self.selectedIndex > self.lastSelectedIndex{
       
                    self.bottoLine.snp.updateConstraints({ (maker) in
                        maker.width.equalTo(self.bottoLine.bounds.size.width + self.cellWidth*tempNum-20)
                        maker.left.equalTo(self.view).offset(self.cellWidth*CGFloat(indexPath.row)+10)
                    })
                    
                    self.view.layoutIfNeeded()
                }else{
                    self.bottoLine.snp.updateConstraints({ (maker) in
                        maker.left.equalTo(self.view).offset(self.cellWidth*CGFloat(indexPath.row)+10)
                    })
                    self.view.layoutIfNeeded()
                }
                self.bottoLine.snp.updateConstraints({ (maker) in
                    maker.width.equalTo(self.cellWidth-20)
                })
                    self.view.layoutIfNeeded()
            })

            
            self.lastSelectedIndex = self.selectedIndex
            print("坐标\(self.bottoLine.frame)")
        }

        collectionView.reloadData()
        
        
    }
}
//MARK: --  scrollView代理
extension HDWYViewController:UIScrollViewDelegate{
    
}

//MARK: -- HDWYCollectionViewCell类
class HDWYCollectionViewCell: UICollectionViewCell {

    private lazy var titleLabel:UILabel = UILabel()                             //标题
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    
    private func setupUI(){
        
        self.contentView.addSubview(titleLabel)
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont.boldSystemFont(ofSize: 13)
        titleLabel.snp.makeConstraints { (maker) in
            maker.edges.equalTo(self.contentView)
        }
        
    }
    
    fileprivate func setCellWithString(name:String){
        titleLabel.text = name
    }
    
    //动画改变字体状态
    fileprivate func changeFont(_ isSelected:Bool){
        
            if isSelected == true{
                self.titleLabel.textColor = UIColor.black
                let baseAnimation = CABasicAnimation(keyPath: "transform.scale")
                baseAnimation.fromValue = 1
                baseAnimation.toValue = 1.5
                baseAnimation.duration = 0.2
                baseAnimation.fillMode = kCAFillModeForwards
                baseAnimation.isRemovedOnCompletion = false
                self.titleLabel.layer.add(baseAnimation, forKey: "transform.scale")
                
            }else
            {
                self.titleLabel.textColor = UIColor.gray
            }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

//MARK: -- 子控制器模型类
class HDVcModel: NSObject {
    
    var vcClassName:String?
    var vcTitleName:String?
    
}
