//
//  CreateViewController.swift
//  TODO
//
//  Created by Hadi on 4/24/20.
//  Copyright © 2020 Hadi. All rights reserved.
//

import UIKit


protocol CreateViewControllerDelegate: class {
    func createViewControllerDidCancel(_ controller: CreateViewController)
    
    func createViewController(_ controller: CreateViewController,didFinishCreating item: Todo)
}

class CreateViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var save: UIBarButtonItem!
    @IBOutlet weak var titleTextField: UITextField!
    
    weak var delegate: CreateViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        titleTextField.becomeFirstResponder()
    }
    
    @IBAction func saveButton(_ sender: UIBarButtonItem) {
        
        let t = Todo(title: titleTextField.text, des: "", completed: false)
        
        delegate?.createViewController(self, didFinishCreating: t)
    }
    @IBAction func cancelButton(_ sender: UIBarButtonItem) {
        
        delegate?.createViewControllerDidCancel(self)
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
//        if textField.text!.count == 0 {
//            save.isEnabled = false
//        }else {
//            save.isEnabled = true
//        }
//
    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        save.isEnabled = false
        return true
    }
    
}
