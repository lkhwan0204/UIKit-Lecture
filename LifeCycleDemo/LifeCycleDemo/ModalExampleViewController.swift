//
//  ModalExampleViewController.swift
//  LifeCycleDemo
//
//  Created by kyuhyeon Lee on 2/26/25.
//


import UIKit

class ModalExampleViewController: UIViewController {
    
    private lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 20
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private lazy var fullScreenButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("전체화면 모달", for: .normal)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(showFullScreenModal), for: .touchUpInside)
        return button
    }()
    
    private lazy var pageSheetButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("카드형 시트", for: .normal)
        button.backgroundColor = .systemGreen
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(showPageSheetModal), for: .touchUpInside)
        return button
    }()
    
    private lazy var formSheetButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("폼 시트", for: .normal)
        button.backgroundColor = .systemOrange
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(showFormSheetModal), for: .touchUpInside)
        return button
    }()
    
    private lazy var popoverButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("팝오버 (iPad)", for: .normal)
        button.backgroundColor = .systemPurple
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(showPopoverModal), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        view.backgroundColor = .systemBackground
        title = "모달 스타일 예제"
        
        view.addSubview(stackView)
        [fullScreenButton, pageSheetButton, formSheetButton, popoverButton].forEach {
            stackView.addArrangedSubview($0)
            $0.heightAnchor.constraint(equalToConstant: 50).isActive = true
        }
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40)
        ])
    }
    
    @objc private func showFullScreenModal() {
        let modalVC = ModalContentViewController(title: "전체화면 모달", style: .fullScreen, backgroundColor: .systemBlue)
        present(modalVC, animated: true)
    }
    
    @objc private func showPageSheetModal() {
        let modalVC = ModalContentViewController(title: "카드형 시트", style: .pageSheet, backgroundColor: .systemBlue)
        present(modalVC, animated: true)
    }
    
    @objc private func showFormSheetModal() {
        let modalVC = ModalContentViewController(title: "폼 시트", style: .formSheet, backgroundColor: .systemBlue)
        present(modalVC, animated: true)
    }
    
    @objc private func showPopoverModal() {
        let modalVC = ModalContentViewController(title: "팝오버", style: .popover, backgroundColor: .systemBlue)
        modalVC.popoverPresentationController?.sourceView = popoverButton
        modalVC.preferredContentSize = CGSize(width: 300, height: 200)
        present(modalVC, animated: true)
    }
} 
