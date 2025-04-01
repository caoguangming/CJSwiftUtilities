//
//  File.swift
//  CJSwiftUtilities
//
//  Created by monster on 2025/4/1.
//

import SwiftUI
import SwiftUIIntrospect
import UIKit

extension Slider {
    /// 修改Slider滑块颜色和大小
    /// - Parameters:
    ///   - color: 需要设置的滑块颜色(默认为白色)
    ///   - size: 需要设置的滑块大小（默认为30）
    @MainActor public func cj_thumbImage(color: UIColor = .white, size: CGFloat = 30) -> some View {
        self.introspect(.slider, on: .iOS(.v13, .v14, .v15, .v16, .v17, .v18)) { slider in
            let config = UIImage.SymbolConfiguration(pointSize: size)
            let thumbImage = UIImage(systemName: "moonphase.new.moon", withConfiguration: config)?.withTintColor(color)
            slider.setThumbImage(thumbImage, for: .normal)
        }
    }
}
