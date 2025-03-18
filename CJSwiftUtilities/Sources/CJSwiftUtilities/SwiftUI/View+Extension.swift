//
//  View+Extension.swift
//  CJSwiftUtilities
//
//  Created by monster on 2025/3/18.
//

import SwiftUI


/// 裁剪圆角方式
public enum CJClipCornerWay {
    /// 圆形
    case Circle
    /// 所有的角
    case All(cornerRadius: CGFloat)
    /// 指定角的度数
    case Custom(topLeft: CGFloat, topRight: CGFloat, bottomLeft: CGFloat, bottomRight: CGFloat)
}

extension View {
    
    /// 裁剪圆角
    /// - Parameter type: 裁剪方式
    /// - Returns: 裁剪后的视图
    @available(iOS 13.0, macOS 10.15, *)
    public func clipCorner(type: CJClipCornerWay) -> some View {
        Group {
            switch type {
            case .Circle:
                self.clipShape(Circle())
            case .All(let cornerRadius):
                self.clipShape(RoundedRectangle(cornerRadius: cornerRadius))
            case .Custom(let topLeft, let topRight, let bottomLeft, let bottomRight):
                self.clipShape(CJPartialRoundedRectangle(topLeft: topLeft, topRight: topRight, bottomLeft: bottomLeft, bottomRight: bottomRight))
            }
        }
    }
}

struct CJPartialRoundedRectangle: Shape {
    let topLeft: CGFloat
    let topRight: CGFloat
    let bottomLeft: CGFloat
    let bottomRight: CGFloat
    
    public func path(in rect: CGRect) -> Path {
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
