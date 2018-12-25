//
//  HDFMDBManger.swift
//  QYSwiftTest
//
//  Created by HJddd on 2018/12/18.
//  Copyright © 2018年 HuangDong. All rights reserved.
//

import UIKit

class HDFMDBManger: NSObject {

    static let share = HDFMDBManger()
    var db:FMDatabase!
    var lock:NSLock!
    
    private lazy var resultArray = NSMutableArray()
    
    override init() {
        super.init()
        self.config()
    }
    //建表
    func config()  {
        let path = NSHomeDirectory().appendingFormat("/Documents/huangdong.db")
        lock = NSLock();
        db = FMDatabase(path: path)
        if db.open(){
            let createBookTable = "create table if not exists book(bookName text)"
            if db.executeUpdate(createBookTable, withArgumentsIn: []) == true{
            print("建表成功!")
            }
        }
    }
    
    //增
    func insertInfoTable(table:String, text:String) {
        let insertSql = "insert into \(table) (bookName) values (?)"
        if db.executeUpdate(insertSql, withArgumentsIn: [text]) == true{
            print("增加数据成功!")
        }else{
            
        }
    }
    //查
    func selectFromTable(table:String) -> NSMutableArray{
        
        resultArray.removeAllObjects()
        let selectQql = "select * from \(table)"
        let set:FMResultSet = db.executeQuery(selectQql, withArgumentsIn: [])!
        while set.next() == true {
            resultArray.add(set.string(forColumn: "bookName")!)
        }
        return resultArray
    }
    //清空列表
    func clearTable(table:String){
        let selectSql = "delete from \(table)"
        if db.executeUpdate(selectSql, withArgumentsIn: []) == true{
            print("清空列表成功!")
        }
    }
    
    
}
