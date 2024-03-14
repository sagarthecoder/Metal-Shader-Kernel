//
//  HomeViewController.swift
//  Metal_Shader_Kernel
//
//  Created by Sagar on 3/10/24.
//

import UIKit

class HomeViewController: UIViewController {

    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var outputImageView: UIImageView!
    var isFirstTimeLoaded = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        process()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        if isFirstTimeLoaded {
            isFirstTimeLoaded = false
            view.layoutIfNeeded()
        }
    }
    
    private func process() {
        guard let uiImage = UIImage(named: "nature"), let inputImage = uiImage.asCIImage() else {
            return
        }
        imageView.image = uiImage
        
        let arguments = [inputImage, 0.5] as [Any]
        let outputImage = KernelManager.kernelForMakingLeftSideTransparent?.apply(extent: inputImage.extent, roiCallback: { _, rect in
            return rect
        }, arguments: arguments)
        let shaderedImage = outputImage?.asUIImage()
        outputImageView.image = shaderedImage
    }

}
