//
//  Array+Extension.swift
//  CJSwiftUtilities
//
//  Created by monster on 2025/4/7.
//

import Foundation

extension Array {
    
    /// 交换数组中指定位置的两个元素位置
    /// - Parameters:
    ///   - index: 需要交换的位置
    ///   - otherIndex: 另外一个需要交换的位置
    public mutating func cj_safeSwap(index: Index, otherIndex: Index) {
        guard index != otherIndex,
              startIndex..<endIndex ~= Index,
              startIndex..<endIndex ~= otherIndex else { return }
        swapAt(index, otherIndex)
    }
    
    /// 移除数组中所有重复的元素
    public mutating func cj_removeDuplicates() {
        reduce(into: [Element]()) {
            if !$0.contains(where: $1) {
                $0.append($1)
            }
        }
    }
    
    /// 获取索引元素
    public func cj_element(of index: Int) -> Element? {
        guard self.count <= index else { return nil }
        return self[index]
    }
}
