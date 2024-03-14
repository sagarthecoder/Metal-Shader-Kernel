//
//  CIImage+Extensions.swift
//  Metal_Shader_Kernel
//
//  Created by Sagar on 3/10/24.
//

import Foundation
import CoreImage
import UIKit

extension CIImage {
    
    func asUIImage()-> UIImage? {
        let uiImage = UIImage(ciImage: self)
        if(uiImage.size.width != .zero && uiImage.size.height != .zero) {
            return uiImage
        }
        let context = CIContext(options: nil)
        guard let cgImage = context.createCGImage(self, from: extent) else {
            return nil
        }
        return UIImage(cgImage: cgImage)
    }
}
