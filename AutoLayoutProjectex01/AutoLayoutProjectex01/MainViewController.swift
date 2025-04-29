//
//  MainViewController.swift
//  AutoLayoutProjectex01
//
//  Created by kyuhyeon Lee on 3/4/25.
//


import UIKit

class MainViewController: UIViewController {

    let nameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "이름을 입력하세요"
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    let showDetailButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("다음 화면으로 이동", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupLayout()

        showDetailButton.addTarget(self, action: #selector(showDetailView), for: .touchUpInside)
    }

    func setupView() {
        view.backgroundColor = .white
        view.addSubview(nameTextField)
        view.addSubview(showDetailButton)
    }

    func setupLayout() {
        NSLayoutConstraint.activate([
            nameTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nameTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -20),
            nameTextField.widthAnchor.constraint(equalToConstant: 250),

            showDetailButton.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 20),
            showDetailButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }

    @objc func showDetailView() {
        let detailVC = DetailViewController()
        detailVC.receivedName = nameTextField.text  // 데이터 전달
        present(detailVC, animated: true, completion: nil)
    }
}
