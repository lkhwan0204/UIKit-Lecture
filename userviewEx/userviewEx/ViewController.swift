//
//  ViewController.swift
//  userviewEx
//
//  Created by kyuhyeon Lee on 3/10/25.
//


import UIKit

class ViewController: UIViewController {
    
    private lazy var user: UserData = {
        return UserData(name: "Jeong", age: 28)
    }()
    
    private lazy var userView: UserView = {
        let view = UserView()
        view.increaseAgeBtn.addTarget(self, action: #selector(increaseBtnTapped), for: .touchUpInside)
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = userView
        self.view.backgroundColor = .white
        self.updateUserView()
    }
    
    private func updateUserView() {
        userView.nameLabel.text = "Name: \(user.name)"
        userView.ageLabel.text = "Age: \(user.age)"
    }

    @objc private func increaseBtnTapped() {
        user.increaseAge()
        updateUserView()
    }
}