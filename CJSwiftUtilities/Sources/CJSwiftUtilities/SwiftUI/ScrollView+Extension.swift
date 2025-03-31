//
//  File.swift
//  CJSwiftUtilities
//
//  Created by monster on 2025/3/31.
//

import SwiftUI
import SwiftUIIntrospect

extension ScrollView {
    /// 是否启用bounces
    @MainActor public func cj_bounces(need: Bool) -> some View {
        return self.introspect(.scrollView, on: .iOS(.v13, .v14, .v15, .v16, .v17, .v18)) { scrollView in
            scrollView.bounces = false
        }
    }
}
