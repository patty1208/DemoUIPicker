//
//  SlotViewController.swift
//  SlotViewController
//
//  Created by æä½©æ on 2021/9/19.
//

import UIKit

class SlotViewController: UIViewController {
    @IBOutlet weak var slotButton: UIButton!
    
    @IBOutlet weak var customPickerview: UIPickerView!
    let slotData = ["ð","ð", "ð", "ð", "ð"]
    var slotImage = ["seven","lemon", "bell","cherry","clover","diamond","watermelon"]
    let aNumber = 1000
    var numberOfRow = 0
    
    func scrollForThree(times: Int, numberOfData: Int){
        var randomForOne = 1
        var randomForTwo = 1
        var randomForThree = 1
        
        // ééå»¶é²0.3ç§è£½é é£çºè½ååç«ææ
        for count in 1...times{
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3 * Double(count - 1)) {
                // æ§å¶é¨æ©ç¢ççrowä¸æè¶åºç¸½rowæ¸é
                if 100 * numberOfData * count < self.numberOfRow {
                    randomForOne = 100 * numberOfData * count + Int.random(in: 1...numberOfData)
                    randomForTwo = 100 * numberOfData * count  + Int.random(in: 1...numberOfData)
                    randomForThree = 100 * numberOfData * count  + Int.random(in: 1...numberOfData)
                    self.customPickerview.selectRow(randomForOne, inComponent: 0, animated: true)
                    self.customPickerview.selectRow(randomForTwo, inComponent: 1, animated: true)
                    self.customPickerview.selectRow(randomForThree, inComponent: 2, animated: true)
                }
            }
        }
        
        // åç«çµæå¾,å°rowåå¾©å°è¼åé¢çä½ç½®,é¿åå¾çºåååç«é¨æ©ç¢ççrowè¶åºç¸½rowæ¸é
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3 * Double(times) + 0.001) {
            self.customPickerview.selectRow( numberOfData * 20 + (randomForOne % numberOfData), inComponent: 0, animated: false)
            self.customPickerview.selectRow( numberOfData * 20 + (randomForTwo % numberOfData), inComponent: 1, animated: false)
            self.customPickerview.selectRow( numberOfData * 20 + (randomForThree % numberOfData), inComponent: 2, animated: false)
        }
    }
    
    func scrollForTwo(times: Int, numberOfData: Int){
        var randomForTwo = 1
        var randomForThree = 1
        for count in 1...times {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3 * Double(count - 1)) {
                if 100 * numberOfData * count < self.numberOfRow {
                    randomForTwo = 100 * numberOfData * count + Int.random(in: 1...numberOfData)
                    randomForThree = 100 * numberOfData * count + Int.random(in: 1...numberOfData)
                    self.customPickerview.selectRow(randomForTwo, inComponent: 1, animated: true)
                    self.customPickerview.selectRow(randomForThree, inComponent: 2, animated: true)
                }
            }
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3 * Double(times) + 0.001) {
            self.customPickerview.selectRow((numberOfData * 20) + (randomForTwo % numberOfData), inComponent: 1, animated: false)
            self.customPickerview.selectRow((numberOfData * 20) + (randomForThree % numberOfData), inComponent: 2, animated: false)
        }
    }
    
    func scrollForOne(times: Int, numberOfData: Int){
        var randomForThree = 1
        for count in 1...times {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3 * Double(count - 1)) {
                if 100 * numberOfData * count < self.numberOfRow {
                    randomForThree = 100 * numberOfData * count + Int.random(in: 1...numberOfData)
                    self.customPickerview.selectRow(randomForThree, inComponent: 2, animated: true)
                }
            }
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3 * Double(times) + 0.001) {
            self.customPickerview.selectRow((numberOfData * 20) + (randomForThree % numberOfData), inComponent: 2, animated: false)
            self.slotButton.isEnabled = true
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        slotImage.shuffle()
        numberOfRow = slotImage.count * aNumber
        let numberOfData = slotImage.count
        customPickerview.selectRow( numberOfData * 20, inComponent: 0, animated: false)
        customPickerview.selectRow( numberOfData * 20, inComponent: 1, animated: false)
        customPickerview.selectRow( numberOfData * 20, inComponent: 2, animated: false)
        customPickerview.subviews.last?.backgroundColor = UIColor.clear
        
    }
    @IBAction func startSlot(_ sender: UIButton) {
        slotButton.isEnabled = false
        let scrollOfTime = 5
        scrollForThree(times: scrollOfTime, numberOfData: slotImage.count)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3 * Double(scrollOfTime) + 0.001) {
            self.scrollForTwo(times: scrollOfTime, numberOfData: self.slotImage.count)
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3 * Double(scrollOfTime) + 0.001) {
                self.scrollForOne(times: scrollOfTime, numberOfData: self.slotImage.count)
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
        
        /*
         // å®ç´ä»¥labelåç¾, ä¾å¦é¸ææå­æ¯åçç
         let pickerLabel = UILabel()
         pickerLabel.text = "" + slotData[row % slotData.count]
         pickerLabel.font = UIFont.systemFont(ofSize: 30)
         pickerLabel.textAlignment = .center
         return pickerLabel
         */
        
        // æå¤æ¡ containerView
        let containerView = UIView(frame: CGRect(x: 0, y: 0, width: customPickerview.frame.width / 4, height: customPickerview.frame.width / 4))
        containerView.layer.borderWidth = 2
        containerView.layer.borderColor = UIColor.darkGray.cgColor
        
        // åå¡è²åº containerViewForBorder
        let containerViewForBorder = UIView(frame: CGRect(x: 0, y: 0, width: customPickerview.frame.width / 5, height: customPickerview.frame.width / 5))
        containerViewForBorder.backgroundColor = UIColor.brown
        
        // é¡¯ç¤ºåç pickerImageView
        let pickerImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: customPickerview.frame.width / 6, height: customPickerview.frame.width / 6))
        pickerImageView.image = UIImage(named: slotImage[row % slotImage.count])
        pickerImageView.contentMode = .scaleAspectFit
        
        // å å¥å­å
        containerView.addSubview(containerViewForBorder)
        containerView.addSubview(pickerImageView)
        // ä¸­å¿å°é½
        containerViewForBorder.center = containerView.center
        pickerImageView.center = containerView.center
        
        return containerView
    }
    
}

