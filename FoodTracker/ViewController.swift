//
//  ViewController.swift
//  FoodTracker
//
//  Created by Tifo Audi Alif Putra on 14/11/18.
//  Copyright © 2018 BCC FILKOM. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
    //Mark Properties
    @IBOutlet weak var nameMealLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var photoImageView: UIImageView!
    
    
    //Mark Actions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //handle the text field's user input through the delegate callbacks.
        nameTextField.delegate = self
    }
    
    @IBAction func setDefaultLabelText(_ sender: Any) {
        nameMealLabel.text = "Default Text"
    }
    
    
    @IBAction func selectImageFromLibrary(_ sender: UITapGestureRecognizer) {
        nameTextField.resignFirstResponder()
        let imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = .photoLibrary
        imagePickerController.delegate = self
        present(imagePickerController, animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        guard let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
            else {
                fatalError("Expected to be image, but provided by following \(info)")
        }
        
        photoImageView.image = selectedImage
        dismiss(animated: true, completion: nil)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //hide the keyboard
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        //called after resign first responder in textFieldShouldReturn's Method
        nameMealLabel.text = textField.text
    }


}

