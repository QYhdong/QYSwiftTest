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
    
    let cellWidth:CGFloat = 54        //cell宽高
    
    lazy var bottoLine:UIView = UIView() //底部红线
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lastSelectedIndex = 0
        selectedIndex = 0
        dataArr = ["分类","推荐","VIP","直播","小说","广播"]
        
        setupUI()
        
    }
    
    private func setupUI(){
        
        self.automaticallyAdjustsScrollViewInsets = false
        view.backgroundColor = UIColor.white
        
        
        view.addSubview(myCollectionView)
        myCollectionView.snp.makeConstraints { (maker) in
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
            maker.bottom.equalTo(myCollectionView.snp.bottom).offset(-5)
            maker.left.equalTo(view).offset(10)
            maker.height.equalTo(3)
            maker.width.equalTo(cellWidth-20)
        }
        
    }

    lazy var myCollectionView:UICollectionView = {
        
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
        titleLabel.font = UIFont.boldSystemFont(ofSize: 13)
        titleLabel.snp.makeConstraints { (maker) in
            maker.edges.equalTo(self.contentView)
        }
        
    }
    
    fileprivate func setCellWithString(name:String){
        titleLabel.text = name
    }
    
    
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


