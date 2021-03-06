//
//  ViewController.swift
//  TimeRangerApp
//
//  Created by SR-Toyota on 2021/08/02.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var SpecifiedTime: UIDatePicker!
    @IBOutlet weak var StartTime: UIDatePicker!
    @IBOutlet weak var EndTime: UIDatePicker!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var saveButton: UIButton!
    
    private let viewModel = MainModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.saveButton.isEnabled = false
        self.saveButton.backgroundColor = .gray
    }
    
    func checkTime() -> String {
        let type = "check"
        let stringtime = self.setTime(type: type)
        
        var speficiedInt = Int(stringtime.specifiedString) ?? .zero
        var startInt = Int(stringtime.startString) ?? .zero
        var endInt = Int(stringtime.endString) ?? .zero
        
        if speficiedInt == 0 {
            speficiedInt = 24
        }
        
        if startInt == 0 {
            startInt = 24
        }
        
        if endInt == 0 {
            endInt = 24
        }
        
        if startInt > endInt {
            let alert = UIAlertController(title: "", message: "開始時間が終了時間より前に設定されています。", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            return "指定時間範囲外です。"
        }
        if  startInt..<endInt ~= speficiedInt {
            return "指定時間範囲内です。"
        } else if startInt == endInt && startInt == speficiedInt {
            return "指定時間範囲内です。"
        }
        return "指定時間範囲外です。"
    }
    
    func setTime(type: String) -> (specifiedString:String, startString:String, endString: String) {
        let specifiedDate = self.SpecifiedTime.date
        let startDate = self.StartTime.date
        let endDate = self.EndTime.date
        let dateFormatter = DateFormatter()
        
        switch type {
        case "check":
            let formatType = "HH"
            dateFormatter.dateFormat = formatType
            
        case "save":
            let formatType = "HH:mm"
            dateFormatter.dateFormat = formatType
            
        default:
            break
        }
        
        let specifiedString = dateFormatter.string(from: specifiedDate)
        let startString = dateFormatter.string(from: startDate)
        let endString = dateFormatter.string(from: endDate)
        return (specifiedString, startString, endString)
    }
    
    @IBAction func resultCheck(_ sender: Any) {
        self.resultLabel.text = self.checkTime()
        self.saveButton.isEnabled = true
        self.saveButton.backgroundColor = .systemTeal
    }
    
    @IBAction func saveResult(_ sender: Any) {
        let type = "save"
        let stringtime = self.setTime(type: type)
        guard let resultMessage = self.resultLabel.text else { return }
        
        self.viewModel.saveDate(speficied: stringtime.specifiedString, start: stringtime.startString, end: stringtime.endString, messeage: resultMessage)
        
        let storyboard = UIStoryboard(name: "Result",bundle: nil)
        guard let vc =  storyboard.instantiateInitialViewController() as? ResultViewController else { return }
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
}
