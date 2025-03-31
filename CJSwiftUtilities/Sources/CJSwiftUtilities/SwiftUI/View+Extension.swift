//
//  View+Extension.swift
//  CJSwiftUtilities
//
//  Created by monster on 2025/3/18.
//

import SwiftUI
import UIKit
import SwiftUIIntrospect

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
    public func cj_clipCorner(type: CJClipCornerWay) -> some View {
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
    
    /// 忽略安全区域
    /// - Parameter edges: 忽略哪些地方
    /// - Returns: 修改安全区域后的视图
    public func cj_ignoresSafeArea(_ edges: Edge.Set) -> some View {
        if #available(iOS 14.0, *) {
            return self.ignoresSafeArea(edges: edges)
        } else {
            return self.edgesIgnoringSafeArea(edges)
        }
    }
    
    public func cj_overlay<V>(alignment: Alignment = .center, @ViewBuilder content: () -> V) -> some View where V : View {
        if #available(iOS 15.0, *) {
            return self.overlay(alignment: alignment, content: content)
        } else {
            return self.overlay(content(), alignment: alignment)
        }
    }
    
    public func cj_navigationBackgroundColor(_ color: Color) -> some View {
        self.introspect(.viewController, on: .iOS(.v13, .v14, .v15, .v16, .v17)) { viewController in
            DispatchQueue.main.async {
                if #available(iOS 15.0, *) {
                    let apperance = UINavigationBarAppearance()
                    apperance.backgroundColor = UIColor(color)
                    viewController.navigationController?.navigationBar.standardAppearance = apperance
                    viewController.navigationController?.navigationBar.scrollEdgeAppearance = apperance
                } else {
                    viewController.navigationController?.navigationBar.barTintColor = color.cj_UIColor()
                }
            }
        }
    }
}


