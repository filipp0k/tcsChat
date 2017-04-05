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
    @IBOutlet weak var ActivityIndicator: UIActivityIndicatorView!
    @IBAction func ButtonBlue(_ sender: Any) {
        TextViewAbout.textColor = UIColor.blue
    }
    @IBAction func ButtonBlack(_ sender: Any) {
        TextViewAbout.textColor = UIColor.black
    }
    @IBAction func ButtonOperation(_ sender: Any) {
     let operationQueue = OperationQueue()
        operationQueue.qualityOfService = .utility
        operationQueue.addOperation {
            self.ActivityIndicator.alpha = 1;
            self.userDefaults.set(self.TextFieldName.text, forKey: "Data");
            self.userDefaults.synchronize()
            
            self.present(self.alertController, animated: true, completion: nil)
            self.ActivityIndicator.alpha = 0;
        }
    }
    
    
    @IBAction func ButtonSave(_ sender: Any) {
        let gQueue = DispatchQueue.global(qos: .utility)
        gQueue.async{
            self.userDefaults.set(self.TextFieldName.text, forKey: "Data");
            self.userDefaults.synchronize()
            self.present(self.alertController, animated: true, completion: nil)
        }
        
        print("Сохранено")
        //performSegue(withIdentifier: "SaveButton", sender: self)
        // ААААА ПОЧЕМУ ОН ВСЕ РАВНО ПРОИСХОДИТ
    }
    
    var userDefaults = UserDefaults.standard;
    
    let alertController = UIAlertController(title: "Save done", message:
        "", preferredStyle: UIAlertControllerStyle.alert)
    //ААААА КАК ЕГО УБРАТЬ?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard)))
        
        self.TextFieldName.delegate = self
        TextFieldName.returnKeyType = UIReturnKeyType.done
        
        if self.userDefaults.value(forKey: "Data") != nil {
            TextFieldName.text = userDefaults.value(forKey: "Data") as? String
        }
        
        //let mainQueue = DispatchQueue.main
        
        
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

