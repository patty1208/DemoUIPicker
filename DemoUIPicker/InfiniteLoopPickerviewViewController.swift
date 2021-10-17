//
//  InfiniteLoopPickerviewViewController.swift
//  InfiniteLoopPickerviewViewController
//
//  Created by 林佩柔 on 2021/10/14.
//

import UIKit

class InfiniteLoopPickerviewViewController: UIViewController {
    @IBOutlet weak var pickerview: UIPickerView!
    @IBOutlet weak var resultLabel: UILabel!
    let drinkList = ["鮮茶道", "可不可", "comebuy", "清心", "迷客夏", "coco"]
    let aNumber = 1000
    var numberOfRow = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        numberOfRow = drinkList.count * aNumber
        
        pickerview.layer.borderWidth = 0.2
        pickerview.layer.borderColor = UIColor(red: 87/255, green: 115/255, blue: 153/255, alpha: 1).cgColor
        
        // pickerView row 初始位置
        let position = numberOfRow / 2
        pickerview.selectRow(position, inComponent: 0, animated: false)
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
extension InfiniteLoopPickerviewViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return numberOfRow
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return drinkList[row % drinkList.count]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let position = (numberOfRow / 2) + (row % drinkList.count)
        pickerview.selectRow(position, inComponent: 0, animated: false)
        resultLabel.text = "今晚我想來點：\(drinkList[row % drinkList.count])"
    }
}

