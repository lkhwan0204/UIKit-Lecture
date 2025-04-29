//
//  ViewController.swift
//  UIKitch01Homework01
//
//  Created by kyuhyeon Lee on 2/26/25.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var lblResult: UILabel!
    @IBOutlet weak var txtNum1: UITextField!
    @IBOutlet weak var txtNum2: UITextField!
    @IBOutlet weak var txtOper: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnResult(_ sender: Any) {
        var num1: Int = Int(txtNum1.text!)!
        var num2: Int = Int(txtNum2.text ?? "0") ?? 0
        var oper: String = txtOper.text!
        var result: Int = 0
        
        if oper == "+" {
            result = num1 + num2
        }
        if oper == "-" {
            if num1 < num2 {
                (num1, num2) = (num2, num1)
            }
            result = num1 - num2
        }
        if oper == "*" {
            result = num1 * num2
        }
        if oper == "/" {
            result = num1 / num2
        }
        lblResult.text = "결과: \(num1) \(oper) \(num2) = \(result)"
    }
}

