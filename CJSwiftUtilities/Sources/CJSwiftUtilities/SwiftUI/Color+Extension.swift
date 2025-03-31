//
//  Color+Extension.swift
//  CJSwiftUtilities
//
//  Created by monster on 2025/3/18.
//

import SwiftUI

extension Color {
    /// 通过16进制字符串生成颜色
    /// - Parameter hex: 16进制字符串
    public init(hex: String) {
        let hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines).replacingOccurrences(of: "#", with: "")
        var rgb: UInt64 = 0
        Scanner(string: hexSanitized).scanHexInt64(&rgb)
        
        let red = Double((rgb & 0xFF0000) >> 16) / 255.0
        let green = Double((rgb & 0x00FF00) >> 8) / 255.0
        let blue = Double(rgb & 0x0000FF) / 255.0
        
        self.init(red: red, green: green, blue: blue)
    }
    
    public init(R: Int, G: Int, B: Int, A: CGFloat = 1) {
        self.init(red: Double(R) / 255.0, green: Double(G) / 255.0, blue: Double(B) / 255.0, opacity: Double(A))
    }
    
    /// 将Color转化成UIColor
    public func cj_UIColor() -> UIColor {
        if #available(iOS 14.0, *) {
            return UIColor(self)
        } else {
            // iOS 13 的回退方案
            let scanner = Scanner(string: self.description.trimmingCharacters(in: CharacterSet.alphanumerics.inverted))
            var hexNumber: UInt64 = 0
            var r: CGFloat = 0.0, g: CGFloat = 0.0, b: CGFloat = 0.0, a: CGFloat = 0.0
            
            let result = scanner.scanHexInt64(&hexNumber)
            if result {
                r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
                g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
                b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
                a = CGFloat(hexNumber & 0x000000ff) / 255
            }
            return UIColor(red: r, green: g, blue: b, alpha: a)
        }
    }
}
