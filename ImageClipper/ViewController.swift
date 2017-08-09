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
    
    let image = UIImage(named: "flowers.png")

    // マスク用画像
    let maskImage = UIImage(named:"ninjya.png")!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        clippedImageView.image = image

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func choiceImageButtonClicked(_ sender: UIButton) {
        
    }
    
    @IBAction func clipButtonClicked(_ sender: UIButton) {
        guard let rootImage = image else {
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

