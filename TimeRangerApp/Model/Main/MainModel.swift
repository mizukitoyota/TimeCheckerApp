//
//  MainModel.swift
//  TimeRangerApp
//
//  Created by SR-Toyota on 2021/08/02.
//

import Foundation

class MainModel {
    func saveDate(speficied: String, start: String,end: String, messeage: String) {
        let timeArray = [[speficied, start ,end ,messeage]]
        let userDefaults = UserDefaults.standard
        
        var names = userDefaults.array(forKey: "TimeArray") as? [[String]] ?? []
        names.append(timeArray[0])
        userDefaults.set(names, forKey: "TimeArray")
        
        // userDefaults内データ確認用コード
        let retreivedData = userDefaults.value(forKey:"TimeArray") as! [[String]]
        print(retreivedData)
    }
}
