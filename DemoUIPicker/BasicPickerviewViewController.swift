//
//  BasicPickerviewViewController.swift
//  BasicPickerviewViewController
//
//  Created by 林佩柔 on 2021/10/14.
//

import UIKit

class BasicPickerviewViewController: UIViewController {
    
    @IBOutlet weak var timePickerview: UIPickerView!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var showResultButton: UIButton!
    let formatter = DateFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        timePickerview.layer.borderWidth = 2
        timePickerview.layer.borderColor = UIColor(red: 87/255, green: 115/255, blue: 153/255, alpha: 1).cgColor
        
        timeLabel.text = "預計時間\n\n\n\n"
        showResultButton.isEnabled = false
    }
    override func viewDidAppear(_ animated: Bool) {
        timePickerview.selectRow(0, inComponent: 0, animated: true)
    }
    
    @IBAction func showTimeResult(_ sender: UIButton) {
        showResultButton.isEnabled = false
        
        let hour = timePickerview.selectedRow(inComponent: 0)
        let min = timePickerview.selectedRow(inComponent: 1)
        let sec = timePickerview.selectedRow(inComponent: 2)
        // 選擇的時間以字串顯示
        timePickerview.selectRow(hour, inComponent: 0, animated: false)
        timePickerview.selectRow(min, inComponent: 1, animated: false)
        timePickerview.selectRow(sec, inComponent: 2, animated: false)
        timeToString(hour: hour, min: min, sec: sec)
    }
    
    func timeToString(hour: Int, min: Int, sec: Int){
        // 選擇的時間以字串顯示
        formatter.dateFormat = "HH:mm:ss"
        guard let time = formatter.date(from: "\(hour):\(min):\(sec)") else { return }
        let timeToString = formatter.string(from: time)
        timeLabel.text = "預計時間：\(timeToString)\n\n第一列：\(timePickerview.selectedRow(inComponent: 0))\n第二列：\(timePickerview.selectedRow(inComponent: 1))\n第三列：\(timePickerview.selectedRow(inComponent: 2))"
        
    }
}
extension BasicPickerviewViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 {
            return 24
        } else {
            return 60
        }
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0 {
            return row.description
        } else {
            return row.description
        }
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        // 避免滑到底,畫面選擇和偵測選擇的不同, 會將畫面選擇的移動到偵測選擇的row
        timePickerview.selectRow(row, inComponent: component, animated: false)
        
        showResultButton.isEnabled = true
        timeLabel.text = "預計時間\n\n\n\n"
    }
}

