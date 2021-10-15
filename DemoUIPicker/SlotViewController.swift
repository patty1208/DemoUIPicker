//
//  SlotViewController.swift
//  SlotViewController
//
//  Created by 林佩柔 on 2021/9/19.
//

import UIKit

class SlotViewController: UIViewController {
    @IBOutlet weak var slotButton: UIButton!
    
    @IBOutlet weak var customPickerview: UIPickerView!
    let demoDataDict = ["apple":"🍎","orange":"🍊","grape":"🍇","cherry":"🍒","lemon":"🍋"]
    let slotData = ["🍎","🍊", "🍇", "🍒", "🍋"]
    var slotImage = ["seven","lemon", "bell","cherry","clover","diamond","watermelon"]
    let aNumber = 1000
    var numberOfRow = 0
    
    func scrollForThree(count: Int, numberOfData: Int){
        print(Date(),#function)
        var randomForOne = 1
        var randomForTwo = 1
        var randomForThree = 1
        
        for count in 1...count{
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3 * Double(count - 1)) {
                if 100 * numberOfData * count < self.numberOfRow {
                    randomForOne = 100 * numberOfData * count + Int.random(in: 1...numberOfData)
                    randomForTwo = 100 * numberOfData * count  + Int.random(in: 1...numberOfData)
                    randomForThree = 100 * numberOfData * count  + Int.random(in: 1...numberOfData)
                    self.customPickerview.selectRow(randomForOne, inComponent: 0, animated: true)
                    self.customPickerview.selectRow(randomForTwo, inComponent: 1, animated: true)
                    self.customPickerview.selectRow(randomForThree, inComponent: 2, animated: true)
                    print(randomForOne,randomForTwo,randomForThree)
                    print(self.customPickerview.selectedRow(inComponent: 0),self.customPickerview.selectedRow(inComponent: 1),self.customPickerview.selectedRow(inComponent: 2))
                }
            }
            
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3 * Double(count) + 0.001) {
            self.customPickerview.selectRow( numberOfData * 20 + (randomForOne % numberOfData), inComponent: 0, animated: false)
            self.customPickerview.selectRow( numberOfData * 20 + (randomForTwo % numberOfData), inComponent: 1, animated: false)
            self.customPickerview.selectRow( numberOfData * 20 + (randomForThree % numberOfData) , inComponent: 2, animated: false)
        }
    }
    func scrollForTwo(count: Int, numberOfData: Int){
        print(Date(),#function)
        var randomForTwo = 1
        var randomForThree = 1
        for count in 1...count {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3 * Double(count - 1)) {
                if 100 * numberOfData * count < self.numberOfRow {
                    randomForTwo = 100 * numberOfData * count + Int.random(in: 1...numberOfData)
                    randomForThree = 100 * numberOfData * count + Int.random(in: 1...numberOfData)
                    self.customPickerview.selectRow(randomForTwo, inComponent: 1, animated: true)
                    self.customPickerview.selectRow(randomForThree, inComponent: 2, animated: true)
                }}
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3 * Double(count) + 0.001) {
            self.customPickerview.selectRow((numberOfData * 20) + (randomForTwo % numberOfData), inComponent: 1, animated: false)
            self.customPickerview.selectRow((numberOfData * 20) + (randomForThree % numberOfData), inComponent: 2, animated: false)
        }
    }
    func scrollForOne(count: Int, numberOfData: Int){
        print(Date(),#function)
        var randomForThree = 1
        for count in 1...count {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3 * Double(count - 1)) {
                if 100 * numberOfData * count < self.numberOfRow {
                    randomForThree = 100 * numberOfData * count + Int.random(in: 1...numberOfData)
                    self.customPickerview.selectRow(randomForThree, inComponent: 2, animated: true)
                }
            }}
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3 * Double(count) + 0.001) {
            self.customPickerview.selectRow((numberOfData * 20) + (randomForThree % numberOfData), inComponent: 2, animated: false)
            self.slotButton.isEnabled = true
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        slotImage.shuffle()
        numberOfRow = slotImage.count * aNumber
        let countForTotal = slotImage.count * (aNumber / (slotImage.count + 2))
        customPickerview.selectRow(countForTotal + (0 % slotImage.count), inComponent: 0, animated: false)
        customPickerview.selectRow(countForTotal + (0 % slotImage.count), inComponent: 1, animated: false)
        customPickerview.selectRow(countForTotal + (0 % slotImage.count), inComponent: 2, animated: false)
        customPickerview.subviews.last?.backgroundColor = UIColor.clear
        
    }
    @IBAction func startSlot(_ sender: UIButton) {
        slotButton.isEnabled = false
        let scrollOfTime = 5
        scrollForThree(count: scrollOfTime, numberOfData: slotImage.count)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3 * Double(scrollOfTime) + 0.001) {
            self.scrollForTwo(count: scrollOfTime, numberOfData: self.slotImage.count)
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3 * Double(scrollOfTime) + 0.001) {
                self.scrollForOne(count: scrollOfTime, numberOfData: self.slotImage.count)
            }
        }
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

extension SlotViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return numberOfRow
    }
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return customPickerview.frame.width / 4
    }
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        
        //        let pickerLabel = UILabel()
        //        pickerLabel.text = "" + slotData[row % slotData.count]
        //        pickerLabel.font = UIFont.systemFont(ofSize: 30)
        //        pickerLabel.textAlignment = .center
        //        return pickerLabel
        
        let containerView = UIView(frame: CGRect(x: 0, y: 0, width: customPickerview.frame.width / 4, height: customPickerview.frame.width / 4))
        let containerViewForBorder = UIView(frame: CGRect(x: 0, y: 0, width: customPickerview.frame.width / 5, height: customPickerview.frame.width / 5))
        let pickerImageView = UIImageView()
        pickerImageView.frame = CGRect(x: 0, y: 0, width: customPickerview.frame.width / 6, height: customPickerview.frame.width / 6)
        containerViewForBorder.center = containerView.center
        pickerImageView.center = containerView.center
        containerView.addSubview(containerViewForBorder)
        containerView.addSubview(pickerImageView)
        pickerImageView.image = UIImage(named: slotImage[row % slotImage.count])
        pickerImageView.contentMode = .scaleAspectFit
        containerView.layer.borderWidth = 2
        containerView.layer.borderColor = UIColor.darkGray.cgColor
        containerViewForBorder.backgroundColor = UIColor.brown
        return containerView
    }
    
}

