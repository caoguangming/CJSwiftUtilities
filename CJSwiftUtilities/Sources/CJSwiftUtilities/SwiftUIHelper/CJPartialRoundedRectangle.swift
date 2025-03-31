//
//  File.swift
//  CJSwiftUtilities
//
//  Created by monster on 2025/3/31.
//

import SwiftUI

struct CJPartialRoundedRectangle: Shape {
    let topLeft: CGFloat
    let topRight: CGFloat
    let bottomLeft: CGFloat
    let bottomRight: CGFloat
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        let width = rect.size.width
        let height = rect.size.height
        
        path.move(to: CGPoint(x: 0, y: topLeft))
        path.addArc(
            center: CGPoint(x: topLeft, y: topLeft),
            radius: topLeft,
            startAngle: .degrees(180),
            endAngle: .degrees(270),
            clockwise: false)
        
        path.addLine(to: CGPoint(x: width - topRight, y: 0))
        path.addArc(
            center: CGPoint(x: width - topRight, y: topRight),
            radius: topRight,
            startAngle: .degrees(270),
            endAngle: .degrees(0),
            clockwise: false)
        
        // 右侧直线
        path.addLine(to: CGPoint(x: width, y: height - bottomRight))
        // 右下角圆角
        path.addArc(
            center: CGPoint(x: width - bottomRight, y: height - bottomRight),
            radius: bottomRight,
            startAngle: .degrees(0),
            endAngle: .degrees(90),
            clockwise: false
        )
        
        // 底部直线
        path.addLine(to: CGPoint(x: bottomLeft, y: height))
        // 左下角圆角
        path.addArc(
            center: CGPoint(x: bottomLeft, y: height - bottomLeft),
            radius: bottomLeft,
            startAngle: .degrees(90),
            endAngle: .degrees(180),
            clockwise: false
        )
        
        path.closeSubpath()
        return path
    }
}
