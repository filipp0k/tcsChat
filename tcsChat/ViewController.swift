//
//  ViewController.swift
//  tcsChat
//
//  Created by Филипп Дюдин on 05.03.17.
//  Copyright © 2017 Филипп Дюдин. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var TextFieldName: UITextField!
    
    @IBOutlet weak var TextViewAbout: UITextView!
    @IBAction func ButtonRed(_ sender: Any) {
        TextViewAbout.textColor = UIColor.red
    }
    @IBAction func ButtonPurple(_ sender: Any) {
        TextViewAbout.textColor = UIColor.purple
    }
    @IBAction func ButtonGreen(_ sender: Any) {
        TextViewAbout.textColor = UIColor.green
    }
    @IBAction func ButtonBlue(_ sender: Any) {
        TextViewAbout.textColor = UIColor.blue
    }
    @IBAction func ButtonBlack(_ sender: Any) {
        TextViewAbout.textColor = UIColor.black
    }
    @IBAction func ButtonSave(_ sender: Any) {
        print("Сохранено")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard)))
        
        self.TextFieldName.delegate = self
        //зачем это сверху нужно?
        TextFieldName.returnKeyType = UIReturnKeyType.done
        
       // var textColor: UIColor;
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Почему так нельзя?TextFieldName.endEiditing(true)
        self.view.endEditing(true)
        return false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

