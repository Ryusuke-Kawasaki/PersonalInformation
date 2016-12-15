//
//  PersonalInfoService.swift
//  PersonalInformationApp
//
//  Created by 川崎 隆介 on 2015/11/26.
//  Copyright (c) 2015年 川崎 隆介. All rights reserved.
//

import UIKit

class PersonalInfoService: NSObject {
    
    fileprivate var person : Person?
    var personalInfo : Person?{
        get{
            let sharedFM = FileManager.default
            let documentDir = sharedFM.urls(for: .documentDirectory, in: .userDomainMask)[0]
            var path = documentDir.path
            path += "PersonalInfo.plist"
            if let dic = NSDictionary(contentsOfFile: path) {
                if dic.count > 0 {
                    if person == nil {
                        person = Person()
                    }
                    if let userName = dic["UserName"] as? String{
                        person?.userName = userName
                    }
                    if let twitterID = dic["TwitterID"] as? String{
                        person?.twitterID = twitterID
                    }
                    if let facebook = dic["Facebook"] as? String{
                        person?.facebook = facebook
                    }
                    
                }
            }
            
            return person
        }
        set{
            let sharedFM = FileManager.default
            let documentDir = sharedFM.urls(for: .documentDirectory, in: .userDomainMask)[0]
            var path = documentDir.path
            path += "PersonalInfo.plist"
            let dic = NSMutableDictionary()
            dic["UserName"] = newValue?.userName
            dic["TwitterID"] = newValue?.twitterID
            dic["Facebook"] = newValue?.facebook
            print(NSDictionary(dictionary: dic).write(toFile: path, atomically: true))
            
        }
    }
}
