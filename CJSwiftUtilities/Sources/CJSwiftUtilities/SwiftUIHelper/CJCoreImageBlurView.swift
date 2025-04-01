//
//  File.swift
//  CJSwiftUtilities
//
//  Created by monster on 2025/4/1.
//

import SwiftUI
import CoreImage
import CoreImage.CIFilterBuiltins

public struct CJCoreImageBlurView: UIViewRepresentable {
    /// 模糊强度（0-100）
    @Binding var blurRadius: Float
    /// 原始图片
    @Binding var inputImage: UIImage?
    // 输出处理后的图片
    @Binding var outputImage: UIImage?
    
    public func makeUIView(context: Context) -> UIImageView {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }
    
    public func updateUIView(_ uiView: UIImageView, context: Context) {
        applyBlur(to: uiView, inputImage: inputImage, radius: blurRadius, context: context)
        
    }
    
    private func applyBlur(to imageView: UIImageView, inputImage: UIImage?, radius: Float, context: Context) {
        if let inputImage = inputImage {
            let ciImage = CIImage(image: inputImage)
            let blurFilter = CIFilter.gaussianBlur()
            blurFilter.inputImage = ciImage
            blurFilter.radius = blurRadius
            
            guard let outputCIImage = blurFilter.outputImage, let cgImage = context.coordinator.context.createCGImage(outputCIImage, from: outputCIImage.extent) else {
                imageView.image = inputImage
                outputImage = inputImage
                return
            }
            
            let processedImage = UIImage(cgImage: cgImage)
            imageView.image = processedImage
            outputImage = processedImage
        } else {
            imageView.image = inputImage
            outputImage = inputImage
        }
    }
    
    public func makeCoordinator() -> Coordinator {
        Coordinator()
    }
    
    public class Coordinator {
        let context = CIContext()
    }
}
