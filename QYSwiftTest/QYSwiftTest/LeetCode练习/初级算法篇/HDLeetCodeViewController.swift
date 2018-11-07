//
//  HDLeetCodeViewController.swift
//  QYSwiftTest
//
//  Created by HJddd on 2018/9/5.
//  Copyright © 2018年 HuangDong. All rights reserved.
//

import UIKit

class HDLeetCodeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.white
        
//        //两数之和
//        let result = twoSumOther([2,6,11,15,7], 9)
//        print("两数之和的下标---\(result)")
//
//        //加一
//        let oneResult = plusOne([2,3,4,5,6,2,9,5,9,9])
////        let oneResult = plusOne([9,9,9])
//        print("加一后的数组\(oneResult)")
//
//        //移动零
//        var zeroArr = [0,1,2,3,2,5,6,7,0,1,0,1]
//        moveZeroes(&zeroArr)
//
//        //翻转字符串
//        let twoResult = reverseString("abcdefg,abc")
//        print("翻转后的字符串\(twoResult)")
//
//        //从排序数组中删除重复项
//        var duplicates = [0,0,1,1,1,2,2,3,3,4]
//        let threeResult = removeDuplicates(&duplicates)
//        print("打印个数\(threeResult)")
//
//        //旋转数组
//        var numArr = [1,2,3,4,5,6,7,8,9]
//        rotate(&numArr, 1)
//
//        //存在重复
//        let fourResult = containsDuplicate([3,1])
//        print("打印结果\(fourResult)")
        
//        //只出现一次
//        let fiveResult = singleNumber([2,2,1,3,3,5,7,6,5,7,6])
//        print("只出现一次打印结果\(fiveResult)")
        
//        //旋转
//        var arr = [[1,2,3],[4,5,6],[7,8,9]]
//        rotate(&arr)
        //数独
        let suduArr = [
            ["5","3",".",".","7",".",".",".","."],
            ["6",".",".","1","9","5",".",".","."],
            [".","9","8",".",".",".",".","6","."],
            ["8",".",".",".","6",".",".",".","3"],
            ["4",".",".","8",".","3",".",".","1"],
            ["7",".",".",".","2",".",".",".","6"],
            [".","6",".",".",".",".","2","8","."],
            [".",".",".","4","1","9",".",".","5"],
            [".",".",".",".","8",".",".","7","9"]
        ]
        let suduResult = isValidSudoku(suduArr)
        print("是否为有效的数独:\(suduResult)")
    }
    
    //点击屏幕打印数据
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        //旋转
//        var arr = [[1,2,3],[4,5,6],[7,8,9]]
//        rotate(&arr)
        //数独
        let suduArr = [
            ["5","3",".",".","7",".",".",".","."],
            ["6",".",".","1","9","5",".",".","."],
            [".","9","8",".",".",".",".","6","."],
            ["8",".",".",".","6",".",".",".","3"],
            ["4",".",".","8",".","3",".",".","1"],
            ["7",".",".",".","2",".",".",".","6"],
            [".","6",".",".",".",".","2","8","."],
            [".",".",".","4","1","9",".",".","5"],
            [".",".",".",".","8",".",".","7","9"]
        ]
        
        let aaa = [["5","3",".",".","7",".",".",".","."],["6",".",".","1","9","5",".",".","."],[".","9","8",".",".",".",".","6","."],["8",".",".",".","6",".",".",".","3"],["4",".",".","8",".","3",".",".","1"],["7",".",".",".","2",".",".",".","6"],[".","6",".",".",".",".","2","8","."],[".",".",".","4","1","9",".",".","5"],[".",".",".",".","8",".",".","7","9"]]
        let suduResult = isValidSudoku(aaa)
        print("是否为有效的数独:\(suduResult)")
    }
    
    
//数组 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    
    // 1. 两数之和 ===============================================================================================================
    /*
     给定一个整数数组和一个目标值，找出数组中和为目标值的两个数。
     
     你可以假设每个输入只对应一种答案，且同样的元素不能被重复利用。
     
     示例:
     
     给定 nums = [2, 7, 11, 15], target = 9
     
     因为 nums[0] + nums[1] = 2 + 7 = 9
     所以返回 [0, 1]
  */

    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        //循环对比前后两数之和
        for i in 0..<nums.count{
            for j in (i+1)..<nums.count{
                if nums[i] + nums[j] == target{
                    return [i,j]
                }
            }
        }
//        guard let tempArr = temp else{return}
        return []
    }

    //哈希表
    func twoSumOther(_ nums: [Int], _ target: Int) -> [Int] {

//        var numDic:[Int:Int] = Dictionary()
//        for(i,num) in nums.enumerated(){
//            numDic[i] = num
//        }
//
//        for j in 0..<nums.count{
//            let otherNum = target - nums[j]
//            for k in 0..<nums.count{
//                if numDic[k] == otherNum{
//                    return [j,k]
//                }
//            }
//
//        }
        
            var numDic:[Int:Int] = Dictionary()
            for(i,num) in nums.enumerated(){
                numDic[num] = i
            }
            for j in 0..<nums.count{
              let otherNum = target - nums[j]
                guard let index = numDic[otherNum] else{
                    return []
                }
                return [j,index]
            }
        
        return []
    }
    //加一  =======================================================================================================================
    /*
     给定一个由整数组成的非空数组所表示的非负整数，在该数的基础上加一。
     
     最高位数字存放在数组的首位， 数组中每个元素只存储一个数字。
     
     你可以假设除了整数 0 之外，这个整数不会以零开头。
     
     示例 1:
     
     输入: [1,2,3]
     输出: [1,2,4]
     解释: 输入数组表示数字 123。
     示例 2:
     
     输入: [4,3,2,1]
     输出: [4,3,2,2]
     解释: 输入数组表示数字 4321。
     */

    func plusOne(_ digits: [Int]) -> [Int] {
        
        var tempArr = digits
        
        var stopNum:Int
        
        let lastIndex = digits.count-1
        for i in 0..<digits.count{
            
            stopNum = lastIndex-i
            
            if digits[stopNum] == 9{
                if stopNum == 0 && tempArr[0]==9{
                    tempArr = tempArr.map { (num:Int) -> Int in
                        return 0
                    }
                    tempArr.insert(1, at: 0)
                }
                continue
            }else{
                tempArr[stopNum] = tempArr[stopNum]+1
                for num in stopNum+1 ..< digits.count{
                    tempArr[num] = 0
                }
                break
            }
        }
        return tempArr
    }
    
    //移动零 =======================================================================================================================
    /*
     给定一个数组 nums，编写一个函数将所有 0 移动到数组的末尾，同时保持非零元素的相对顺序。
     
     示例:
     
     输入: [0,1,0,3,12]
     输出: [1,3,12,0,0]
     说明:
     
     必须在原数组上操作，不能拷贝额外的数组。
     尽量减少操作次数。
     */
    
    func moveZeroes(_ nums: inout [Int]) {
     
        for i in 0..<nums.count{
            for j in 0..<nums.count-1-i{
                if nums[j] == 0{
                    let tempNum = nums[j+1]
                    nums[j+1] = nums[j]
                    nums[j] = tempNum
                }
            }
        }
        
        print("打印移动零之后的数组\(nums)")
    }
    
    //从排序数组中删除重复项 =====================================================================================================
    /*
     给定一个排序数组，你需要在原地删除重复出现的元素，使得每个元素只出现一次，返回移除后数组的新长度。
     不要使用额外的数组空间，你必须在原地修改输入数组并在使用 O(1) 额外空间的条件下完成。

     示例 1:
     给定数组 nums = [1,1,2],
     函数应该返回新的长度 2, 并且原数组 nums 的前两个元素被修改为 1, 2。
     你不需要考虑数组中超出新长度后面的元素。
     示例 2:
     给定 nums = [0,0,1,1,1,2,2,3,3,4],
     函数应该返回新的长度 5, 并且原数组 nums 的前五个元素被修改为 0, 1, 2, 3, 4。
     你不需要考虑数组中超出新长度后面的元素。
     
     说明:
     为什么返回数值是整数，但输出的答案是数组呢?
     请注意，输入数组是以“引用”方式传递的，这意味着在函数里修改输入数组对于调用者是可见的。
     你可以想象内部操作如下:
     // nums 是以“引用”方式传递的。也就是说，不对实参做任何拷贝
     int len = removeDuplicates(nums);
     // 在函数里修改输入数组对于调用者是可见的。
     // 根据你的函数返回的长度, 它会打印出数组中该长度范围内的所有元素。
     for (int i = 0; i < len; i++) {
     print(nums[i]);
     }
     */
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        
        if nums.count == 0 || nums.count == 1{
            return nums.count
        }
        
        var tempNum = 0
        //相同时不做操作
        for i in 0..<nums.count{
            if nums[i] != nums[tempNum]{
                
                tempNum += 1
                nums[tempNum] = nums[i]
                
            }
        }
        let resultSize = tempNum+1
        for i in 0..<resultSize{
                print(nums[i])
        }
        return resultSize
    }
    
    //旋转数组===================================================================================================================
    /*
     给定一个数组，将数组中的元素向右移动 k 个位置，其中 k 是非负数。
     
     示例 1:
     
     输入: [1,2,3,4,5,6,7] 和 k = 3
     输出: [5,6,7,1,2,3,4]
     解释:
     向右旋转 1 步: [7,1,2,3,4,5,6]
     向右旋转 2 步: [6,7,1,2,3,4,5]
     向右旋转 3 步: [5,6,7,1,2,3,4]
     示例 2:
     
     输入: [-1,-100,3,99] 和 k = 2
     输出: [3,99,-1,-100]
     解释:
     向右旋转 1 步: [99,-1,-100,3]
     向右旋转 2 步: [3,99,-1,-100]
     说明:
     
     尽可能想出更多的解决方案，至少有三种不同的方法可以解决这个问题。
     要求使用空间复杂度为 O(1) 的原地算法。
     */
    func rotate(_ nums: inout [Int], _ k: Int) {
        
        if nums.count == 0 || nums.count == 1{
            return
        }
//        var tempNum = 0
        for _ in 0..<k {
            nums.insert(nums[nums.count-1], at: 0)
            nums.remove(at: nums.count-1)
//            tempNum += 1
        }
        
        print("打印旋转数组\(nums)")
    }
    
    //存在重复===============================================================================================================
    /*
     给定一个整数数组，判断是否存在重复元素。
     
     如果任何值在数组中出现至少两次，函数返回 true。如果数组中每个元素都不相同，则返回 false。
     
     示例 1:
     
     输入: [1,2,3,1]
     输出: true
     示例 2:
     
     输入: [1,2,3,4]
     输出: false
     示例 3:
     
     输入: [1,1,1,3,3,4,3,2,4,2]
     输出: true
     */
    
    func containsDuplicate(_ nums: [Int]) -> Bool {
//
//        if nums.count < 2{
//            return false
//        }
//        let tempNums = nums.sorted()
//        for i in 0..<tempNums.count-1 {
//            if tempNums[i] == tempNums[i + 1]{
//                return true
//            }
//
//        }
//
//        return false
        
        let set = Set(nums)
        return set.count != nums.count
    }
    
    //两个数组的交集 II==========================================================================================================
    /*
     给定两个数组，编写一个函数来计算它们的交集。
     
     示例 1:
     
     输入: nums1 = [1,2,2,1], nums2 = [2,2]
     输出: [2,2]
     示例 2:
     
     输入: nums1 = [4,9,5], nums2 = [9,4,9,8,4]
     输出: [4,9]
     说明：
     
     输出结果中每个元素出现的次数，应与元素在两个数组中出现的次数一致。
     我们可以不考虑输出结果的顺序。
     进阶:
     
     如果给定的数组已经排好序呢？你将如何优化你的算法？
     如果 nums1 的大小比 nums2 小很多，哪种方法更优？
     如果 nums2 的元素存储在磁盘上，磁盘内存是有限的，并且你不能一次加载所有的元素到内存中，你该怎么办？
     */
    
    func intersect(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        
        var tempNumArr:[Int] = []
        var tempArr:[Int] = []
        
        for i in 0..<nums1.count {
            for num2 in nums2{
                
            }
        }
        
        return tempNumArr
    }
    
    //只出现一次的数字===========================================================================================================
    /*
     给定一个非空整数数组，除了某个元素只出现一次以外，其余每个元素均出现两次。找出那个只出现了一次的元素。
     
     说明：
     
     你的算法应该具有线性时间复杂度。 你可以不使用额外空间来实现吗？
     
     示例 1:
     
     输入: [2,2,1]
     输出: 1
     示例 2:
     
     输入: [4,1,2,1,2]
     输出: 4
     */
    func singleNumber(_ nums: [Int]) -> Int {
        

//    var tempNumArr = nums
//    let tempArr = NSMutableArray()
//    for i in 0..<nums.count{
//        let tempNum = tempNumArr[i]
//        tempArr.add(tempNum)
//        tempNumArr.remove(at: i)
//        if tempNumArr.count == 2{
//            if tempArr.contains(tempNumArr[0]){
//                return tempNumArr[1]
//            }else{
//                return tempNumArr[0]
//            }
//        }
        
//        if tempNumArr.contains(tempNum) == false{
//            return tempNum
//        }
        
//    }
        var single = 0
        nums.forEach { (num) in
            
            single = single ^ num
        }
        
        return single

    }

    
    //旋转图像
    /*
     给定一个 n × n 的二维矩阵表示一个图像。
     将图像顺时针旋转 90 度。
     
     说明：
     你必须在原地旋转图像，这意味着你需要直接修改输入的二维矩阵。请不要使用另一个矩阵来旋转图像。
     示例 1:
     给定 matrix =
     [
     [1,2,3],
     [4,5,6],
     [7,8,9]
     ],
     原地旋转输入矩阵，使其变为:
     [
     [7,4,1],
     [8,5,2],
     [9,6,3]
     ]
  */
    func rotate(_ matrix: inout [[Int]]) {
        for i in 0..<matrix.count{
            for j in 0..<matrix.count{
                matrix[i].append(matrix[j][i])
            }

        }
        
        for i in 0..<matrix.count {
            for _ in 0..<matrix.count{
                matrix[i].remove(at: 0)
            }
            matrix[i].reverse()
        }

        print("打印旋转数组\(matrix)")
    }
    
    //有效的数独
    /*
     判断一个 9x9 的数独是否有效。只需要根据以下规则，验证已经填入的数字是否有效即可。
     
     数字 1-9 在每一行只能出现一次。
     数字 1-9 在每一列只能出现一次。
     数字 1-9 在每一个以粗实线分隔的 3x3 宫内只能出现一次。
  */
    func isValidSudoku(_ board: [[String]]) -> Bool {
        
        
        for i in 0..<board.count{
            
            var rowSet = Set<String>()
            
            let rowArr = NSMutableArray()
            for num in board[i]{
                if num != "."{
                    rowArr.add(num)
                    rowSet.insert(num)
                }
            }
            
            
            
            if rowSet.count != rowArr.count{
                return false
            }
            var tempArr = Array<String>()
            var tempSet = Set<String>()
            for j in 0..<board.count{
                if board[j][i] != "."{
                    tempArr.append(board[j][i])
                    tempSet.insert(board[j][i])
                }
            }
//            let tempSet = Set(arrayLiteral: tempArr)
            if tempSet.count != tempArr.count{
                return false
            }
            tempArr.removeAll()
        }
        
        let arr = NSMutableArray()
        //九宫格
        for i in 0..<3{
            for j in 0..<3{
                arr.removeAllObjects()
                let row = i*3
                let col = j*3
                for x in row..<(row+3){
                    for y in col..<(col+3){
                        let temp = board[x][y]
                        if temp != "."{
                            if arr.contains(temp){
                                return false
                            }else{
                                arr.add(temp)
                            }
                        }
                    }
                }
            }
        }
        
        return true
    }
   // =======================================================================================================================

    func bubbleSort(nums:[Int]) -> [Int]{
        var mutableArr = nums
        for i in 0..<mutableArr.count-1{
            for j in 0..<mutableArr.count-1-i{
                if mutableArr[j]>mutableArr[j+1]{
                    let tempNum = mutableArr[j+1]
                    mutableArr[j+1] = mutableArr[j]
                    mutableArr[j] = tempNum
                }
            }
        }
        return mutableArr
    }
    
//字符串 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    
   //反转字符串 ===============================================================================================================
    /*
     编写一个函数，其作用是将输入的字符串反转过来。
     
     示例 1:
     
     输入: "hello"
     输出: "olleh"
     示例 2:
     
     输入: "A man, a plan, a canal: Panama"
     输出: "amanaP :lanac a ,nalp a ,nam A"
     */
    func reverseString(_ s: String) -> String {
//        var tempStr:String = ""
//        for i in 0..<s.count{
//            tempStr.append(s.s)
//        }
        let result = String(s.reversed())
        return result
    }
}
