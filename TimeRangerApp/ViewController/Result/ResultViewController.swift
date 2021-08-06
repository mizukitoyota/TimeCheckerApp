//
//  Result.swift
//  TimeRangerApp
//
//  Created by SR-Toyota on 2021/08/02.
//

import UIKit

class ResultViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var resultTableView: UITableView!
    
    let tableCell = ResultTableViewCell()
    let cellIdentifier = "ResultTableViewCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultTableView.separatorStyle = .singleLine
        resultTableView.separatorColor = UIColor.red
        resultTableView.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        
        resultTableView.register(UINib(nibName: "ResultTableViewCell", bundle: nil), forCellReuseIdentifier: cellIdentifier)
        resultTableView.dataSource = self
        UserDefaults.standard.synchronize()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "ResultTableViewCell") as? ResultTableViewCell {
            let userDefaults = UserDefaults.standard
            if let timeArray = userDefaults.array(forKey: "TimeArray") as? [[String]]{
                let resultArray = timeArray[indexPath.row] as AnyObject
                let specifyDate = resultArray[0] as AnyObject
                cell.specifyLabel.text = specifyDate as? String
                let startDate = resultArray[1] as AnyObject
                cell.startLabel.text = startDate as? String
                let endDate = resultArray[2] as AnyObject
                cell.endLabel.text = endDate as? String
                let resultDate = resultArray[3] as AnyObject
                cell.resultLabel.text = resultDate as? String
            }
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let userDefaults = UserDefaults.standard
        guard let value = userDefaults.array(forKey: "TimeArray") else{
            return 0
        }
        return value.count
    }
    
    @IBAction func backButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func deleteDate(_ sender: Any) {
        let userDefaults = UserDefaults.standard
        userDefaults.removeObject(forKey: "TimeArray")
        self.resultTableView.reloadData()
    }
}
