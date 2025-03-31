//
//  NoHighlightButtonStyle.swift
//  CJSwiftUIExtensionModule
//
//  Created by 曹洸铭 on 2024/7/9.
//

import SwiftUI

/// 按钮无高亮状态样式
struct NoHighlightButtonStyle: ButtonStyle {
    public func makeBody(configuration: Configuration) -> some View {
        configuration.label.background(
            configuration.isPressed ? Color.clear : Color.clear
        )
    }
}
