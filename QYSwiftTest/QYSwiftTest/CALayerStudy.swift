//
//  CALayerStudy.swift
//  QYSwiftTest
//
//  Created by ddd on 17/8/11.
//  Copyright © 2017年 HuangDong. All rights reserved.
//

import UIKit

class CALayerStudy: NSObject {
    
    //CALayer与UIView是一个包含关系，但是其中又不完全是包含关系。
    //UIView是对CALayer以及Response的一些封装，使得它具有除了视图显示之外的其他属性。比如它的子类UIButton具有点击操作，UIView本身有GestureRecognizer的一些操作
    /*
     CAShapeLayer
     *渲染快速.CAShapeLayer使用了硬件加速，绘制同一图形会比用Core Graphics快很多
     *高效使用内存。一个CAShapeLayer不需要像普通CALayer一样创建一个寄宿图形，所以无论有多大，都不会占用太多的内存。
     *不会被图层边界剪裁掉。一个CAShapeLayer可以在边界之外绘制。你的图层路径不会像在使用Core Graphics的普通CALayer一样被裁剪掉
     *不会出现像素化。当你给CAShapeLayer做3D变换时，它不像一个有寄宿图的普通图层一样变得像素化
     */
    
    
    
}
