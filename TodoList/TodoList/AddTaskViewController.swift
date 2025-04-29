//
//  AddTaskViewController.swift
//  TodoList
//
//  Created by kyuhyeon Lee on 2/27/25.
//

import UIKit

class AddTaskViewController: UIViewController {
    
    @IBOutlet weak var textField: UITextField!
    var addTaskHandler: ((String) -> Void)?
    
    @IBAction func addTask(_ sender: UIButton) {
        if let task = textField.text, !task.isEmpty {
            addTaskHandler?(task)
            dismiss(animated: true)
        }
    }
}

