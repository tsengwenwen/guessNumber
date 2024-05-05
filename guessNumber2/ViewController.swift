//
//  ViewController.swift
//  guessNumber2
//
//  Created by TsengWen on 2024/5/5.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var numberTextField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var guessCountLabel: UILabel!
    @IBOutlet weak var guessButton: UIButton!
    
    
    var answer = Int.random(in: 1...100)
    var guessCount = 0
    var minNumber = 1
    var maxNumber = 100
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func guess(_ sender: Any) {
        let numberText = numberTextField.text!
        let number = Int(numberText)
        
        if number != nil, number! >= minNumber, number! <= maxNumber {
            let guessNumber = number!
            
            if guessNumber == answer {
                resultLabel.text = "答案是\(guessNumber)!\n答對了"
                }
            else if guessNumber < answer {
                minNumber = guessNumber
                resultLabel.text = "範圍\(minNumber)～\(maxNumber)"
                numberTextField.text = ""
                guessCount += 1
            }
            else if guessNumber > answer {
                maxNumber = guessNumber
                resultLabel.text = "範圍\(minNumber)～\(maxNumber)"
                numberTextField.text = ""
                guessCount += 1
            }
            guessCountLabel.text = "剩下 \(6 - guessCount) 次機會"
        }
        if number != nil, number! > maxNumber {
            numberTextField.text = ""
            resultLabel.text = "超出範圍嘍!\n請重新輸入"
        }
        if number == nil {
            numberTextField.text = ""
            resultLabel.text = "請輸入1-100的數字!!"
        }
        if guessCount == 6 {
            numberTextField.text = ""
            guessButton.isEnabled = false
            guessCountLabel.text = "GAME OVER!!"
            resultLabel.text = "真遺憾！！\n答案是\(answer)"
            
        }
        view.endEditing(true)
    }
    
    @IBAction func replay(_ sender: Any) {
        answer = Int.random(in: 1...100)
        guessButton.isEnabled = true
        numberTextField.text = ""
        minNumber = 1
        maxNumber = 100
        guessCount = 0
        resultLabel.text = "請輸入 \(minNumber) ~ \(maxNumber) 的數字"
        guessCountLabel.text = "有 \(6 - guessCount) 次機會"
        
    }
    
}


