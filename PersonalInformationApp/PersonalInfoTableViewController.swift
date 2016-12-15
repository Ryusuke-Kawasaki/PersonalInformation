
//
//  PersonalInfoTableViewController.swift
//  PersonalInformationApp
//
//  Created by 川崎 隆介 on 2015/11/26.
//  Copyright (c) 2015年 川崎 隆介. All rights reserved.
//

import UIKit

class PersonalInfoTableViewController: UITableViewController {

    let personalInfoService = PersonalInfoService()
    
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var twitterIDLabel: UILabel!
    @IBOutlet weak var facebookLabel: UILabel!
    
    @IBAction func done(_ segue:UIStoryboardSegue){
        if segue.identifier == "DoneInput" {
            if let info = (segue.source as! PersonalInfoEditTableViewController).personalInfo {
                personalInfoService.personalInfo = info
                configureView()
            }
        }
        self.dismiss(animated: true, completion: nil    )
    }
    
    @IBAction func cancel(_ segue:UIStoryboardSegue){
        self.dismiss(animated: true, completion: nil)        
    }

    func configureView() {
        if let info = personalInfoService.personalInfo {
            if info.userName.characters.count > 0 {
                userNameLabel.text = info.userName
            }else {
                userNameLabel.text = "NoData"
            }
            if info.twitterID.characters.count > 0 {
                twitterIDLabel.text = info.twitterID
            }else {
                twitterIDLabel.text = "NoData"
            }
            if info.facebook.characters.count > 0 {
                facebookLabel.text = info.facebook
            }else {
                facebookLabel.text = "NoData"
            }
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
    
    // MARK: - Navigation
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            let navController = segue.destination as! UINavigationController
            (navController.topViewController as! PersonalInfoEditTableViewController).personalInfo = personalInfoService.personalInfo
    }
}
