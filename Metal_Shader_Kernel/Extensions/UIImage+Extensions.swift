//
//  UIImage+Extensions.swift
//  Metal_Shader_Kernel
//
//  Created by Sagar on 3/10/24.
//

import Foundation
import UIKit

extension UIImage {
    
    func asCIImage()-> CIImage? {
        if let ciImage = ciImage {
            return ciImage
        }
        guard let cgImage = cgImage else {
            return nil
        }
        return CIImage(cgImage: cgImage)
    }
}
