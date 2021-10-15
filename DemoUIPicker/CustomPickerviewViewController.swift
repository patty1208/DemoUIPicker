//
//  CustomPickerviewViewController.swift
//  CustomPickerviewViewController
//
//  Created by 林佩柔 on 2021/10/14.
//

import UIKit

class CustomPickerviewViewController: UIViewController {

    @IBOutlet weak var customPickerview: UIPickerView!
    var demoStringLabel1: UILabel = UILabel()
    var demoStringLabel2: UILabel = UILabel()
    var demoStringLabel3: UILabel = UILabel()
    
    func customPickerViewUI(stringArray: [String]){
        // pickerview 中間加固定位置的文字
        let rowSize = customPickerview.rowSize(forComponent: 0)
        let borderOfPickerview = (customPickerview.frame.width - rowSize.width * 3) / 3
//        customPickerview.layer.backgroundColor = UIColor.gray.cgColor
//        customPickerview.backgroundColor = UIColor.darkGray
        
        demoStringLabel1.frame = CGRect(x: customPickerview.bounds.midX - (rowSize.width/2) - rowSize.width * (2/3) - borderOfPickerview * (1/2), y: customPickerview.bounds.midY - (rowSize.height / 2), width: rowSize.width, height: rowSize.height)
        
        demoStringLabel2.frame = CGRect(x: customPickerview.bounds.midX - rowSize.width/2 + (rowSize.width * (1/3)), y: customPickerview.bounds.midY - (rowSize.height / 2), width: rowSize.width, height: rowSize.height)
        
        demoStringLabel3.frame = CGRect(x: customPickerview.bounds.midX + (rowSize.width/2) + borderOfPickerview * (1/2) + (rowSize.width * (1/3)), y: customPickerview.bounds.midY - (rowSize.height / 2), width: rowSize.width, height: rowSize.height)
        
        demoStringLabel1.text = stringArray[0]
        demoStringLabel1.textAlignment = .left
        
        demoStringLabel2.text = stringArray[1]
        demoStringLabel2.textAlignment = .left
        
        demoStringLabel3.text = stringArray[2]
        demoStringLabel3.textAlignment = .left
        
        customPickerview.addSubview(demoStringLabel1)
        customPickerview.addSubview(demoStringLabel2)
        customPickerview.addSubview(demoStringLabel3)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        customPickerViewUI(stringArray: [" hours"," min","  sec"])
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension CustomPickerviewViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        3
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0{
            return 24
        } else {
            return 60
        }
    }
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let rowSize = customPickerview.rowSize(forComponent: 0)
        let pickerLabel = UILabel()
        let pickerview = UIView(frame: CGRect(x: 0, y: 0, width: rowSize.width, height: rowSize.height))
        pickerLabel.text = row.description
        pickerLabel.textAlignment = .right
//        pickerLabel.backgroundColor = UIColor.brown
        pickerLabel.frame = CGRect(x: 0, y: 0, width: rowSize.width/3, height: rowSize.height)
//        pickerview.backgroundColor = UIColor.red
        pickerview.addSubview(pickerLabel)
        return pickerview
    }
}
extension UIPickerView {
    
}
