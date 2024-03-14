//
//  KernelManager.swift
//  Metal_Shader_Kernel
//
//  Created by Sagar on 3/10/24.
//

import UIKit

final class KernelManager {
    private init() {}
    
    static private let url = Bundle.main.url(forResource: "CustomFilterKernel.ci", withExtension: "metallib")
    
    static private var kernelData : Data? = {
        guard let url = url else {
            return nil
        }
        let data = try? Data(contentsOf: url)
        return data
    }()
    
    static var kernelForMakingLeftSideTransparent : CIKernel? = {
        guard let data = kernelData, let kernel = try? CIKernel(
          functionName: "makeLeftSideTransparent",
          fromMetalLibraryData: data) else {
          return nil
        }
        return kernel
    }()
}
