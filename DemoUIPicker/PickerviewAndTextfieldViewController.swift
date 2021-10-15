//
//  PickerviewAndTextfieldViewController.swift
//  DemoUIPicker
//
//  Created by 林佩柔 on 2021/10/15.
//

import UIKit

class PickerviewAndTextfieldViewController: UIViewController {
    @IBOutlet weak var pickerTextfield: UITextField!
    let multiplePickerView = UIPickerView()
    let catogories = ["飲料🧋", "甜點🍰"]
    let drinkList = ["鮮茶道", "可不可", "comebuy", "清心", "迷客夏", "coco"]
    let desserts = ["很美 Handmade", "藏甜手作坊", "美美子", "粢啡所", "巷光咖啡"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        multiplePickerView.delegate = self
        multiplePickerView.dataSource = self
        pickerTextfield.delegate = self
    }
    @objc func dismissPickerView() {
            self.view.endEditing(true)
        }
    @objc func cancel(){
        pickerTextfield.resignFirstResponder()
    }
    @objc func donePressed(){
        let selectedCatogoryName = catogories[ multiplePickerView.selectedRow(inComponent: 0)]
        var selectedItem = ""
        if selectedCatogoryName == catogories[0]{
            selectedItem = drinkList[multiplePickerView.selectedRow(inComponent: 1)]
        } else {
            selectedItem = desserts[multiplePickerView.selectedRow(inComponent: 1)]
        }
        pickerTextfield.text = "\(selectedCatogoryName) -  \(selectedItem) 💕"
        pickerTextfield.resignFirstResponder()
    }
    
    func createPicker(){
        // toolbar
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed))
        let cancelButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: nil, action: #selector(cancel))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        toolBar.setItems([cancelButton,spaceButton,doneButton], animated: true)
        
        // textfield 下方出現 pickerview 設定
        pickerTextfield.inputView = multiplePickerView
        pickerTextfield.inputAccessoryView = toolBar
        
        // 點擊空白處收起 textfield 的 input view
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissPickerView))
                self.view.addGestureRecognizer(tap)
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
extension PickerviewAndTextfieldViewController: UIPickerViewDataSource, UIPickerViewDelegate {
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
        if component == 0 {
            multiplePickerView.reloadComponent(1)
        }
    }
}
extension PickerviewAndTextfieldViewController: UITextFieldDelegate{
    func textFieldDidBeginEditing(_ textField: UITextField) {
        createPicker()
    }
}
