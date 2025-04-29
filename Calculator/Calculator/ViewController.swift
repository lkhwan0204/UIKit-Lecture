//
//  ViewController.swift
//  Calculator
//
//  Created by kyuhyeon Lee on 2/25/25.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var num1: UITextField!
    @IBOutlet weak var opt: UITextField!
    @IBOutlet weak var num2: UITextField!
    @IBOutlet weak var res: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        res.text = "결과: 0"
    }

    @IBAction func btnResult(_ sender: UIButton) {
        guard let firstNum = Int(num1.text ?? ""),
              let secondNum = Int(num2.text ?? ""),
              let oper = opt.text else {
            res.text = "입력값이 잘못되었습니다!"
            return
        }

        var result: Int = 0

        switch oper {
        case "+":
            result = firstNum + secondNum
        case "-":
            var a = firstNum
            var b = secondNum
            if a < b {
                swap(&a, &b)
            }
            result = a - b
        case "*":
            result = firstNum * secondNum
        case "/":
            if secondNum == 0 {
                res.text = "0으로 나눌 수 없어요!"
                return
            }
            result = firstNum / secondNum
        default:
            res.text = "정의되지 않은 연산자예요!"
            return
        }

        res.text = "결과: \(result)"
    }
}
