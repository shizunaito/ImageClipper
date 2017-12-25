//
//  ViewController.swift
//  ImageClipper
//
//  Created by shizuna.ito on 2017/08/04.
//  Copyright © 2017年 shizuna.ito. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

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
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            let pickerView = UIImagePickerController()
            pickerView.sourceType = .photoLibrary
            pickerView.delegate = self
            present(pickerView, animated: true)
        }
    }
    
    @IBAction func choiceFrameButtonClicked(_ sender: UIButton) {
    }
    
    @IBAction func clipButtonClicked(_ sender: UIButton) {
        guard let rootImage = image, let maskImage = maskImage else {
            return
        }
        clippedImageView.image = rootImage.mask(image: maskImage)

    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let selectedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        image = selectedImage
        clippedImageView.image = image
        self.dismiss(animated: true)
    }
}

