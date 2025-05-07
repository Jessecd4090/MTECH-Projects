//
//  ImageExtension.swift
//  OrderApp
//
//  Created by Jestin Dorius on 5/7/25.
//
import UIKit

extension UIImage {
    func resized(to newSize: CGSize) -> UIImage? {
        guard newSize.width > 0, newSize.height > 0 else { return nil }
        
        let format = UIGraphicsImageRendererFormat()
        format.scale = self.scale
        let renderer = UIGraphicsImageRenderer(size: newSize, format: format)
        
        
        return renderer.image { _ in
            self.draw(in: CGRect(origin: .zero, size: newSize))
        }
    }
    func resized(width: CGFloat, height: CGFloat) -> UIImage? {
        resized(to: CGSize(width: width, height: height))
    }
}
