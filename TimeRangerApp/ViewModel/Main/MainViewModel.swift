//
//  MainViewModel.swift
//  TimeRangerApp
//
//  Created by SR-Toyota on 2021/08/02.
//

import Foundation

class MainViewModel {
    func saveDate(speficied: String, start: String,end: String, messeage: String) {
        let timeArray = [[speficied, start ,end ,messeage]]
        let userDefaults = UserDefaults.standard
        
        
        
        var names = userDefaults.array(forKey: "TimeArray") as? [[String]] ?? []
        names.append(timeArray[0])
        userDefaults.set(names, forKey: "TimeArray")
        
        let retreivedData = userDefaults.value(forKey:"TimeArray") as! [[String]]
                print(retreivedData)
        
        let oldDate = userDefaults.array(forKey: "TimeArray") as? [[String]]
        if oldDate == nil {
            //userDefaults.set(timeArray, forKey: "TimeArray")
            let retreivedData = userDefaults.value(forKey:"TimeArray") as! [[String]]
                    print(retreivedData)
            return
        }
        //oldDate?.append(timeArray)
        //userDefaults.set(oldDate, forKey: "TimeArray")
        
                print(retreivedData)
    }
}
