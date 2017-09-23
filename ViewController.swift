//
//  ViewController.swift
//  pngtojpeg
//
//  Created by NibirMac on 9/15/17.
//  Copyright © 2017 NibirMac. All rights reserved.
//

import UIKit

// setting UIImage as global 
//var imageView: UIImageView = UIImageView()
var image:UIImage = UIImage(named: "")!
var convertImage:UIImage?

class ViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate{
    

    @IBOutlet weak var ImageView: UIImageView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func imageChoose(_ sender: Any) {
        
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        
        let actionSheet = UIAlertController(title: "Photo Source", message: "Choose a source", preferredStyle: .
            actionSheet)
        
       
        actionSheet.addAction(UIAlertAction(title: "Browse Device", style: .default, handler: { (action:UIAlertAction) in
            imagePickerController.sourceType = .photoLibrary
            self.present(imagePickerController, animated: true, completion: nil)
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler:nil))
            self.present(actionSheet, animated: true, completion: nil)
        }
   
    @IBAction func ImageConvertToPng(_ sender: Any) {
        print("something")
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info:[String: Any]) {
        
        if let image = info[UIImagePickerControllerEditedImage] as? UIImage {
            ImageView.image = image
            convertImage = image;
        }
        else if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            ImageView.image = image
            convertImage = image;
        } else{
            print("Something went wrong")
        }
        
        self.dismiss(animated: true, completion: nil)
      
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated:true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}


