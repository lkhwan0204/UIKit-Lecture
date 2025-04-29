//
//  DetailViewController.swift
//  AutoLayoutProjectex01
//
//  Created by kyuhyeon Lee on 3/4/25.
//


import UIKit

class DetailViewController: UIViewController {

    var receivedName: String?  // 데이터를 받을 프로퍼티

    let nameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let dismissButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("돌아가기", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupLayout()

        // 전달받은 데이터를 표시
        nameLabel.text = receivedName ?? "이름 없음"

        dismissButton.addTarget(self, action: #selector(dismissView), for: .touchUpInside)
    }

    func setupView() {
        view.backgroundColor = .lightGray
        view.addSubview(nameLabel)
        view.addSubview(dismissButton)
    }

    func setupLayout() {
        NSLayoutConstraint.activate([
            nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nameLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -20),

            dismissButton.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 20),
            dismissButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }

    @objc func dismissView() {
        dismiss(animated: true, completion: nil)
    }
}
