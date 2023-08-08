//
//  LottoViewController.swift
//  OneLineDiary
//
//  Created by 이승현 on 2023/08/03.
//

import UIKit
import Alamofire
import SwiftyJSON

class LottoViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    
    @IBOutlet var numberTextField: UITextField!
    let pickerView = UIPickerView()
    
    @IBOutlet weak var bonusNumberLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var luckyNumberLabel: UILabel!
    
    //   var list = ["영화", "드라마", "애니메이션", "SF", "가족", "로맨스", "스릴러"]
    var list: [Int] = Array(1...1079).reversed()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("1")
        print("2")
        print("4")
        callRequest(1079)
        
        numberTextField.inputView = pickerView
        numberTextField.tintColor = .clear
        
        pickerView.delegate = self
        pickerView.dataSource = self
        
        print("5")
        
        
    }
    func callRequest(_ num: Int){
        let url = "https://www.dhlottery.co.kr/common.do?method=getLottoNumber&drwNo="+String(num)
        
        
        AF.request(url, method: .get).validate().responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                print("JSON: \(json)")
                print("3")
                
                let date = json["drwNoDate"].stringValue
                let bonusNumber = json["bnusNo"].intValue
                let luckyNumber1 = json["drwtNo1"].stringValue
                let luckyNumber2 = json["drwtNo2"].stringValue
                let luckyNumber3 = json["drwtNo3"].stringValue
                let luckyNumber4 = json["drwtNo4"].stringValue
                let luckyNumber5 = json["drwtNo5"].stringValue
                let luckyNumber6 = json["drwtNo6"].stringValue
                
                print(date, bonusNumber)

                self.dateLabel.text = date
                self.bonusNumberLabel.text = "\(bonusNumber)번"
                self.luckyNumberLabel.text = "\(luckyNumber1)"+" "+"\(luckyNumber2)"+" "+"\(luckyNumber3)"+" "+"\(luckyNumber4)"+" "+"\(luckyNumber5)"+" "+"\(luckyNumber6)"
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return list.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print("select \(row)")
        
        numberTextField.text = "\(list[row])"
        callRequest(list[row])
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(list[row])"
    }
    



}


