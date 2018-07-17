# QYSwiftTest
Some swift daily exercises


        //1.函数返回包含多个返回值
        func testOne(numArr:[Int]) -> (one:Int , two:Int , three:Int){
        return (numArr[0],numArr[1],numArr[2])
    }
        let resultOne = testOne(numArr: [1,2,3])
        print("数字顺序\(resultOne.one).....\(resultOne.two).....\(resultOne.three)")
        
