//
//  Result.swift
//  TimeRangerApp
//
//  Created by SR-Toyota on 2021/08/02.
//

import UIKit

class ResultViewController: UIViewController, UITableViewDataSource {
        
    let cellIdentifier = "ResultTableViewCell"
    
    @IBOutlet weak var resultTableView: UITableView!
    
    let tableCell = ResultTableViewCell()
    
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
            let timeArray = userDefaults.array(forKey: "TimeArray")
            let coc = [indexPath.row]
//            for num in 0...[indexPath.row].count - 1 {
                
                if let arr = UserDefaults.standard.array(forKey: "TimeArray") as? [[String]]{
                    print(arr[0])
                    
                    let lol = arr[indexPath.row] as AnyObject
                    let lols = lol[0] as AnyObject
                    cell.specifyLabel.text = lols as? String
                    let lols1 = lol[1] as AnyObject
                    cell.startLabel.text = lols1 as? String
                    let lols2 = lol[2] as AnyObject
                    cell.endLabel.text = lols2 as? String
                    let lols3 = lol[3] as AnyObject
                    cell.resultLabel.text = lols3 as? String
                    
                    //tableCell.configure(specify: lols as! String , start: lols1 as! String, end: lols2 as! String, result: lols3 as! String)
                    
                }
                return cell
           // }
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
    }
}
