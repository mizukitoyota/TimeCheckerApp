//
//  ResultTableViewCell.swift
//  TimeRangerApp
//
//  Created by SR-Toyota on 2021/08/04.
//

import UIKit

class ResultTableViewCell: UITableViewCell {
    @IBOutlet weak var specifyLabel: UILabel!
    @IBOutlet weak var startLabel: UILabel!
    @IBOutlet weak var endLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // 処理なし
    }
    
    func configure(specify:String, start:String ,end:String ,result:String) {
        specifyLabel.text  = specify
        startLabel.text = start
        endLabel.text  = end
        resultLabel.text = result
    }
}
