//
//  PersonalInfoEditTableViewController.swift
//  PersonalInformationApp
//
//  Created by 川崎 隆介 on 2015/11/26.
//  Copyright (c) 2015年 川崎 隆介. All rights reserved.
//

import UIKit



class PersonalInfoEditTableViewController: UITableViewController,UITextFieldDelegate {

    @IBOutlet weak var userNameField: UITextField!
    @IBOutlet weak var twitterIDField: UITextField!
    @IBOutlet weak var facebookField: UITextField!

    var personalInfo: Person?
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func configureView() {
        if let field = userNameField {
            field.text = personalInfo?.userName
        }
        if let field = twitterIDField {
            field.text = personalInfo?.twitterID
        }
        if let field = facebookField {
            field.text = personalInfo?.facebook
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "DoneInput" {
            if userNameField.text!.characters.count > 0
            || twitterIDField.text!.characters.count > 0
            || facebookField.text!.characters.count > 0  {
                if personalInfo == nil {
                    personalInfo = Person()
                }                
                personalInfo?.userName = userNameField.text!
                personalInfo?.twitterID = twitterIDField.text!
                personalInfo?.facebook = facebookField.text!
            }
        }
    }

}
