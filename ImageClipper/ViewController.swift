//
//  ViewController.swift
//  ImageClipper
//
//  Created by shizuna.ito on 2017/08/04.
//  Copyright © 2017年 shizuna.ito. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var clippedImageView: UIImageView!
    
    var image: UIImage?
    var maskImage: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func choiceImageButtonClicked(_ sender: UIButton) {
        clippedImageView.image = image
    }
    
    @IBAction func choiceFrameButtonClicked(_ sender: UIButton) {
    }
    
    @IBAction func clipButtonClicked(_ sender: UIButton) {
        guard let rootImage = image, let maskImage = maskImage else {
            return
        }
        clippedImageView.image = rootImage.mask(image: maskImage)

    }
}

extension UIImage {
    func mask(image: UIImage?) -> UIImage {
        if let maskRef = image?.cgImage,
            let ref = cgImage,
            let mask = CGImage(maskWidth: maskRef.width,
                               height: maskRef.height,
                               bitsPerComponent: maskRef.bitsPerComponent,
                               bitsPerPixel: maskRef.bitsPerPixel,
                               bytesPerRow: maskRef.bytesPerRow,
                               provider: maskRef.dataProvider!,
                               decode: nil,
                               shouldInterpolate: false),
            let output = ref.masking(mask) {
            return UIImage(cgImage: output)
        }
        return self
    }
}

