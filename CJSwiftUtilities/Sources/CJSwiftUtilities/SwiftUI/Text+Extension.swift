//
//  Text+Extension.swift
//  CJSwiftUtilities
//
//  Created by monster on 2025/3/18.
//

import SwiftUI

extension Text {
    
    /// 设置文字颜色
    /// - Parameter color: 文字的颜色
    /// - Returns: Text
    @available(iOS 13.0, macOS 10.15, *)
    nonisolated public func textColor(_ color: Color) -> Text {
        if #available(iOS 17.0, macOS 14.0, *) {
            return self.foregroundStyle(color)
        } else {
            return self.foregroundColor(color)
        }
    }
}
