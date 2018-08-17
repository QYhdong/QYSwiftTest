//
//  HDWYViewController.swift
//  QYSwiftTest
//
//  Created by HJddd on 2018/8/17.
//  Copyright © 2018年 HuangDong. All rights reserved.
//

import UIKit

class HDWYViewController: UIViewController {

    var dataArr:NSArray!
    var lastSelectedIndex:Int!                   //上一次的标识
    var selectedIndex:Int!                         //选中标识
    
    lazy var bottoLine:UIView = UIView() //底部红线
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        lastSelectedIndex = 0
        selectedIndex = 0
        
        dataArr = ["分类","推荐","VIP","直播","小说","广播"]
        
        setupUI()
        
    }
    
    private func setupUI(){
        
        view.backgroundColor = UIColor.white
        
        view.addSubview(myCollectionView)
        
        myCollectionView.snp.makeConstraints { (maker) in
            maker.top.equalTo(view).offset(50)
            maker.left.equalTo(view).offset(0)
            maker.right.equalTo(view).offset(0)
            maker.height.equalTo(60)
        }
        
        
        bottoLine.backgroundColor = UIColor.red
        bottoLine.frame = CGRect(x: 0, y: self.myCollectionView.bounds.size.height + 100 , width: 50, height: 2)
        view.addSubview(bottoLine)
//        bottoLine.snp.makeConstraints { (maker) in
//            maker.bottom.equalTo(myCollectionView.snp.bottom).offset(-5)
//            maker.left.equalTo(myCollectionView).offset(0)
//            maker.height.equalTo(2)
//            maker.width.equalTo(50)
//        }
        
    }

    lazy var myCollectionView:UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.scrollDirection = .horizontal
    
        layout.itemSize = CGSize(width: 50, height: 50)
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 10, right: 0)
        
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor.white
        collectionView.register(HDWYCollectionViewCell.self, forCellWithReuseIdentifier: "HDWYCollectionViewCell")
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        
        return  collectionView
        
    }()
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

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
        
        UIView.animate(withDuration: 0.2, animations: {
            if self.selectedIndex > self.lastSelectedIndex{

                let x = self.bottoLine.frame.origin.x
                self.bottoLine.bounds.size.width = self.bottoLine.bounds.size.width + 50*tempNum
                self.bottoLine.frame.origin.x = x-25
//
//                self.bottoLine.snp.updateConstraints({ (maker) in
//                    maker.bottom.equalTo(self.myCollectionView.snp.bottom).offset(-5)
//                    maker.height.equalTo(2)
//                    maker.width.equalTo(self.bottoLine.bounds.size.width + 50*tempNum)
//                })

            }else{
                self.bottoLine.bounds.size.width = self.bottoLine.bounds.size.width + 50*tempNum
                self.bottoLine.frame.origin.x = CGFloat(50*indexPath.row)
            }

        }) { (true) in

            UIView.animate(withDuration: 0.1, animations: {
                if self.selectedIndex > self.lastSelectedIndex{
//                self.bottoLine.frame.origin.x = CGFloat(50*indexPath.row)
//                    self.bottoLine.snp.updateConstraints({ (maker) in
//                        maker.left.equalTo(self.myCollectionView).offset(50*indexPath.row)
//                        maker.width.equalTo(50)
//                    })
//                    self.bottoLine.frame = CGRect(x: CGFloat(50*indexPath.row), y: self.myCollectionView.bounds.size.height + 50 , width: 50, height: 2)
                      self.bottoLine.frame.origin.x = CGFloat(50*indexPath.row)
                }else{

                self.bottoLine.frame.origin.x = CGFloat(50*indexPath.row)
                }
                self.bottoLine.bounds.size.width = 50

            })

            self.lastSelectedIndex = self.selectedIndex
            print("坐标\(self.bottoLine.frame)")
        }
//        self.bottoLine.layoutIfNeeded()

        
//        let bezier = UIBezierPath()
//        bezier.lineWidth = 2
//        bezier.move(to: CGPoint(x: self.bottoLine.bounds.size.width, y: 0))
//        bezier.addLine(to: CGPoint(x: self.bottoLine.bounds.size.width+50, y: 0))
//        bezier.addLine(to: CGPoint(x: self.bottoLine.bounds.size.width+30, y: 0))
//
//        //图层
//        let aaaLayer = CAShapeLayer()
//        aaaLayer.path = bezier.cgPath
//        aaaLayer.frame = self.bottoLine.layer.bounds
//        aaaLayer.strokeColor = UIColor.red.cgColor
//        aaaLayer.lineWidth = 2
//        aaaLayer.fillColor = nil
//        aaaLayer.lineJoin = kCALineJoinBevel
//        self.bottoLine.layer.addSublayer(aaaLayer)
//
//        //执行动画
//        let pathAnimation = CABasicAnimation(keyPath: "strokeEnd")
//        pathAnimation.duration = 0.5
//        pathAnimation.fromValue = NSNumber(value: 0)
//        pathAnimation.toValue = NSNumber(value: 1)
//
//        aaaLayer.add(pathAnimation, forKey: "strokeEnd")
        
//        collectionView.reloadData()
        
        
    }
}

class HDWYCollectionViewCell: UICollectionViewCell {
    
    lazy var titleLabel:UILabel = UILabel()
    lazy var bottomLineView:UIView = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    private func setupUI(){
        
        self.contentView.addSubview(titleLabel)
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont.boldSystemFont(ofSize: 15)
        titleLabel.snp.makeConstraints { (maker) in
            maker.edges.equalTo(self.contentView)
        }
        
//        bottomLineView.backgroundColor = UIColor.red
//        self.contentView.addSubview(bottomLineView)
//        bottomLineView.isHidden = true
//
//        bottomLineView.snp.makeConstraints { (maker) in
//            maker.bottom.equalTo(self.contentView)
//            maker.height.equalTo(2)
//            maker.width.equalTo(35)
//            maker.centerX.equalTo(titleLabel)
//        }
        
    }
    
    fileprivate func setCellWithString(name:String){
        titleLabel.text = name
    }
    
    
    fileprivate func changeFont(_ isSelected:Bool){
//        self.titleLabel.font = UIFont.boldSystemFont(ofSize: font)
        
            if isSelected == true{
                self.titleLabel.textColor = UIColor.black
                let baseAnimation = CABasicAnimation(keyPath: "transform.scale")
                baseAnimation.fromValue = 1
                baseAnimation.toValue = 1.2
                baseAnimation.duration = 0.3
                baseAnimation.fillMode = kCAFillModeForwards
                baseAnimation.isRemovedOnCompletion = false
                self.titleLabel.layer.add(baseAnimation, forKey: "transform.scale")
                
                
//                UIView.animate(withDuration: 0.7) {
//                    self.bottomLineView.isHidden = false
//                    self.bottomLineView.layoutIfNeeded()
//                }
            }else
            {
                self.titleLabel.textColor = UIColor.gray
//                self.bottomLineView.isHidden = true
            }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


