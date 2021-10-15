//
//  MultiplePickerviewViewController.swift
//  DemoUIPicker
//
//  Created by 林佩柔 on 2021/10/15.
//

import UIKit

class MultiplePickerviewViewController: UIViewController {
    
    @IBOutlet weak var multiplePickerView: UIPickerView!
    @IBOutlet weak var resultLabel: UILabel!
    
    let catogories = ["飲料🧋", "甜點🍰"]
    let drinkList = ["鮮茶道", "可不可", "comebuy", "清心", "迷客夏", "coco"]
    let desserts = ["很美 Handmade", "藏甜手作坊", "美美子", "粢啡所", "巷光咖啡"]
   
    override func viewDidLoad() {
        super.viewDidLoad()
        let selectedCatogoryName = catogories[ multiplePickerView.selectedRow(inComponent: 0)]
        var selectedItem = ""
        if selectedCatogoryName == catogories[0]{
            selectedItem = drinkList[multiplePickerView.selectedRow(inComponent: 1)]
        } else {
            selectedItem = desserts[multiplePickerView.selectedRow(inComponent: 1)]
        }
        resultLabel.text = "今晚想來點\n\n\(selectedCatogoryName) -  \(selectedItem) 💕"
        multiplePickerView.subviews.last?.backgroundColor = UIColor.clear
        multiplePickerView.subviews.last?.layer.borderWidth = 2
        multiplePickerView.subviews.last?.layer.borderColor = UIColor(red: 240/255, green: 173/255, blue: 161/255, alpha: 0.8).cgColor
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
extension MultiplePickerviewViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        let selectedCatogoryName = catogories[ multiplePickerView.selectedRow(inComponent: 0)]
        if component == 0{
            return catogories.count
        } else {
            if selectedCatogoryName == "飲料"{
                return drinkList.count
            } else {
                return desserts.count
            }
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let selectedCatogoryName = catogories[ multiplePickerView.selectedRow(inComponent: 0)]
        if component == 0{
            return catogories[row]
        } else {
            if selectedCatogoryName == catogories[0] {
                return drinkList[row]
            } else {
                return desserts[row]
            }
        }
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if component == 0{
            multiplePickerView.reloadComponent(1)
        }
        let selectedCatogoryName = catogories[ multiplePickerView.selectedRow(inComponent: 0)]
        var selectedItem = ""
        if selectedCatogoryName == catogories[0]{
            selectedItem = drinkList[multiplePickerView.selectedRow(inComponent: 1)]
        } else {
            selectedItem = desserts[multiplePickerView.selectedRow(inComponent: 1)]
        }
        resultLabel.text = "今晚想來點\n\n\(selectedCatogoryName) -  \(selectedItem) 💕"
    }
    
}
